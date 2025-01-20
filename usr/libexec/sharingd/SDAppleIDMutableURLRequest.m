@interface SDAppleIDMutableURLRequest
- (SDAppleIDMutableURLRequest)initWithURL:(id)a3 gsToken:(id)a4;
@end

@implementation SDAppleIDMutableURLRequest

- (SDAppleIDMutableURLRequest)initWithURL:(id)a3 gsToken:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SDAppleIDMutableURLRequest;
  v7 = [(SDAppleIDMutableURLRequest *)&v10 initWithURL:a3];
  v8 = v7;
  if (v7)
  {
    [(SDAppleIDMutableURLRequest *)v7 setHTTPShouldHandleCookies:0];
    [(SDAppleIDMutableURLRequest *)v8 setHTTPMethod:@"POST"];
    [(SDAppleIDMutableURLRequest *)v8 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if (qword_100980120 != -1) {
      dispatch_once(&qword_100980120, &stru_1008CEE58);
    }
    [(SDAppleIDMutableURLRequest *)v8 setValue:qword_100980118 forHTTPHeaderField:@"X-Mme-Client-Info"];
    if (qword_100980130 != -1) {
      dispatch_once(&qword_100980130, &stru_1008CEE78);
    }
    [(SDAppleIDMutableURLRequest *)v8 setValue:qword_100980128 forHTTPHeaderField:@"X-Mme-Device-ID"];
    [(SDAppleIDMutableURLRequest *)v8 setValue:v6 forHTTPHeaderField:@"X-Apple-GS-Token"];
  }

  return v8;
}

@end