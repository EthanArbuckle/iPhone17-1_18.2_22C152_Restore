@interface CameraCaptureServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC14dockaccessoryd28CameraCaptureServiceDelegate)init;
@end

@implementation CameraCaptureServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000BE758(v7);

  return v9 & 1;
}

- (_TtC14dockaccessoryd28CameraCaptureServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CameraCaptureServiceDelegate();
  return [(CameraCaptureServiceDelegate *)&v3 init];
}

@end