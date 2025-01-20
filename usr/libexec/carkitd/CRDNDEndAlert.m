@interface CRDNDEndAlert
+ (id)actions;
- (CRDNDEndAlert)initWithText:(id)a3;
- (NSString)internalText;
- (id)message;
- (id)title;
@end

@implementation CRDNDEndAlert

- (CRDNDEndAlert)initWithText:(id)a3
{
  id v5 = a3;
  v6 = [(CRBulletin *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_internalText, a3);
  }

  return v7;
}

- (id)title
{
  return @"[Internal] Do Not Disturb ended";
}

- (id)message
{
  return [(CRDNDEndAlert *)self internalText];
}

+ (id)actions
{
  v2 = +[CARDNDDiagnosticsService TTRURLforEvent:1];
  v3 = +[CRBulletin CARActionWithURL:v2 title:@"[Internal] File Radar"];
  v6 = v3;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

- (NSString)internalText
{
  return self->_internalText;
}

- (void).cxx_destruct
{
}

@end