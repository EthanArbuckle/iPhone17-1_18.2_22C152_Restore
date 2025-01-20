@interface VGBodyPoseFeedbackHelper
+ (id)feedbackToString:(unint64_t)a3;
@end

@implementation VGBodyPoseFeedbackHelper

+ (id)feedbackToString:(unint64_t)a3
{
  if (a3 > 7) {
    return @"unknown";
  }
  else {
    return (id)*((void *)&off_265570340 + a3);
  }
}

@end