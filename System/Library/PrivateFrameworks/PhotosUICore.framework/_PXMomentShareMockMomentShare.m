@interface _PXMomentShareMockMomentShare
+ (_PXMomentShareMockMomentShare)momentShareWithStatus:(unsigned __int16)a3 photosCount:(unint64_t)a4 videosCount:(unint64_t)a5 uploadedPhotosCount:(unint64_t)a6 uploadedVideosCount:(unint64_t)a7;
- (NSArray)localizedLocationNames;
- (NSDate)endDate;
- (NSDate)expiryDate;
- (NSDate)startDate;
- (NSString)localizedTitle;
- (NSString)uuid;
- (NSURL)shareURL;
- (_PXMomentShareMockMomentShare)initWithStatus:(unsigned __int16)a3 assetCount:(unint64_t)a4 photosCount:(unint64_t)a5 videosCount:(unint64_t)a6 uploadedPhotosCount:(unint64_t)a7 uploadedVideosCount:(unint64_t)a8 shareURL:(id)a9 expiryDate:(id)a10 localizedTitle:(id)a11 startDate:(id)a12 endDate:(id)a13;
- (id)localizedDateDescriptionWithOptions:(unint64_t)a3;
- (int64_t)aggregateMediaType;
- (int64_t)px_highlightKind;
- (int64_t)px_momentShareType;
- (unint64_t)assetCount;
- (unint64_t)estimatedAssetCount;
- (unint64_t)photosCount;
- (unint64_t)uploadedPhotosCount;
- (unint64_t)uploadedVideosCount;
- (unint64_t)videosCount;
- (unsigned)px_highlightEnrichmentState;
- (unsigned)status;
@end

@implementation _PXMomentShareMockMomentShare

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedLocationNames, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

- (int64_t)px_highlightKind
{
  return self->_px_highlightKind;
}

- (unsigned)px_highlightEnrichmentState
{
  return self->_px_highlightEnrichmentState;
}

- (unint64_t)estimatedAssetCount
{
  return self->_estimatedAssetCount;
}

- (NSArray)localizedLocationNames
{
  return self->_localizedLocationNames;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (unint64_t)uploadedVideosCount
{
  return self->_uploadedVideosCount;
}

- (unint64_t)uploadedPhotosCount
{
  return self->_uploadedPhotosCount;
}

- (unint64_t)videosCount
{
  return self->_videosCount;
}

- (unint64_t)photosCount
{
  return self->_photosCount;
}

- (unint64_t)assetCount
{
  return self->_assetCount;
}

- (unsigned)status
{
  return self->_status;
}

- (id)localizedDateDescriptionWithOptions:(unint64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXMomentShareStatusMock.m" lineNumber:499 description:@"not implemented yet"];

  abort();
}

- (int64_t)px_momentShareType
{
  int v2 = [(_PXMomentShareMockMomentShare *)self status];
  if ((v2 - 2) < 2) {
    return 1;
  }
  if (!v2)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    v5 = [NSString stringWithUTF8String:"-[_PXMomentShareMockMomentShare px_momentShareType]"];
    [v4 handleFailureInFunction:v5 file:@"PXMomentShareStatusMock.m" lineNumber:486 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 0;
}

- (int64_t)aggregateMediaType
{
  unint64_t v3 = [(_PXMomentShareMockMomentShare *)self photosCount];
  unint64_t v4 = [(_PXMomentShareMockMomentShare *)self videosCount];
  int64_t result = [(_PXMomentShareMockMomentShare *)self assetCount];
  if (result)
  {
    if (v4 || v3 != result)
    {
      if (v4 == result && v3 == 0) {
        return 2;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (NSString)uuid
{
  id v3 = [NSString alloc];
  unint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"%@-%p", v5, self];

  return (NSString *)v6;
}

- (_PXMomentShareMockMomentShare)initWithStatus:(unsigned __int16)a3 assetCount:(unint64_t)a4 photosCount:(unint64_t)a5 videosCount:(unint64_t)a6 uploadedPhotosCount:(unint64_t)a7 uploadedVideosCount:(unint64_t)a8 shareURL:(id)a9 expiryDate:(id)a10 localizedTitle:(id)a11 startDate:(id)a12 endDate:(id)a13
{
  id v18 = a9;
  id v19 = a10;
  v20 = (__CFString *)a11;
  id v21 = a12;
  id v22 = a13;
  v33.receiver = self;
  v33.super_class = (Class)_PXMomentShareMockMomentShare;
  v23 = [(_PXMomentShareMockMomentShare *)&v33 init];
  v24 = v23;
  if (v23)
  {
    v23->_status = a3;
    v23->_assetCount = a4;
    v23->_photosCount = a5;
    v23->_videosCount = a6;
    v23->_uploadedPhotosCount = a7;
    v23->_uploadedVideosCount = a8;
    v25 = v18;
    if (!v18)
    {
      v25 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1F00B0030];
    }
    objc_storeStrong((id *)&v24->_shareURL, v25);
    if (!v18) {

    }
    v26 = v19;
    if (!v19)
    {
      v26 = [MEMORY[0x1E4F1C9C8] distantFuture];
    }
    objc_storeStrong((id *)&v24->_expiryDate, v26);
    if (!v19) {

    }
    if (v20) {
      v27 = v20;
    }
    else {
      v27 = &stru_1F00B0030;
    }
    objc_storeStrong((id *)&v24->_localizedTitle, v27);
    v28 = v21;
    if (!v21)
    {
      v28 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    objc_storeStrong((id *)&v24->_startDate, v28);
    if (!v21) {

    }
    v29 = v22;
    if (!v22)
    {
      v29 = [MEMORY[0x1E4F1C9C8] date];
    }
    objc_storeStrong((id *)&v24->_endDate, v29);
    if (!v22) {

    }
    v24->_estimatedAssetCount = a4;
    v24->_px_highlightKind = -1;
  }

  return v24;
}

+ (_PXMomentShareMockMomentShare)momentShareWithStatus:(unsigned __int16)a3 photosCount:(unint64_t)a4 videosCount:(unint64_t)a5 uploadedPhotosCount:(unint64_t)a6 uploadedVideosCount:(unint64_t)a7
{
  v7 = [[_PXMomentShareMockMomentShare alloc] initWithStatus:a3 assetCount:a5 + a4 photosCount:a4 videosCount:a5 uploadedPhotosCount:a6 uploadedVideosCount:a7 shareURL:0 expiryDate:0 localizedTitle:0 startDate:0 endDate:0];
  return v7;
}

@end