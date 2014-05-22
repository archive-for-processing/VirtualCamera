class Camera {

  Mouse mouse;
  PVector eye;
  PVector centre;
  PVector up;
  PVector angle;
  float fovy;
  float aspect;
  float zNear;
  float zFar;

  Camera(Mouse mouse) {
    this.mouse = mouse;
    eye = new PVector();
    centre = new PVector(0, 0, -1);
    up = new PVector(0, 1, 0);
    angle = new PVector();
    fovy = HALF_PI * 3 / 4;
    aspect = 4 / 3.075;
    zNear = 0.1;
    zFar = 1000;
    perspective(fovy, aspect, zNear, zFar);
  }

  PVector forwardPosition() {
    PVector distance = new PVector(sin(angle.x), 0, -cos(angle.x));
    PVector position = eye.get();
    position.add(distance);
    return position;
  }

  PVector backwardPosition() {
    PVector distance = new PVector(-sin(angle.x), 0, cos(angle.x));
    PVector position = eye.get();
    position.add(distance);
    return position;
  }

  PVector leftPosition() {
    PVector distance = new PVector(-sin(angle.x + HALF_PI), 0, cos(angle.x + HALF_PI));
    PVector position = eye.get();
    position.add(distance);
    return position;
  }

  PVector rightPosition() {
    PVector distance = new PVector(sin(angle.x + HALF_PI), 0, -cos(angle.x + HALF_PI));
    PVector position = eye.get();
    position.add(distance);
    return position;
  }

  void moveForward() {
    PVector distance = new PVector(sin(angle.x), 0, -cos(angle.x));
    eye.add(distance);
    centre.add(distance);
  }

  void moveBackward() {
    PVector distance = new PVector(-sin(angle.x), 0, cos(angle.x));
    eye.add(distance);
    centre.add(distance);
  }

  void strafeLeft() {
    PVector distance = new PVector(-sin(angle.x + HALF_PI), 0, cos(angle.x + HALF_PI));
    eye.add(distance);
    centre.add(distance);
  }

  void strafeRight() {
    PVector distance = new PVector(sin(angle.x + HALF_PI), 0, -cos(angle.x + HALF_PI));
    eye.add(distance);
    centre.add(distance);
  }

  void set() {
    angle.x = mouse.x() * TAU / (width - 1);
    angle.y = mouse.y() * QUARTER_PI * 3 / (height - 1);
    beginCamera();
    camera(eye.x, eye.y, eye.z, centre.x, centre.y, centre.z, up.x, up.y, up.z);
    translate(eye.x, eye.y, eye.z);
    rotateX(angle.y);
    rotateY(angle.x);
    translate(-centre.x, -centre.y, -centre.z);
    endCamera();
  }
}