@interface SUUITracklistPageComponent
- (SUUITracklistPageComponent)initWithViewElement:(id)a3;
- (int64_t)componentType;
@end

@implementation SUUITracklistPageComponent

- (SUUITracklistPageComponent)initWithViewElement:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUITracklistPageComponent;
  return [(SUUIPageComponent *)&v4 initWithViewElement:a3];
}

- (int64_t)componentType
{
  return 23;
}

@end