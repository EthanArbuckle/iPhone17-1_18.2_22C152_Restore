@interface PDShareChange
- (NSString)sender;
- (PKPassShare)oldShare;
- (PKPassShare)updatedShare;
- (unint64_t)_sharedEntitlementsChangeType;
- (unint64_t)type;
- (void)setOldShare:(id)a3;
- (void)setSender:(id)a3;
- (void)setUpdatedShare:(id)a3;
@end

@implementation PDShareChange

- (unint64_t)type
{
  updatedShare = self->_updatedShare;
  oldShare = self->_oldShare;
  if (updatedShare)
  {
    if (oldShare)
    {
      id v5 = [(PKPassShare *)updatedShare status];
      if (v5 == [(PKPassShare *)self->_oldShare status])
      {
        return [(PDShareChange *)self _sharedEntitlementsChangeType];
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  else if (oldShare)
  {
    return 3;
  }
  else
  {
    return 0;
  }
}

- (unint64_t)_sharedEntitlementsChangeType
{
  oldShare = self->_oldShare;
  if (!oldShare || !self->_updatedShare) {
    return 4;
  }
  v4 = [(PKPassShare *)oldShare sharedEntitlements];
  id v5 = objc_msgSend(v4, "pk_indexDictionaryByApplyingBlock:", &stru_100748480);
  id v6 = [v5 mutableCopy];

  v7 = [(PKPassShare *)self->_updatedShare sharedEntitlements];
  v8 = objc_msgSend(v7, "pk_indexDictionaryByApplyingBlock:", &stru_1007484A0);

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v9 = [v6 count];
  if (v9 == [v8 count])
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1002FFAC4;
    v13[3] = &unk_1007484C8;
    id v10 = v6;
    id v14 = v10;
    v15 = &v21;
    v16 = &v17;
    [v8 enumerateKeysAndObjectsUsingBlock:v13];
    if ([v10 count]) {
      *((unsigned char *)v22 + 24) = 1;
    }

    if (*((unsigned char *)v22 + 24))
    {
      unint64_t v11 = 1;
    }
    else if (*((unsigned char *)v18 + 24))
    {
      unint64_t v11 = 2;
    }
    else
    {
      unint64_t v11 = 4;
    }
  }
  else
  {
    unint64_t v11 = 1;
    *((unsigned char *)v22 + 24) = 1;
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

- (PKPassShare)updatedShare
{
  return self->_updatedShare;
}

- (void)setUpdatedShare:(id)a3
{
}

- (PKPassShare)oldShare
{
  return self->_oldShare;
}

- (void)setOldShare:(id)a3
{
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_oldShare, 0);
  objc_storeStrong((id *)&self->_updatedShare, 0);
}

@end