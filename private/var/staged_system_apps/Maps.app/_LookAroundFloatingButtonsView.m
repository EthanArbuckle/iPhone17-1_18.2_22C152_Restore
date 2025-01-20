@interface _LookAroundFloatingButtonsView
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation _LookAroundFloatingButtonsView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100104084;
  v21 = sub_1001048C0;
  id v22 = 0;
  v8 = [(_LookAroundFloatingButtonsView *)self subviews];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100890BAC;
  v12[3] = &unk_1012FEC38;
  CGFloat v15 = x;
  CGFloat v16 = y;
  v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  v14 = &v17;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v12];

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

@end