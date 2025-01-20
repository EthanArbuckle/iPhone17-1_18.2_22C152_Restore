@interface MRAirPlayTransportConnection
- (APReceiverMediaRemoteCommunicationChannel)apCommunicationChannel;
- (AVOutputContextCommunicationChannel)outputContextCommunicationChannel;
- (AVOutputDeviceCommunicationChannel)outputDeviceCommunicationChannel;
- (BOOL)channelClosed;
- (BOOL)isValid;
- (MRAirPlayTransportConnection)initWithAPCommunicationChannel:(id)a3;
- (MRAirPlayTransportConnection)initWithOutputContextCommunicationChannel:(id)a3 outputContext:(id)a4;
- (MRAirPlayTransportConnection)initWithOutputDeviceCommunicationChannel:(id)a3;
- (MROSTransaction)transaction;
- (NSDate)dateCreated;
- (NSDate)mostRecentMessageReceivedDate;
- (NSDate)mostRecentMessageSentDate;
- (NSString)debugDescription;
- (NSString)description;
- (id)_init;
- (id)effectiveChannel;
- (unint64_t)_sendTransportData:(id)a3;
- (unint64_t)sendTransportData:(id)a3 options:(id)a4;
- (unint64_t)totalBytesReceivedCount;
- (unint64_t)totalBytesSentCount;
- (unint64_t)totalMessagesReceivedCount;
- (unint64_t)totalMessagesSentCount;
- (void)closeWithError:(id)a3;
- (void)communicationChannel:(id)a3 didReceiveData:(id)a4;
- (void)communicationChannelDidClose:(id)a3;
- (void)ingestData:(id)a3;
- (void)setChannelClosed:(BOOL)a3;
- (void)setDateCreated:(id)a3;
- (void)setMostRecentMessageReceivedDate:(id)a3;
- (void)setMostRecentMessageSentDate:(id)a3;
- (void)setTotalBytesReceivedCount:(unint64_t)a3;
- (void)setTotalBytesSentCount:(unint64_t)a3;
- (void)setTotalMessagesReceivedCount:(unint64_t)a3;
- (void)setTotalMessagesSentCount:(unint64_t)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MRAirPlayTransportConnection

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)MRAirPlayTransportConnection;
  v2 = [(MRExternalDeviceTransportConnection *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] now];
    dateCreated = v2->_dateCreated;
    v2->_dateCreated = (NSDate *)v3;

    v5 = [MROSTransaction alloc];
    v6 = (void *)[[NSString alloc] initWithFormat:@"com.apple.mediaremote.%@.%p", objc_opt_class(), v2];
    uint64_t v7 = [(MROSTransaction *)v5 initWithName:v6];
    transaction = v2->_transaction;
    v2->_transaction = (MROSTransaction *)v7;

    MRRegisterTransaction(v2->_transaction);
  }
  return v2;
}

- (MRAirPlayTransportConnection)initWithAPCommunicationChannel:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(MRAirPlayTransportConnection *)self _init];
  uint64_t v7 = (MRAirPlayTransportConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 8, a3);
    v8 = MRLogCategoryConnections();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Creating new connection with APChannel %@", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

- (MRAirPlayTransportConnection)initWithOutputContextCommunicationChannel:(id)a3 outputContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [(MRAirPlayTransportConnection *)self _init];
  int v10 = (MRAirPlayTransportConnection *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 9, a3);
    v11 = [v8 outputDevices];
    uint64_t v12 = [v11 firstObject];

    v13 = [v12 ID];
    [(MRExternalDeviceTransportConnection *)v10 setDestinationOutputDeviceUID:v13];

    v14 = MRLogCategoryConnections();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543874;
      id v17 = v8;
      __int16 v18 = 2114;
      v19 = v12;
      __int16 v20 = 2114;
      v21 = v10;
      _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Creating new connection with outputContext %{public}@ with pilotOutputDevice <%{public}@> with outputContextChannel %{public}@", (uint8_t *)&v16, 0x20u);
    }
  }
  return v10;
}

