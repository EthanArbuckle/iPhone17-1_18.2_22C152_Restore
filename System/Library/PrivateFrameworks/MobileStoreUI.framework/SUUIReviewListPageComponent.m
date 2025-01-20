@interface SUUIReviewListPageComponent
- (SUUIReviewListPageComponent)initWithViewElement:(id)a3;
- (int64_t)componentType;
@end

@implementation SUUIReviewListPageComponent

- (SUUIReviewListPageComponent)initWithViewElement:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIReviewListPageComponent;
  return [(SUUIPageComponent *)&v4 initWithViewElement:a3];
}

- (int64_t)componentType
{
  return 21;
}

@end