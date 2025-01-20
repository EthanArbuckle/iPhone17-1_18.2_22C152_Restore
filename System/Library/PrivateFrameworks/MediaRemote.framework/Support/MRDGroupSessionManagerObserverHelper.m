@interface MRDGroupSessionManagerObserverHelper
- (id)activeSessionDidChange;
- (id)didEndHostedGroupSession;
- (id)didJoinRemoteGroupSession;
- (id)didLeaveRemoteGroupSession;
- (id)didStartHostedGroupSession;
- (id)discoveredSessionsDidChange;
- (void)manager:(id)a3 activeSessionDidChange:(id)a4;
- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4;
- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4;
- (void)setActiveSessionDidChange:(id)a3;
- (void)setDidEndHostedGroupSession:(id)a3;
- (void)setDidJoinRemoteGroupSession:(id)a3;
- (void)setDidLeaveRemoteGroupSession:(id)a3;
- (void)setDidStartHostedGroupSession:(id)a3;
- (void)setDiscoveredSessionsDidChange:(id)a3;
@end

@implementation MRDGroupSessionManagerObserverHelper

- (void)manager:(id)a3 activeSessionDidChange:(id)a4
{
  activeSessionDidChange = (void (**)(id, id))self->_activeSessionDidChange;
  if (activeSessionDidChange) {
    activeSessionDidChange[2](activeSessionDidChange, a4);
  }
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
  didStartHostedGroupSession = (void (**)(id, id))self->_didStartHostedGroupSession;
  if (didStartHostedGroupSession) {
    didStartHostedGroupSession[2](didStartHostedGroupSession, a4);
  }
}

- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4
{
  didEndHostedGroupSession = (void (**)(id, id))self->_didEndHostedGroupSession;
  if (didEndHostedGroupSession) {
    didEndHostedGroupSession[2](didEndHostedGroupSession, a4);
  }
}

- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4
{
  didJoinRemoteGroupSession = (void (**)(id, id))self->_didJoinRemoteGroupSession;
  if (didJoinRemoteGroupSession) {
    didJoinRemoteGroupSession[2](didJoinRemoteGroupSession, a4);
  }
}

- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4
{
  didLeaveRemoteGroupSession = (void (**)(id, id))self->_didLeaveRemoteGroupSession;
  if (didLeaveRemoteGroupSession) {
    didLeaveRemoteGroupSession[2](didLeaveRemoteGroupSession, a4);
  }
}

- (void)manager:(id)a3 discoveredSessionsDidChange:(id)a4
{
  discoveredSessionsDidChange = (void (**)(id, id))self->_discoveredSessionsDidChange;
  if (discoveredSessionsDidChange) {
    discoveredSessionsDidChange[2](discoveredSessionsDidChange, a4);
  }
}

- (id)didStartHostedGroupSession
{
  return self->_didStartHostedGroupSession;
}

- (void)setDidStartHostedGroupSession:(id)a3
{
}

- (id)didEndHostedGroupSession
{
  return self->_didEndHostedGroupSession;
}

- (void)setDidEndHostedGroupSession:(id)a3
{
}

- (id)didJoinRemoteGroupSession
{
  return self->_didJoinRemoteGroupSession;
}

- (void)setDidJoinRemoteGroupSession:(id)a3
{
}

- (id)didLeaveRemoteGroupSession
{
  return self->_didLeaveRemoteGroupSession;
}

- (void)setDidLeaveRemoteGroupSession:(id)a3
{
}

- (id)discoveredSessionsDidChange
{
  return self->_discoveredSessionsDidChange;
}

- (void)setDiscoveredSessionsDidChange:(id)a3
{
}

- (id)activeSessionDidChange
{
  return self->_activeSessionDidChange;
}

- (void)setActiveSessionDidChange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_activeSessionDidChange, 0);
  objc_storeStrong(&self->_discoveredSessionsDidChange, 0);
  objc_storeStrong(&self->_didLeaveRemoteGroupSession, 0);
  objc_storeStrong(&self->_didJoinRemoteGroupSession, 0);
  objc_storeStrong(&self->_didEndHostedGroupSession, 0);

  objc_storeStrong(&self->_didStartHostedGroupSession, 0);
}

@end