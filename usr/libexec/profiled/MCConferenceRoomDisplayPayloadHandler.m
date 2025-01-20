@interface MCConferenceRoomDisplayPayloadHandler
- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6;
- (void)remove;
- (void)setAside;
@end

@implementation MCConferenceRoomDisplayPayloadHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  return 1;
}

- (void)remove
{
  v3 = [(MCNewPayloadHandler *)self profileHandler];
  unsigned __int8 v4 = [v3 isSetAside];

  if ((v4 & 1) == 0)
  {
    [(MCConferenceRoomDisplayPayloadHandler *)self _removeConferenceRoomDisplayConfiguration];
  }
}

- (void)setAside
{
}

@end