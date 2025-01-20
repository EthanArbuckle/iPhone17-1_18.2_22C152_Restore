@interface _TUISmartGridContentBuilder
- (BOOL)onlyInstantiateFirstChildPassingConditionForEnumeratorChildren;
- (void)configureCell:(id)a3;
- (void)configureWithChildNode:(id)a3 attributes:(id)a4;
@end

@implementation _TUISmartGridContentBuilder

- (void)configureWithChildNode:(id)a3 attributes:(id)a4
{
  uint64_t var0 = a3.var0;
  id v6 = a4;
  self->_rowSpan = (unint64_t)[v6 unsignedIntegerForAttribute:179 withDefault:1 node:var0];
  id v7 = [v6 unsignedIntegerForAttribute:55 withDefault:1 node:var0];

  self->_columnSpan = (unint64_t)v7;
}

- (BOOL)onlyInstantiateFirstChildPassingConditionForEnumeratorChildren
{
  return 1;
}

- (void)configureCell:(id)a3
{
  unint64_t columnSpan = self->_columnSpan;
  id v5 = a3;
  [v5 setColumnSpan:columnSpan];
  [v5 setRowSpan:self->_rowSpan];
}

@end