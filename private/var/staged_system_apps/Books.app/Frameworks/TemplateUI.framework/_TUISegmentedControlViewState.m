@interface _TUISegmentedControlViewState
- (_TUISegmentedControlViewState)initWithSelectIndex:(int64_t)a3;
- (int64_t)selectIndex;
@end

@implementation _TUISegmentedControlViewState

- (_TUISegmentedControlViewState)initWithSelectIndex:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_TUISegmentedControlViewState;
  result = [(_TUISegmentedControlViewState *)&v5 init];
  if (result) {
    result->_selectIndex = a3;
  }
  return result;
}

- (int64_t)selectIndex
{
  return self->_selectIndex;
}

@end