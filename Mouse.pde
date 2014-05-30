import java.awt.AWTException;
import java.awt.Robot;

class Mouse {

  Robot robot;
  boolean centred;
  int attempt;

  Mouse() {
    try {
      robot = new Robot();
    } catch (AWTException e) {
      e.printStackTrace();
      exit();
    }
    centred = false;
    attempt = 3;
  }

  boolean centred() {
    return centred;
  }

  int x() {
    return mouseX;
  }

  int y() {
    return (height / 2) - mouseY;
  }

  void centre() {
    robot.mouseMove(width / 2, height / 2);
    // Cursor centering works only on the third draw() call
    if (--attempt == 0) centred = true;
  }

  void move() {
    if (mouseX == 0) { // Wrap cursor horizontally
      robot.mouseMove(width - 1, mouseY);
    } else if (mouseX == width - 1) {
      robot.mouseMove(0, mouseY);
    }
  }
}