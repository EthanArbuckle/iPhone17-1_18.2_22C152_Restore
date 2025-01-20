@interface SAFrameSiblingsDeserializationHelper
- (NSArray)frameHelpers;
- (SAFrameSiblingsDeserializationHelper)initWithFrameHelpers:(id)a3;
- (unint64_t)index;
- (void)setFrameHelpers:(id)a3;
- (void)setIndex:(unint64_t)a3;
@end

@implementation SAFrameSiblingsDeserializationHelper

- (SAFrameSiblingsDeserializationHelper)initWithFrameHelpers:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SAFrameSiblingsDeserializationHelper;
  v6 = [(SAFrameSiblingsDeserializationHelper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_frameHelpers, a3);
    v8 = v7;
  }

  return v7;
}

- (NSArray)frameHelpers
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFrameHelpers:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
}

@end