@interface DOCDSFileServiceConnection
- (_TtC5Files26DOCDSFileServiceConnection)init;
@end

@implementation DOCDSFileServiceConnection

- (_TtC5Files26DOCDSFileServiceConnection)init
{
  v3 = &self->DSFileServiceConnection_opaque[OBJC_IVAR____TtC5Files26DOCDSFileServiceConnection_didUpdateInProgressFileOperationsHandler];
  v4 = (objc_class *)type metadata accessor for DOCDSFileServiceConnection();
  *(void *)v3 = 0;
  *((void *)v3 + 1) = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(DOCDSFileServiceConnection *)&v6 init];
}

- (void).cxx_destruct
{
}

@end