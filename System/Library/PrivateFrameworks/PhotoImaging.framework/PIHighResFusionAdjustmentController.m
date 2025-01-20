@interface PIHighResFusionAdjustmentController
+ (id)alignmentKey;
- (NSDictionary)alignment;
- (PIHighResFusionAdjustmentController)initWithAdjustment:(id)a3;
- (id)pasteKeysForMediaType:(int64_t)a3;
- (void)setAlignment:(id)a3;
@end

@implementation PIHighResFusionAdjustmentController

- (id)pasteKeysForMediaType:(int64_t)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setAlignment:(id)a3
{
  id v6 = (id)[a3 copy];
  v4 = [(PIAdjustmentController *)self adjustment];
  v5 = +[PIHighResFusionAdjustmentController alignmentKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (NSDictionary)alignment
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PIHighResFusionAdjustmentController alignmentKey];
  v4 = [v2 objectForKeyedSubscript:v3];

  return (NSDictionary *)v4;
}

- (PIHighResFusionAdjustmentController)initWithAdjustment:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PIHighResFusionAdjustmentController;
  return [(PIAdjustmentController *)&v4 initWithAdjustment:a3];
}

+ (id)alignmentKey
{
  return @"alignment";
}

@end