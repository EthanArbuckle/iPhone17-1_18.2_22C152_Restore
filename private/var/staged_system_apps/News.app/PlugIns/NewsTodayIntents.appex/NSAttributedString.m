@interface NSAttributedString
+ (id)fr_accessibilityAttributedStringForHighPriorityAnnouncement:(id)a3;
+ (id)fr_accessibilityAttributedStringForSpeakingStringInLowerPitch:(id)a3;
+ (id)fr_attributedString:(id)a3;
+ (id)fr_attributedStringWithString:(id)a3 font:(id)a4;
- (id)fr_accessibilityAttributedStringForHighPriorityAnnouncement;
@end

@implementation NSAttributedString

+ (id)fr_attributedString:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = objc_opt_new();
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [v4 copy];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  v8 = v7;

  return v8;
}

+ (id)fr_attributedStringWithString:(id)a3 font:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  NSAttributedStringKey v12 = NSFontAttributeName;
  id v13 = v6;
  v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  id v10 = [v8 initWithString:v7 attributes:v9];

  return v10;
}

+ (id)fr_accessibilityAttributedStringForSpeakingStringInLowerPitch:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSAttributedString);
  uint64_t v8 = UIAccessibilityTokenLowPitch;
  v9 = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = [v4 initWithString:v3 attributes:v5];

  return v6;
}

+ (id)fr_accessibilityAttributedStringForHighPriorityAnnouncement:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)NSAttributedString);
  uint64_t v8 = UIAccessibilityTokenAnnouncementPriority;
  v9 = &off_10001D708;
  id v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v6 = [v4 initWithString:v3 attributes:v5];

  return v6;
}

- (id)fr_accessibilityAttributedStringForHighPriorityAnnouncement
{
  id v2 = [(NSAttributedString *)self mutableCopy];
  [v2 addAttribute:UIAccessibilityTokenAnnouncementPriority value:&off_10001D708 range:0, [v2 length]];
  id v3 = [v2 copy];

  return v3;
}

@end