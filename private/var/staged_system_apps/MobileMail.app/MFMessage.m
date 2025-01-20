@interface MFMessage
- (id)mf_conversationReference;
- (id)mf_documentReference;
- (id)mf_externalReference;
@end

@implementation MFMessage

- (id)mf_externalReference
{
  return [(MFMessage *)self externalReference];
}

- (id)mf_conversationReference
{
  id v2 = [(MFMessage *)self conversationID];

  return sub_10020AF84((uint64_t)v2);
}

- (id)mf_documentReference
{
  id v2 = [(MFMessage *)self documentID];
  v3 = [v2 UUIDString];

  if (v3)
  {
    v4 = sub_10020B024(v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end