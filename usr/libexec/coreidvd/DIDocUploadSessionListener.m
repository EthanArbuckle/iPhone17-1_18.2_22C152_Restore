@interface DIDocUploadSessionListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8coreidvd26DIDocUploadSessionListener)init;
- (void)dealloc;
@end

@implementation DIDocUploadSessionListener

- (_TtC8coreidvd26DIDocUploadSessionListener)init
{
  return (_TtC8coreidvd26DIDocUploadSessionListener *)sub_100121660();
}

- (void)dealloc
{
  v2 = self;
  sub_100121880();
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_100122FDC(v7);

  return v9 & 1;
}

@end