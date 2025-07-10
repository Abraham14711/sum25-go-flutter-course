class FormValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    // Trim whitespace
    final trimmedEmail = email.trim();

    // Check length
    if (trimmedEmail.length > 100) {
      return 'Email is too long (max 100 characters)';
    }

    // Basic email format check
    if (!trimmedEmail.contains('@') || !trimmedEmail.contains('.') ||
        trimmedEmail.indexOf('@') > trimmedEmail.lastIndexOf('.')) {
      return 'Invalid email format';
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }

    bool hasLetter = false;
    bool hasNumber = false;

    for (var char in password.runes) {
      if (!hasLetter && _isLetter(char)) {
        hasLetter = true;
      }
      if (!hasNumber && _isNumber(char)) {
        hasNumber = true;
      }
      if (hasLetter && hasNumber) break;
    }

    if (!hasLetter || !hasNumber) {
      return 'Password must contain at least one letter and one number';
    }

    return null;
  }

  static String sanitizeText(String? text) {
    if (text == null) return '';
    
    // Remove < and > characters
    final cleaned = text.replaceAll(RegExp(r'[<>]'), '');
    // Trim whitespace
    return cleaned.trim();
  }

  static bool isValidLength(String? text, {int minLength = 1, int maxLength = 100}) {
    if (text == null) return false;
    final length = text.length;
    return length >= minLength && length <= maxLength;
  }

  // Helper methods
  static bool _isLetter(int char) {
    return (char >= 65 && char <= 90) || // A-Z
           (char >= 97 && char <= 122);  // a-z
  }

  static bool _isNumber(int char) {
    return char >= 48 && char <= 57; // 0-9
  }
}