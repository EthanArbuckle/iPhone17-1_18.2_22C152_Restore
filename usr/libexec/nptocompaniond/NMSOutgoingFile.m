@interface NMSOutgoingFile
- (BOOL)bypassDuet;
- (BOOL)unlinkWhenSent;
- (NMSOutgoingFile)init;
- (NSDictionary)metadata;
- (NSDictionary)persistentUserInfo;
- (NSString)queueOneIdentifier;
- (NSURL)URL;
- (double)timeout;
- (unint64_t)priority;
- (unsigned)messageID;
- (void)setBypassDuet:(BOOL)a3;
- (void)setMessageID:(unsigned __int16)a3;
- (void)setMetadata:(id)a3;
- (void)setPersistentUserInfo:(id)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setQueueOneIdentifier:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setURL:(id)a3;
- (void)setUnlinkWhenSent:(BOOL)a3;
@end

@implementation NMSOutgoingFile

- (NMSOutgoingFile)init
{
  v3.receiver = self;
  v3.super_class = (Class)NMSOutgoingFile;
  result = [(NMSOutgoingFile *)&v3 init];
  if (result)
  {
    result->_priority = 2;
    *(void *)&result->_timeout = IDSMaxMessageTimeout;
  }
  return result;
}

- (unsigned)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(unsigned __int16)a3
{
  self->_messageID = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSDictionary)persistentUserInfo
{
  return self->_persistentUserInfo;
}

- (void)setPersistentUserInfo:(id)a3
{
}

- (BOOL)unlinkWhenSent
{
  return self->_unlinkWhenSent;
}

- (void)setUnlinkWhenSent:(BOOL)a3
{
  self->_unlinkWhenSent = a3;
}

- (NSString)queueOneIdentifier
{
  return self->_queueOneIdentifier;
}

- (void)setQueueOneIdentifier:(id)a3
{
}

- (BOOL)bypassDuet
{
  return self->_bypassDuet;
}

- (void)setBypassDuet:(BOOL)a3
{
  self->_bypassDuet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueOneIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentUserInfo, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end