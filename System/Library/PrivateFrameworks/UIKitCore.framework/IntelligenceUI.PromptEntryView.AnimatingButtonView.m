@interface IntelligenceUI.PromptEntryView.AnimatingButtonView
+ (Class)_visualProviderClassForIdiom:(int64_t)a3;
- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019AnimatingButtonView)initWithCoder:(id)a3;
- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019AnimatingButtonView)initWithFrame:(CGRect)a3;
@end

@implementation IntelligenceUI.PromptEntryView.AnimatingButtonView

+ (Class)_visualProviderClassForIdiom:(int64_t)a3
{
  sub_1853B985C(0, (unint64_t *)&unk_1E8FB7150);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019AnimatingButtonView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)_s15PromptEntryViewC19AnimatingButtonViewCMa();
  return -[_UIIntelligenceButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019AnimatingButtonView)initWithCoder:(id)a3
{
  return (_TtCCO5UIKit14IntelligenceUI15PromptEntryViewP33_75F9C46457AA903D9A8178C1F5C6F21019AnimatingButtonView *)sub_185AAF814(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))_s15PromptEntryViewC19AnimatingButtonViewCMa);
}

@end