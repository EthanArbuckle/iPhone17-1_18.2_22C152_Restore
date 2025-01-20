@interface MobileDocumentReaderListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC8coreidvd28MobileDocumentReaderListener)init;
- (void)dealloc;
@end

@implementation MobileDocumentReaderListener

- (_TtC8coreidvd28MobileDocumentReaderListener)init
{
  return (_TtC8coreidvd28MobileDocumentReaderListener *)sub_10014E87C();
}

- (void)dealloc
{
  v2 = self;
  sub_10014EB50();
}

- (void).cxx_destruct
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  v7 = (objc_class *)a4;
  v8 = self;
  char v9 = sub_10014FAE8(v7);

  return v9 & 1;
}

@end