@interface MCLoggingPayloadHandler
- (BOOL)_installAndReturnError:(id *)a3;
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)_remove;
- (void)remove;
- (void)unsetAside;
@end

@implementation MCLoggingPayloadHandler

- (BOOL)_installAndReturnError:(id *)a3
{
  v3 = [(MCNewPayloadHandler *)self payload];
  v4 = [v3 loggingPayload];
  char v5 = MCOSLogInstallProfilePayload();

  return v5;
}

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  id v16 = 0;
  BOOL v8 = -[MCLoggingPayloadHandler _installAndReturnError:](self, "_installAndReturnError:", &v16, a4, a5);
  id v9 = v16;
  if (!v8)
  {
    uint64_t v10 = MCInstallationErrorDomain;
    v11 = [(MCNewPayloadHandler *)self payload];
    v12 = [v11 friendlyName];
    v13 = MCErrorArray();
    v14 = +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v10, 4001, v13, v9, MCErrorTypeFatal, v12, 0);

    if (a6) {
      *a6 = v14;
    }
  }
  return v8;
}

- (void)_remove
{
  id v3 = [(MCNewPayloadHandler *)self payload];
  v2 = [v3 loggingPayload];
  MCOSLogRemoveProfilePayload();
}

- (void)remove
{
  id v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    [(MCLoggingPayloadHandler *)self _remove];
  }
}

- (void)unsetAside
{
}

@end