@interface SSKUpdateDisplayTransformsAdapter
- (SSKUpdateDisplayTransformsAdapter)init;
- (SSKUpdateDisplayTransformsAdapter)initWithDisplayConfiguration:(id)a3 displayTransformUpdater:(id)a4;
- (void)displayUpdated:(id)a3;
@end

@implementation SSKUpdateDisplayTransformsAdapter

- (SSKUpdateDisplayTransformsAdapter)initWithDisplayConfiguration:(id)a3 displayTransformUpdater:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayTransformUpdater) = (Class)a4;
  v10.receiver = self;
  v10.super_class = ObjectType;
  id v8 = a3;
  swift_unknownObjectRetain();
  return [(SSKUpdateDisplayTransformsAdapter *)&v10 init];
}

- (SSKUpdateDisplayTransformsAdapter)init
{
  result = (SSKUpdateDisplayTransformsAdapter *)sub_25C47AF18();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

- (void)displayUpdated:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SSKUpdateDisplayTransformsAdapter_displayConfiguration) = (Class)a3;
  id v3 = a3;
}

@end