- (MRAirPlayTransportConnection)initWithOutputDeviceCommunicationChannel:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [(MRAirPlayTransportConnection *)self _init];
  id v7 = (MRAirPlayTransportConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 10, a3);
    [(AVOutputDeviceCommunicationChannel *)v7->_outputDeviceCommunicationChannel setDelegate:v7];
    id v8 = MRLogCategoryConnections();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = v7;
      _os_log_impl(&dword_194F3C000, v8, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Creating new connection with OutputDeviceChannel %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRAirPlayTransportConnection *)self effectiveChannel];
  v6 = (void *)[v3 initWithFormat:@"<%@:%p %@>\n", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(MRAirPlayTransportConnection *)v2 effectiveChannel];
  dateCreated = v2->_dateCreated;
  [(NSDate *)dateCreated timeIntervalSinceNow];
  double v8 = v7;
  mostRecentMessageSentDate = v2->_mostRecentMessageSentDate;
  [(NSDate *)mostRecentMessageSentDate timeIntervalSinceNow];
  double v11 = v10;
  unint64_t totalMessagesSentCount = v2->_totalMessagesSentCount;
  unint64_t totalBytesSentCount = v2->_totalBytesSentCount;
  mostRecentMessageReceivedDate = v2->_mostRecentMessageReceivedDate;
  [(NSDate *)mostRecentMessageReceivedDate timeIntervalSinceNow];
  int v16 = (void *)[v3 initWithFormat:@"<%@:%p {\n  communicationChannel = %@\n  dateCreated = %@ (%lf seconds ago)\n  mostRecentMessageSentDate = %@ (%lf seconds ago)\n  totalMessagesSent = %lu\n  totalBytesSent = %lu\n  mostRecentMessageReceivedDate = %@ (%lf seconds ago)\n  totalMessagesReceived = %lu\n  totalBytesReceived = %lu\n}>", v4, v2, v5, dateCreated, -v8, mostRecentMessageSentDate, -v11, totalMessagesSentCount, totalBytesSentCount, mostRecentMessageReceivedDate, -v15, v2->_totalMessagesReceivedCount, v2->_totalBytesReceivedCount];

  objc_sync_exit(v2);

  return (NSString *)v16;
}

- (void)ingestData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MRLogCategoryConnections();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = self;
    _os_log_impl(&dword_194F3C000, v5, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Connection received data %@ from %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = self;
  objc_sync_enter(v6);
  ++v6->_totalMessagesReceivedCount;
  v6->_totalBytesReceivedCount += [v4 length];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
  mostRecentMessageReceivedDate = v6->_mostRecentMessageReceivedDate;
  v6->_mostRecentMessageReceivedDate = (NSDate *)v7;

  objc_sync_exit(v6);
  [(MRExternalDeviceTransportConnection *)v6 _notifyDelegateDidReceiveData:v4];
}

- (BOOL)isValid
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(MRAirPlayTransportConnection *)v2 effectiveChannel];
  BOOL v4 = v3 != 0;

  objc_sync_exit(v2);
  return v4;
}

- (unint64_t)sendTransportData:(id)a3 options:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = [(MRAirPlayTransportConnection *)self effectiveChannel];

  if (v8)
  {
    int v9 = MRLogCategoryConnections();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2114;
      __int16 v18 = self;
      _os_log_impl(&dword_194F3C000, v9, OS_LOG_TYPE_DEFAULT, "[MRAirPlayTransportConnection] Connection sent data %@ to %{public}@", (uint8_t *)&v15, 0x16u);
    }

    id v10 = self;
    objc_sync_enter(v10);
    ++v10->_totalMessagesSentCount;
    v10->_totalBytesSentCount += [v6 length];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    mostRecentMessageSentDate = v10->_mostRecentMessageSentDate;
    v10->_mostRecentMessageSentDate = (NSDate *)v11;

    objc_sync_exit(v10);
    unint64_t v13 = [(MRAirPlayTransportConnection *)v10 _sendTransportData:v6];
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (unint64_t)_sendTransportData:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__MRAirPlayTransportConnection__sendTransportData___block_invoke;
  v8[3] = &unk_1E57D1148;
  v8[4] = self;
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1997190F0](v8);
  [(APReceiverMediaRemoteCommunicationChannel *)self->_apCommunicationChannel sendData:v4 completionHandler:v5];
  [(AVOutputContextCommunicationChannel *)self->_outputContextCommunicationChannel sendData:v4 completionHandler:v5];
  [(AVOutputDeviceCommunicationChannel *)self->_outputDeviceCommunicationChannel sendData:v4 completionHandler:v5];
  unint64_t v6 = [v4 length];

  return v6;
}

