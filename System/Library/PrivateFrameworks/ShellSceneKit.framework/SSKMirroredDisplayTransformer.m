@interface SSKMirroredDisplayTransformer
- (BOOL)derivesDisplays;
- (BOOL)shouldTransformConnectingDisplays;
- (SSKMirroredDisplayTransformer)init;
- (void)transformPhysicalDisplayWith:(id)a3;
@end

@implementation SSKMirroredDisplayTransformer

- (void)transformPhysicalDisplayWith:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = (id)sub_25C47AA78();
  objc_msgSend(a3, sel_setUniqueIdentifier_, v6);
  swift_unknownObjectRelease();
}

- (BOOL)derivesDisplays
{
  return 1;
}

- (BOOL)shouldTransformConnectingDisplays
{
  return 1;
}

- (SSKMirroredDisplayTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MirroredDisplayTransformer();
  return [(SSKMirroredDisplayTransformer *)&v3 init];
}

@end