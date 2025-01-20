@interface ICCloudSyncingObjectMoveAction
- (BOOL)isCopy;
- (ICCloudSyncingObject)fromParentObject;
- (ICCloudSyncingObject)object;
- (ICCloudSyncingObject)toParentObject;
- (ICCloudSyncingObjectMoveAction)init;
- (ICCloudSyncingObjectMoveAction)initWithFolder:(id)a3 toParentObject:(id)a4 isCopy:(BOOL)a5;
- (ICCloudSyncingObjectMoveAction)initWithNote:(id)a3 toFolder:(id)a4 isCopy:(BOOL)a5;
- (ICCloudSyncingObjectMoveAction)initWithObject:(id)a3 fromParentObject:(id)a4 toParentObject:(id)a5 isCopy:(BOOL)a6;
- (ICCloudSyncingObjectMoveAction)initWithType:(int64_t)a3 object:(id)a4 fromParentObject:(id)a5 toParentObject:(id)a6 isCopy:(BOOL)a7;
- (int64_t)type;
@end

@implementation ICCloudSyncingObjectMoveAction

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_type);
}

- (ICCloudSyncingObject)object
{
  return (ICCloudSyncingObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object));
}

- (ICCloudSyncingObject)fromParentObject
{
  return (ICCloudSyncingObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject));
}

- (ICCloudSyncingObject)toParentObject
{
  return (ICCloudSyncingObject *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject));
}

- (BOOL)isCopy
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy);
}

- (ICCloudSyncingObjectMoveAction)initWithType:(int64_t)a3 object:(id)a4 fromParentObject:(id)a5 toParentObject:(id)a6 isCopy:(BOOL)a7
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_type) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_object) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_fromParentObject) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject) = (Class)a6;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_isCopy) = a7;
  v18.receiver = self;
  v18.super_class = ObjectType;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  return [(ICCloudSyncingObjectMoveAction *)&v18 init];
}

- (ICCloudSyncingObjectMoveAction)initWithObject:(id)a3 fromParentObject:(id)a4 toParentObject:(id)a5 isCopy:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  return (ICCloudSyncingObjectMoveAction *)ICCloudSyncingObject.MoveAction.init(object:fromParentObject:toParentObject:isCopy:)(v9, a4, a5, a6);
}

- (ICCloudSyncingObjectMoveAction)initWithFolder:(id)a3 toParentObject:(id)a4 isCopy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 parent];
  if (!v10) {
    id v10 = [v8 account];
  }
  id v11 = [(ICCloudSyncingObjectMoveAction *)self initWithObject:v8 fromParentObject:v10 toParentObject:v9 isCopy:v5];

  return v11;
}

- (ICCloudSyncingObjectMoveAction)initWithNote:(id)a3 toFolder:(id)a4 isCopy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 folder];
  id v11 = [(ICCloudSyncingObjectMoveAction *)self initWithObject:v8 fromParentObject:v10 toParentObject:v9 isCopy:v5];

  return v11;
}

- (ICCloudSyncingObjectMoveAction)init
{
  result = (ICCloudSyncingObjectMoveAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCloudSyncingObjectMoveAction_toParentObject);
}

@end