void __51__MRAirPlayTransportConnection__sendTransportData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = MRLogCategoryConnections();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl(&dword_194F3C000, v4, OS_LOG_TYPE_ERROR, "[MRAirPlayTransportConnection] Connection error %@ sending data to %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)closeWithError:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(MRAirPlayTransportConnection *)v4 effectiveChannel];

  if (v5)
  {
    if (v4->_apCommunicationChannel)
    {
      int v6 = [[MRSetConnectionStateMessage alloc] initWithConnectionState:3];
      [(MRProtocolMessage *)v6 setError:v13];
      id v7 = [(MRProtocolMessage *)v6 protobufData];
      __int16 v8 = objc_msgSend(MEMORY[0x1E4F779A0], "createHeader:", objc_msgSend(v7, "length"));
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [v9 appendData:v8];
      [v9 appendData:v7];
      [(MRAirPlayTransportConnection *)v4 _sendTransportData:v9];
    }
    v4->_channelClosed = 1;
    apCommunicationChannel = v4->_apCommunicationChannel;
    v4->_apCommunicationChannel = 0;

    outputContextCommunicationChannel = v4->_outputContextCommunicationChannel;
    v4->_outputContextCommunicationChannel = 0;

    [(AVOutputDeviceCommunicationChannel *)v4->_outputDeviceCommunicationChannel close];
    [(AVOutputDeviceCommunicationChannel *)v4->_outputDeviceCommunicationChannel setDelegate:0];
    outputDeviceCommunicationChannel = v4->_outputDeviceCommunicationChannel;
    v4->_outputDeviceCommunicationChannel = 0;

    objc_sync_exit(v4);
    [(MRExternalDeviceTransportConnection *)v4 _notifyDelegateDidCloseWithError:v13];
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)communicationChannel:(id)a3 didReceiveData:(id)a4
{
}

- (void)communicationChannelDidClose:(id)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:105 description:@"AVOutputDeviceCommunicationChannel.communicationChannelDidClose"];
  [(MRAirPlayTransportConnection *)self closeWithError:v4];
}

- (id)effectiveChannel
{
  apCommunicationChannel = self->_apCommunicationChannel;
  if (!apCommunicationChannel)
  {
    apCommunicationChannel = self->_outputContextCommunicationChannel;
    if (!apCommunicationChannel) {
      apCommunicationChannel = self->_outputDeviceCommunicationChannel;
    }
  }
  return apCommunicationChannel;
}

- (APReceiverMediaRemoteCommunicationChannel)apCommunicationChannel
{
  return self->_apCommunicationChannel;
}

- (AVOutputContextCommunicationChannel)outputContextCommunicationChannel
{
  return self->_outputContextCommunicationChannel;
}

- (AVOutputDeviceCommunicationChannel)outputDeviceCommunicationChannel
{
  return self->_outputDeviceCommunicationChannel;
}

- (BOOL)channelClosed
{
  return self->_channelClosed;
}

- (void)setChannelClosed:(BOOL)a3
{
  self->_channelClosed = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
}

- (NSDate)mostRecentMessageSentDate
{
  return self->_mostRecentMessageSentDate;
}

- (void)setMostRecentMessageSentDate:(id)a3
{
}

- (unint64_t)totalMessagesSentCount
{
  return self->_totalMessagesSentCount;
}

- (void)setTotalMessagesSentCount:(unint64_t)a3
{
  self->_unint64_t totalMessagesSentCount = a3;
}

- (unint64_t)totalBytesSentCount
{
  return self->_totalBytesSentCount;
}

- (void)setTotalBytesSentCount:(unint64_t)a3
{
  self->_unint64_t totalBytesSentCount = a3;
}

- (NSDate)mostRecentMessageReceivedDate
{
  return self->_mostRecentMessageReceivedDate;
}

- (void)setMostRecentMessageReceivedDate:(id)a3
{
}

- (unint64_t)totalMessagesReceivedCount
{
  return self->_totalMessagesReceivedCount;
}

- (void)setTotalMessagesReceivedCount:(unint64_t)a3
{
  self->_totalMessagesReceivedCount = a3;
}

- (unint64_t)totalBytesReceivedCount
{
  return self->_totalBytesReceivedCount;
}

- (void)setTotalBytesReceivedCount:(unint64_t)a3
{
  self->_totalBytesReceivedCount = a3;
}

- (MROSTransaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_mostRecentMessageReceivedDate, 0);
  objc_storeStrong((id *)&self->_mostRecentMessageSentDate, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_outputDeviceCommunicationChannel, 0);
  objc_storeStrong((id *)&self->_outputContextCommunicationChannel, 0);

  objc_storeStrong((id *)&self->_apCommunicationChannel, 0);
}

@end