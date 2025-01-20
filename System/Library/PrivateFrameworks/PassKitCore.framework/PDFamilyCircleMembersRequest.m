@interface PDFamilyCircleMembersRequest
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)_isValidFamilyMember:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (BOOL)isPendingMembers;
- (NSArray)completionHandlers;
- (PDFamilyCircleMembersRequest)init;
- (id)_pkFamilyMemberArrayFromFAFamilyMemberArray:(id)a3;
- (unint64_t)cachePolicy;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)executeRequestWithManager:(id)a3 completion:(id)a4;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setPendingMembers:(BOOL)a3;
@end

@implementation PDFamilyCircleMembersRequest

- (PDFamilyCircleMembersRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)PDFamilyCircleMembersRequest;
  v2 = [(PDFamilyCircleMembersRequest *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;
  }
  return v2;
}

- (void)executeRequestWithManager:(id)a3 completion:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100009D50;
  v15[3] = &unk_1007346F0;
  v15[4] = self;
  id v16 = a4;
  id v5 = v16;
  objc_super v6 = objc_retainBlock(v15);
  id v7 = objc_alloc_init((Class)FAFetchFamilyCircleRequest);
  v8 = v7;
  unint64_t cachePolicy = self->_cachePolicy;
  uint64_t v10 = 1;
  if (cachePolicy == 1) {
    uint64_t v10 = 2;
  }
  if (cachePolicy == 2) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v10;
  }
  [v7 setCachePolicy:v11];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000A668;
  v13[3] = &unk_10074B100;
  v13[4] = self;
  id v14 = v6;
  v12 = v6;
  [v8 startRequestWithCompletionHandler:v13];
}

- (void)setPendingMembers:(BOOL)a3
{
  self->_pendingMembers = a3;
}

- (void)setCachePolicy:(unint64_t)a3
{
  self->_unint64_t cachePolicy = a3;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    [(NSMutableArray *)completionHandlers addObject:v4];
  }
}

- (void).cxx_destruct
{
}

- (unint64_t)requestType
{
  return 0;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDFamilyCircleMembersRequest *)self _canCoalesceRequest:v4];
  if (v5)
  {
    completionHandlers = self->_completionHandlers;
    id v7 = [v4 completionHandlers];
    [(NSMutableArray *)completionHandlers addObjectsFromArray:v7];
  }
  return v5;
}

- (BOOL)_canCoalesceRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFamilyCircleMembersRequest *)self requestType];
  if (v5 == [v4 requestType])
  {
    id v6 = v4;
    int pendingMembers = self->_pendingMembers;
    if (pendingMembers == [v6 isPendingMembers])
    {
      id cachePolicy = self->_cachePolicy;
      BOOL v9 = cachePolicy == [v6 cachePolicy] || self->_cachePolicy == 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_pkFamilyMemberArrayFromFAFamilyMemberArray:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [objc_alloc((Class)PKFamilyMember) initWithFAFamilyMember:v11];
        if ([(PDFamilyCircleMembersRequest *)self _isValidFamilyMember:v12])
        {
          [v5 safelyAddObject:v12];
        }
        else
        {
          v13 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = [v11 dictionary];
            *(_DWORD *)buf = 138412546;
            id v22 = v12;
            __int16 v23 = 2112;
            v24 = v14;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error!! Family Member has invalid data %@. FAFamilyMember: %@ Please file a radar.", buf, 0x16u);
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v8);
  }

  id v15 = [v5 copy];
  return v15;
}

- (BOOL)_isValidFamilyMember:(id)a3
{
  id v3 = a3;
  id v4 = [v3 status];
  if (v4 == (id)2)
  {
    id v5 = [v3 dsid];
    if (v5)
    {
      id v7 = [v3 altDSID];
      BOOL v6 = [v7 length] != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
    goto LABEL_8;
  }
  if (v4 == (id)1)
  {
    id v5 = [v3 inviteEmail];
    BOOL v6 = [v5 length] != 0;
LABEL_8:

    goto LABEL_9;
  }
  BOOL v6 = 0;
LABEL_9:

  return v6;
}

- (unint64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (BOOL)isPendingMembers
{
  return self->_pendingMembers;
}

- (NSArray)completionHandlers
{
  return &self->_completionHandlers->super;
}

@end