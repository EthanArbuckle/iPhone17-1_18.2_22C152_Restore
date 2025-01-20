@interface TokenizerOutputObjc
- (NSData)tokenIds;
- (NSData)tokenRanges;
- (NSData)wordIndexes;
- (TokenizerOutputObjc)initWithTokenIds:(id)a3 tokenRanges:(id)a4 wordIndexes:(id)a5;
@end

@implementation TokenizerOutputObjc

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordIndexes, 0);
  objc_storeStrong((id *)&self->_tokenRanges, 0);
  objc_storeStrong((id *)&self->_tokenIds, 0);
}

- (NSData)wordIndexes
{
  return self->_wordIndexes;
}

- (NSData)tokenRanges
{
  return self->_tokenRanges;
}

- (NSData)tokenIds
{
  return self->_tokenIds;
}

- (TokenizerOutputObjc)initWithTokenIds:(id)a3 tokenRanges:(id)a4 wordIndexes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TokenizerOutputObjc;
  v12 = [(TokenizerOutputObjc *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tokenIds, a3);
    objc_storeStrong((id *)&v13->_tokenRanges, a4);
    objc_storeStrong((id *)&v13->_wordIndexes, a5);
  }

  return v13;
}

@end