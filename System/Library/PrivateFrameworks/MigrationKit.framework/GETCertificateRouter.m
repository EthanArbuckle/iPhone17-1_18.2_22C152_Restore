@interface GETCertificateRouter
- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5;
@end

@implementation GETCertificateRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  v7 = *(void **)self->cert;
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  swift_retain();
  id v11 = objc_msgSend(v7, sel_encodedCertificate);
  uint64_t v12 = sub_22C01DF18();
  unint64_t v14 = v13;

  id v15 = (id)sub_22C01DF08();
  sub_22BFE6770(v12, v14);
  objc_msgSend(v10, sel_setBody_, v15);

  swift_release();
}

@end