@interface _UICanvasFeedbackGeneratorConfiguration
+ (id)defaultConfiguration;
- (NSArray)feedbackKeyPaths;
- (NSArray)hidFeedbackPatternNameKeyPaths;
- (NSString)pathCompletingFeedbackPatternName;
- (NSString)snappingFeedbackPatternName;
- (NSString)snappingTrackpadFeedbackPatternName;
- (_TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration)init;
- (_UIFeedbackDiscretePlayable)pathCompletingFeedback;
- (_UIFeedbackDiscretePlayable)snappingFeedback;
- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5;
- (int64_t)requiredPeripheralSupportLevel;
- (int64_t)requiredSupportLevel;
- (void)setPathCompletingFeedback:(id)a3;
- (void)setPathCompletingFeedbackPatternName:(id)a3;
- (void)setSnappingFeedback:(id)a3;
- (void)setSnappingFeedbackPatternName:(id)a3;
- (void)setSnappingTrackpadFeedbackPatternName:(id)a3;
@end

@implementation _UICanvasFeedbackGeneratorConfiguration

- (_UIFeedbackDiscretePlayable)snappingFeedback
{
  return (_UIFeedbackDiscretePlayable *)sub_185A42030(self, (uint64_t)a2, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__snappingFeedback);
}

- (void)setSnappingFeedback:(id)a3
{
}

- (_UIFeedbackDiscretePlayable)pathCompletingFeedback
{
  return (_UIFeedbackDiscretePlayable *)sub_185A42030(self, (uint64_t)a2, &OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__pathCompletingFeedback);
}

- (void)setPathCompletingFeedback:(id)a3
{
}

- (NSArray)feedbackKeyPaths
{
  return (NSArray *)sub_185A425DC(self, (uint64_t)a2, (void (*)(void))sub_185A42118);
}

- (int64_t)requiredSupportLevel
{
  return -1;
}

- (int64_t)requiredPeripheralSupportLevel
{
  return 1;
}

+ (id)defaultConfiguration
{
  swift_getObjCClassMetadata();
  v2 = (void *)sub_185A422A8();
  return v2;
}

- (NSString)snappingFeedbackPatternName
{
  return (NSString *)sub_185A4250C();
}

- (void)setSnappingFeedbackPatternName:(id)a3
{
}

- (NSString)snappingTrackpadFeedbackPatternName
{
  return (NSString *)sub_185A4250C();
}

- (void)setSnappingTrackpadFeedbackPatternName:(id)a3
{
}

- (NSString)pathCompletingFeedbackPatternName
{
  return (NSString *)sub_185A4250C();
}

- (void)setPathCompletingFeedbackPatternName:(id)a3
{
}

- (NSArray)hidFeedbackPatternNameKeyPaths
{
  return (NSArray *)sub_185A425DC(self, (uint64_t)a2, (void (*)(void))sub_185A42644);
}

- (id)_alternateFeedback:(id)a3 forDevice:(int64_t)a4 senderID:(unint64_t)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = sub_185A4280C(v8, a4, a5);

  return v10;
}

- (_TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration)init
{
  return (_TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration *)sub_185A42AC4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__snappingFeedback));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC5UIKit39_UICanvasFeedbackGeneratorConfiguration__pathCompletingFeedback));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end