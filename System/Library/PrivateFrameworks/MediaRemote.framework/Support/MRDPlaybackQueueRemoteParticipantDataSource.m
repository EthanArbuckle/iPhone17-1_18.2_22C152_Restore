@interface MRDPlaybackQueueRemoteParticipantDataSource
- (MRDPlaybackQueueRemoteParticipantDataSource)initWithDelegate:(id)a3;
- (MRDPlaybackQueueRemoteParticipantDataSourceDelegate)delegate;
- (NSArray)participants;
- (OS_dispatch_queue)delegateQueue;
- (os_unfair_lock_s)lock;
- (void)setParticipants:(id)a3;
- (void)updateParticipants:(id)a3;
@end

@implementation MRDPlaybackQueueRemoteParticipantDataSource

- (MRDPlaybackQueueRemoteParticipantDataSource)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = +[MRUserSettings currentSettings];
  unsigned int v6 = [v5 supportGroupSessionAttribution];

  if (v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)MRDPlaybackQueueRemoteParticipantDataSource;
    v7 = [(MRDPlaybackQueueRemoteParticipantDataSource *)&v16 init];
    v8 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeWeak((id *)&v7->_delegate, v4);
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = sub_100118314();
      dispatch_queue_t v11 = dispatch_queue_create_with_target_V2("com.apple.amp.MediaRemote.MRDPlaybackQueueRemoteParticipantDataSource.delegateQueue", v9, v10);
      delegateQueue = v8->_delegateQueue;
      v8->_delegateQueue = (OS_dispatch_queue *)v11;

      participants = v8->_participants;
      v8->_participants = (NSArray *)&__NSArray0__struct;
    }
    self = v8;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSArray)participants
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_participants;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (void)updateParticipants:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_participants, a3);
  unsigned int v6 = _MRLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[MRDPlaybackQueueRemoteParticipantDataSource] Updated participants: %@", buf, 0xCu);
  }

  os_unfair_lock_unlock(&self->_lock);
  v7 = [(MRDPlaybackQueueRemoteParticipantDataSource *)self delegate];
  if (v7)
  {
    v8 = [(MRDPlaybackQueueRemoteParticipantDataSource *)self delegateQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001186A8;
    block[3] = &unk_1004159B8;
    id v10 = v7;
    dispatch_queue_t v11 = self;
    id v12 = v5;
    dispatch_async(v8, block);
  }
}

- (void)setParticipants:(id)a3
{
}

- (MRDPlaybackQueueRemoteParticipantDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRDPlaybackQueueRemoteParticipantDataSourceDelegate *)WeakRetained;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_participants, 0);
}

@end