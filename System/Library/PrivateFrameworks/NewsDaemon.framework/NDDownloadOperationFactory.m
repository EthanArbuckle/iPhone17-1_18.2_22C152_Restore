@interface NDDownloadOperationFactory
- (FCANFHelper)ANFHelper;
- (FCContentContext)context;
- (NDDownloadOperationFactory)initWithContext:(id)a3 ANFHelper:(id)a4;
- (id)_articleOperationForRequest:(id)a3;
- (id)_audioOperationForRequest:(id)a3;
- (id)_issueOperationForRequest:(id)a3;
- (id)_puzzleOperationForRequest:(id)a3;
- (id)operationForRequest:(id)a3;
- (int64_t)_operationFlagsForRequest:(id)a3;
@end

@implementation NDDownloadOperationFactory

- (NDDownloadOperationFactory)initWithContext:(id)a3 ANFHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NDDownloadOperationFactory;
  v9 = [(NDDownloadOperationFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_ANFHelper, a4);
  }

  return v10;
}

- (id)operationForRequest:(id)a3
{
  id v4 = a3;
  switch((unint64_t)[v4 contentType])
  {
    case 0uLL:
      v5 = [(NDDownloadOperationFactory *)self _articleOperationForRequest:v4];
      goto LABEL_6;
    case 1uLL:
      v5 = [(NDDownloadOperationFactory *)self _audioOperationForRequest:v4];
      goto LABEL_6;
    case 2uLL:
      v5 = [(NDDownloadOperationFactory *)self _issueOperationForRequest:v4];
      goto LABEL_6;
    case 3uLL:
      v5 = [(NDDownloadOperationFactory *)self _puzzleOperationForRequest:v4];
LABEL_6:
      self = v5;
      break;
    default:
      break;
  }

  return self;
}

- (id)_articleOperationForRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)FCOfflineArticleFetchOperation);
  v6 = [(NDDownloadOperationFactory *)self context];
  id v7 = [(NDDownloadOperationFactory *)self ANFHelper];
  id v8 = [v4 articleID];
  id v9 = [v5 initWithContext:v6 ANFHelper:v7 articleID:v8];

  int64_t v10 = [(NDDownloadOperationFactory *)self _operationFlagsForRequest:v4];
  [v9 setFlags:v10];
  [v9 setPurpose:FCOperationPurposeOfflineDownload];

  return v9;
}

- (id)_audioOperationForRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)FCOfflineAudioFetchOperation);
  v6 = [(NDDownloadOperationFactory *)self context];
  id v7 = [v4 articleID];
  id v8 = [v5 initWithContext:v6 articleID:v7];

  int64_t v9 = [(NDDownloadOperationFactory *)self _operationFlagsForRequest:v4];
  [v8 setFlags:v9];
  [v8 setPurpose:FCOperationPurposeOfflineDownload];

  return v8;
}

- (id)_issueOperationForRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)FCOfflineIssueFetchOperation);
  v6 = [(NDDownloadOperationFactory *)self context];
  id v7 = [(NDDownloadOperationFactory *)self ANFHelper];
  id v8 = [v4 issueID];
  id v9 = [v5 initWithContext:v6 ANFHelper:v7 issueID:v8];

  int64_t v10 = [(NDDownloadOperationFactory *)self _operationFlagsForRequest:v4];
  [v9 setFlags:v10];
  [v9 setPurpose:FCOperationPurposeOfflineDownload];

  return v9;
}

- (id)_puzzleOperationForRequest:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)FCOfflinePuzzleFetchOperation);
  v6 = [(NDDownloadOperationFactory *)self context];
  id v7 = [v4 puzzleID];
  id v8 = [v5 initWithContext:v6 puzzleID:v7];

  int64_t v9 = [(NDDownloadOperationFactory *)self _operationFlagsForRequest:v4];
  [v8 setFlags:v9];
  [v8 setPurpose:FCOperationPurposeOfflineDownload];

  return v8;
}

- (int64_t)_operationFlagsForRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (uint64_t)((void)[v3 options] << 63) >> 63;
  unsigned __int8 v5 = [v3 options];

  return v5 & 4 | (unint64_t)(v4 & 3);
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCANFHelper)ANFHelper
{
  return self->_ANFHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ANFHelper, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end