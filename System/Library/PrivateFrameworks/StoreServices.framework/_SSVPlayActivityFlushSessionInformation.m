@interface _SSVPlayActivityFlushSessionInformation
- (NSIndexSet)revisionsIndexSet;
- (NSString)endpointIdentifier;
- (NSString)revisionVersionToken;
- (unint64_t)sessionToken;
- (void)setEndpointIdentifier:(id)a3;
- (void)setRevisionVersionToken:(id)a3;
- (void)setRevisionsIndexSet:(id)a3;
- (void)setSessionToken:(unint64_t)a3;
@end

@implementation _SSVPlayActivityFlushSessionInformation

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
}

- (NSIndexSet)revisionsIndexSet
{
  return self->_revisionsIndexSet;
}

- (void)setRevisionsIndexSet:(id)a3
{
}

- (NSString)revisionVersionToken
{
  return self->_revisionVersionToken;
}

- (void)setRevisionVersionToken:(id)a3
{
}

- (unint64_t)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(unint64_t)a3
{
  self->_sessionToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revisionVersionToken, 0);
  objc_storeStrong((id *)&self->_revisionsIndexSet, 0);
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
}

@end