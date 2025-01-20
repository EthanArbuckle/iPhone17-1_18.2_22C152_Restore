@interface _SSVPlayActivityEndpointRevisionInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSIndexSet)additionalPendingRevisionsIndexSet;
- (NSString)revisionVersionToken;
- (_SSVPlayActivityEndpointRevisionInformation)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)currentRevision;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalPendingRevisionsIndexSet:(id)a3;
- (void)setCurrentRevision:(unint64_t)a3;
- (void)setRevisionVersionToken:(id)a3;
@end

@implementation _SSVPlayActivityEndpointRevisionInformation

- (unint64_t)hash
{
  uint64_t v3 = [(NSIndexSet *)self->_additionalPendingRevisionsIndexSet hash];
  revisionVersionToken = self->_revisionVersionToken;
  unint64_t v5 = self->_currentRevision ^ v3;
  return v5 ^ [(NSString *)revisionVersionToken hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SSVPlayActivityEndpointRevisionInformation *)a3;
  if (v4 == self) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_currentRevision != v4->_currentRevision
    || (additionalPendingRevisionsIndexSet = self->_additionalPendingRevisionsIndexSet,
        additionalPendingRevisionsIndexSet != v4->_additionalPendingRevisionsIndexSet)
    && !-[NSIndexSet isEqualToIndexSet:](additionalPendingRevisionsIndexSet, "isEqualToIndexSet:"))
  {
    char v7 = 0;
    goto LABEL_10;
  }
  revisionVersionToken = self->_revisionVersionToken;
  if (revisionVersionToken == v4->_revisionVersionToken)
  {
LABEL_9:
    char v7 = 1;
    goto LABEL_10;
  }
  char v7 = -[NSString isEqualToString:](revisionVersionToken, "isEqualToString:");
LABEL_10:

  return v7;
}

- (_SSVPlayActivityEndpointRevisionInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (_SSVPlayActivityEndpointRevisionInformation *)[v4 decodeInt64ForKey:@"CurrentRevision"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RevisionVersionToken"];
    if ([v6 length])
    {
      char v7 = [(_SSVPlayActivityEndpointRevisionInformation *)self init];
      if (v7)
      {
        v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AdditionalPendingRevisions"];
        additionalPendingRevisionsIndexSet = v7->_additionalPendingRevisionsIndexSet;
        v7->_additionalPendingRevisionsIndexSet = v8;
        v10 = v8;

        v7->_currentRevision = (unint64_t)v5;
        objc_storeStrong((id *)&v7->_revisionVersionToken, v6);
      }
      self = v7;
      unint64_t v5 = self;
    }
    else
    {
      unint64_t v5 = 0;
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  additionalPendingRevisionsIndexSet = self->_additionalPendingRevisionsIndexSet;
  id v5 = a3;
  [v5 encodeObject:additionalPendingRevisionsIndexSet forKey:@"AdditionalPendingRevisions"];
  [v5 encodeInt64:self->_currentRevision forKey:@"CurrentRevision"];
  [v5 encodeObject:self->_revisionVersionToken forKey:@"RevisionVersionToken"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_additionalPendingRevisionsIndexSet);
    *(void *)(v5 + 16) = self->_currentRevision;
    objc_storeStrong((id *)(v5 + 24), self->_revisionVersionToken);
  }
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSIndexSet)additionalPendingRevisionsIndexSet
{
  return self->_additionalPendingRevisionsIndexSet;
}

- (void)setAdditionalPendingRevisionsIndexSet:(id)a3
{
}

- (unint64_t)currentRevision
{
  return self->_currentRevision;
}

- (void)setCurrentRevision:(unint64_t)a3
{
  self->_currentRevision = a3;
}

- (NSString)revisionVersionToken
{
  return self->_revisionVersionToken;
}

- (void)setRevisionVersionToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revisionVersionToken, 0);
  objc_storeStrong((id *)&self->_additionalPendingRevisionsIndexSet, 0);
}

@end