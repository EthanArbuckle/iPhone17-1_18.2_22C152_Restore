@interface PDFamilyCircleMemberPhotoRequest
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (NSArray)completionHandlers;
- (NSNumber)dsid;
- (NSString)description;
- (PDFamilyCircleMemberPhotoRequest)init;
- (PDFamilyCircleMemberPhotoRequest)initWithDSID:(id)a3;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)executeRequestWithManager:(id)a3 completion:(id)a4;
@end

@implementation PDFamilyCircleMemberPhotoRequest

- (PDFamilyCircleMemberPhotoRequest)init
{
  return [(PDFamilyCircleMemberPhotoRequest *)self initWithDSID:0];
}

- (PDFamilyCircleMemberPhotoRequest)initWithDSID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PDFamilyCircleMemberPhotoRequest;
  v6 = [(PDFamilyCircleMemberPhotoRequest *)&v10 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionHandlers = v6->_completionHandlers;
    v6->_completionHandlers = v7;

    objc_storeStrong((id *)&v6->_dsid, a3);
  }

  return v6;
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

- (unint64_t)requestType
{
  return 1;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDFamilyCircleMemberPhotoRequest *)self _canCoalesceRequest:v4];
  if (v5)
  {
    completionHandlers = self->_completionHandlers;
    v7 = [v4 completionHandlers];
    [(NSMutableArray *)completionHandlers addObjectsFromArray:v7];
  }
  return v5;
}

- (BOOL)_canCoalesceRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(PDFamilyCircleMemberPhotoRequest *)self requestType];
  if (v5 == [v4 requestType])
  {
    v6 = [v4 dsid];
    char v7 = PKEqualObjects();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)executeRequestWithManager:(id)a3 completion:(id)a4
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100364A94;
  v13[3] = &unk_10074B128;
  v13[4] = self;
  id v5 = a4;
  id v14 = v5;
  v6 = objc_retainBlock(v13);
  dsid = self->_dsid;
  v8 = PKLogFacilityTypeGetObject();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (dsid)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v16 = dsid;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Family member image request for dsid %@", buf, 0xCu);
    }

    id v10 = [objc_alloc((Class)FAFetchFamilyPhotoRequest) initWithFamilyMemberDSID:self->_dsid size:1 localFallback:1];
    [v10 setMonogramDiameter:100.0];
    [v10 setBackgroundType:1];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100364BBC;
    v11[3] = &unk_10074B150;
    v11[4] = self;
    v12 = v6;
    [v10 startRequestWithCompletionHandler:v11];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error: Cannot download image for family member because no dsid is defined.", buf, 2u);
    }

    ((void (*)(void *, void))v6[2])(v6, 0);
  }
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  unint64_t v4 = [(PDFamilyCircleMemberPhotoRequest *)self requestType];
  CFStringRef v5 = @"members";
  if (v4 == 1) {
    CFStringRef v5 = @"photo";
  }
  if (v4 == 2) {
    CFStringRef v5 = @"memberType";
  }
  [v3 appendFormat:@"requstType: '%@'; ", v5];
  [v3 appendFormat:@"dsid: '%@'; ", self->_dsid];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (NSArray)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end