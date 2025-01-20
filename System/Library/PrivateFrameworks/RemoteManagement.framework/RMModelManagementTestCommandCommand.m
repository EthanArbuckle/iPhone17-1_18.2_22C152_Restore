@interface RMModelManagementTestCommandCommand
- (BOOL)rm_requestExecutesWithoutReturning;
- (void)rm_executeRequestOnBehalfOfManagementChannel:(id)a3 completionHandler:(id)a4;
@end

@implementation RMModelManagementTestCommandCommand

- (void)rm_executeRequestOnBehalfOfManagementChannel:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v6 = [(RMModelManagementTestCommandCommand *)self payloadReturnStatus];
  unsigned int v7 = [v6 isEqualToString:@"Executed"];

  if (v7)
  {
    CFStringRef v18 = @"Echo";
    v8 = [(RMModelManagementTestCommandCommand *)self payloadEcho];
    v19 = v8;
    __int16 v9 = 1;
    v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    v11 = [(RMModelManagementTestCommandCommand *)self unknownPayloadKeys];
    v12 = [v11 allObjects];
  }
  else
  {
    v13 = [(RMModelManagementTestCommandCommand *)self payloadReturnStatus];
    int v14 = [v13 isEqualToString:@"Failed"];

    __int16 v9 = 2;
    if (v14)
    {
      v10 = 0;
      v12 = 0;
    }
    else
    {
      v15 = [(RMModelManagementTestCommandCommand *)self payloadReturnStatus];
      unsigned int v16 = [v15 isEqualToString:@"Pending"];

      v10 = 0;
      v12 = 0;
      if (v16) {
        __int16 v9 = 3;
      }
      else {
        __int16 v9 = 2;
      }
    }
  }
  v17 = [(RMModelManagementTestCommandCommand *)self commandIdentifier];
  (*((void (**)(id, void *, void, void *, void, void *, void))v5 + 2))(v5, v17, v9, v10, 0, v12, 0);
}

- (BOOL)rm_requestExecutesWithoutReturning
{
  return 0;
}

@end