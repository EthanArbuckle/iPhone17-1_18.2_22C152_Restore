@interface CRLWPTextKnob
- (BOOL)worksWithStylus;
- (CRLWPTextKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7;
- (id)createKnobRenderable;
- (unint64_t)dragType;
@end

@implementation CRLWPTextKnob

- (CRLWPTextKnob)initWithType:(unint64_t)a3 position:(CGPoint)a4 radius:(double)a5 tag:(unint64_t)a6 onRep:(id)a7
{
  v10.receiver = self;
  v10.super_class = (Class)CRLWPTextKnob;
  v7 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](&v10, "initWithType:position:radius:tag:onRep:", a3, a6, a7, a4.x, a4.y, a5);
  v8 = v7;
  if (v7) {
    [(CRLCanvasKnob *)v7 setWorksWhenEditingDisabled:1];
  }
  return v8;
}

- (unint64_t)dragType
{
  return 1;
}

- (id)createKnobRenderable
{
  v4.receiver = self;
  v4.super_class = (Class)CRLWPTextKnob;
  v2 = [(CRLCanvasKnob *)&v4 createKnobRenderable];
  if (+[CRLFeatureFlagGroup isRedesignedTextCursorEnabled])
  {
    [v2 setOpacity:0.0];
  }

  return v2;
}

- (BOOL)worksWithStylus
{
  return 1;
}

@end