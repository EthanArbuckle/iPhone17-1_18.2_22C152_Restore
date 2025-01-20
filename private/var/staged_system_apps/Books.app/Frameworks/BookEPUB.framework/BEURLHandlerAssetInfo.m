@interface BEURLHandlerAssetInfo
- (BOOL)assetIsInsideBookRootPath;
- (BOOL)requestedRangeIsWholeAsset;
- (NSData)sinfData;
- (NSString)bookEpubId;
- (NSString)bookEpubIdWithUUIDScheme;
- (NSString)bookID;
- (NSString)compressionAlgorithm;
- (NSString)encryptionAlgorithm;
- (NSString)mimeType;
- (NSString)path;
- (NSURL)requestedURL;
- (_BERequestedRange)requestedRange;
- (unint64_t)fileSize;
- (void)setAssetIsInsideBookRootPath:(BOOL)a3;
- (void)setBookEpubId:(id)a3;
- (void)setBookEpubIdWithUUIDScheme:(id)a3;
- (void)setBookID:(id)a3;
- (void)setCompressionAlgorithm:(id)a3;
- (void)setEncryptionAlgorithm:(id)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setMimeType:(id)a3;
- (void)setPath:(id)a3;
- (void)setRequestedRange:(_BERequestedRange)a3;
- (void)setRequestedURL:(id)a3;
- (void)setSinfData:(id)a3;
@end

@implementation BEURLHandlerAssetInfo

- (BOOL)requestedRangeIsWholeAsset
{
  if (self->_requestedRange.beginOffset) {
    return 0;
  }
  unint64_t endOffset = self->_requestedRange.endOffset;
  if (!endOffset) {
    return 1;
  }
  return endOffset == -1 || endOffset == self->_fileSize;
}

- (NSString)compressionAlgorithm
{
  return self->_compressionAlgorithm;
}

- (void)setCompressionAlgorithm:(id)a3
{
}

- (NSString)encryptionAlgorithm
{
  return self->_encryptionAlgorithm;
}

- (void)setEncryptionAlgorithm:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)bookID
{
  return self->_bookID;
}

- (void)setBookID:(id)a3
{
}

- (NSString)bookEpubId
{
  return self->_bookEpubId;
}

- (void)setBookEpubId:(id)a3
{
}

- (NSString)bookEpubIdWithUUIDScheme
{
  return self->_bookEpubIdWithUUIDScheme;
}

- (void)setBookEpubIdWithUUIDScheme:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
}

- (BOOL)assetIsInsideBookRootPath
{
  return self->_assetIsInsideBookRootPath;
}

- (void)setAssetIsInsideBookRootPath:(BOOL)a3
{
  self->_assetIsInsideBookRootPath = a3;
}

- (NSURL)requestedURL
{
  return self->_requestedURL;
}

- (void)setRequestedURL:(id)a3
{
}

- (_BERequestedRange)requestedRange
{
  unint64_t endOffset = self->_requestedRange.endOffset;
  unint64_t beginOffset = self->_requestedRange.beginOffset;
  result.unint64_t endOffset = endOffset;
  result.unint64_t beginOffset = beginOffset;
  return result;
}

- (void)setRequestedRange:(_BERequestedRange)a3
{
  self->_requestedRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedURL, 0);
  objc_storeStrong((id *)&self->_sinfData, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bookEpubIdWithUUIDScheme, 0);
  objc_storeStrong((id *)&self->_bookEpubId, 0);
  objc_storeStrong((id *)&self->_bookID, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_encryptionAlgorithm, 0);

  objc_storeStrong((id *)&self->_compressionAlgorithm, 0);
}

@end