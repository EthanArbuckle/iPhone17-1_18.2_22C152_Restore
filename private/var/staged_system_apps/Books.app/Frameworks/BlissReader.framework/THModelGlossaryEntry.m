@interface THModelGlossaryEntry
- (BOOL)containsPrefix:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)loadedFromApplePub;
- (NSString)applePubRelativePath;
- (NSString)normalizedTerm;
- (NSString)term;
- (THModelGlossary)glossary;
- (THModelGlossaryEntry)initWithContext:(id)a3 parent:(id)a4 applePubRelativePath:(id)a5 andTerm:(id)a6;
- (id)description;
- (id)normalizedPrefixSearchStrings;
- (id)storageAnchorAfterAnchor:(id)a3 forNthInstance:(unint64_t)a4 ofSearchString:(id)a5;
- (id)summaryText;
- (unint64_t)hash;
- (void)dealloc;
- (void)loadInfoOnComplete:(id)a3;
- (void)p_didLoadInfo:(id)a3 onComplete:(id)a4;
- (void)p_loadInfoOnComplete:(id)a3;
- (void)setApplePubRelativePath:(id)a3;
- (void)setGlossary:(id)a3;
- (void)setLoadedFromApplePub:(BOOL)a3;
- (void)setTerm:(id)a3;
- (void)synchronouslyLoadInfoOnComplete:(id)a3;
@end

@implementation THModelGlossaryEntry

- (THModelGlossary)glossary
{
  return self->mGlossary;
}

- (void)setGlossary:(id)a3
{
  self->mGlossary = (THModelGlossary *)a3;
}

- (NSString)term
{
  return self->mTerm;
}

- (void)setTerm:(id)a3
{
  [(THModelGlossaryEntry *)self willModify];
  id v5 = a3;

  self->mTerm = (NSString *)a3;
}

- (NSString)applePubRelativePath
{
  return self->mApplePubRelativePath;
}

- (void)setApplePubRelativePath:(id)a3
{
  [(THModelGlossaryEntry *)self willModify];
  id v5 = a3;

  self->mApplePubRelativePath = (NSString *)a3;
}

- (BOOL)loadedFromApplePub
{
  return self->mLoadedFromApplePub;
}

- (void)setLoadedFromApplePub:(BOOL)a3
{
  self->mLoadedFromApplePub = a3;
}

- (THModelGlossaryEntry)initWithContext:(id)a3 parent:(id)a4 applePubRelativePath:(id)a5 andTerm:(id)a6
{
  v13.receiver = self;
  v13.super_class = (Class)THModelGlossaryEntry;
  v9 = [(THModelGlossaryEntry *)&v13 initWithContext:a3];
  v10 = v9;
  if (v9)
  {
    v9->mGlossary = (THModelGlossary *)a4;
    v11 = [[THModelGlossaryEntryFlushable alloc] initWithParent:v9];
    v10->mFlushable = v11;
    [(THModelGlossaryEntryFlushable *)v11 ownerRetain];
    v10->mApplePubRelativePath = (NSString *)[a5 copy];
    v10->mTerm = (NSString *)[a6 copy];
  }
  return v10;
}

- (void)dealloc
{
  self->mGlossary = 0;

  self->mTerm = 0;
  self->mApplePubRelativePath = 0;

  self->mNormalizedPrefixSearchStrings = 0;
  [(THModelGlossaryEntryFlushable *)self->mFlushable ownerRelease];
  self->mFlushable = 0;
  v3.receiver = self;
  v3.super_class = (Class)THModelGlossaryEntry;
  [(THModelGlossaryEntry *)&v3 dealloc];
}

- (void)p_didLoadInfo:(id)a3 onComplete:(id)a4
{
  id v6 = a3;
  v7 = (void (*)(id, THModelGlossaryEntry *, id))*((void *)a4 + 2);

  v7(a4, self, v6);
}

- (void)p_loadInfoOnComplete:(id)a3
{
  id v5 = [[THGlossaryEntryInfo alloc] initWithEntry:self body:self->mFlushable];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_B4838;
  v6[3] = &unk_457360;
  v6[4] = self;
  v6[5] = v5;
  v6[6] = a3;
  [+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue") addOperation:+[NSBlockOperation blockOperationWithBlock:v6]];
}

- (void)loadInfoOnComplete:(id)a3
{
  v4 = _Block_copy(a3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_B48FC;
  v5[3] = &unk_456E88;
  v5[4] = self;
  v5[5] = v4;
  [(NSOperationQueue *)[(THModelGlossary *)self->mGlossary loadingQueue] addOperation:+[NSBlockOperation blockOperationWithBlock:v5]];
}

- (void)synchronouslyLoadInfoOnComplete:(id)a3
{
  id v5 = [[THGlossaryEntryInfo alloc] initWithEntry:self body:self->mFlushable];

  [(THModelGlossaryEntry *)self p_didLoadInfo:v5 onComplete:a3];
}

- (id)normalizedPrefixSearchStrings
{
  id result = self->mNormalizedPrefixSearchStrings;
  if (!result)
  {
    id result = [(NSString *)[(THModelGlossaryEntry *)self term] normalizedStringsForPrefixSearch];
    self->mNormalizedPrefixSearchStrings = (NSArray *)result;
  }
  return result;
}

- (NSString)normalizedTerm
{
  id v2 = [(THModelGlossaryEntry *)self normalizedPrefixSearchStrings];

  return (NSString *)[v2 objectAtIndex:0];
}

- (BOOL)containsPrefix:(id)a3
{
  id v4 = [(THModelGlossaryEntry *)self normalizedPrefixSearchStrings];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) hasPrefix:a3])
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

- (id)summaryText
{
  id v2 = [[THGlossaryEntryInfo alloc] initWithEntry:self body:self->mFlushable];
  objc_super v3 = [(THGlossaryEntryInfo *)v2 bodyStorage];
  if ([(THWPStorage *)v3 paragraphCount])
  {
    id v4 = [(THWPStorage *)v3 textRangeForParagraphAtIndex:0];
    id v6 = -[THWPStorage substringWithRange:](v3, "substringWithRange:", v4, v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)storageAnchorAfterAnchor:(id)a3 forNthInstance:(unint64_t)a4 ofSearchString:(id)a5
{
  return a3;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)THModelGlossaryEntry;
  return [(-[THModelGlossaryEntry description](&v3, "description")) stringByAppendingFormat:@" %@", -[THModelGlossaryEntry term](self, "term")];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  id v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    mApplePubRelativePath = self->mApplePubRelativePath;
    if (mApplePubRelativePath)
    {
      id v6 = [v4 applePubRelativePath];
      uint64_t v7 = mApplePubRelativePath;
    }
    else
    {
      mTerm = self->mTerm;
      id v6 = [v4 term];
      uint64_t v7 = mTerm;
    }
    LOBYTE(v4) = [(NSString *)v7 isEqual:v6];
  }
  return (char)v4;
}

- (unint64_t)hash
{
  if (self->mApplePubRelativePath) {
    mApplePubRelativePath = self->mApplePubRelativePath;
  }
  else {
    mApplePubRelativePath = self->mTerm;
  }
  return [(NSString *)mApplePubRelativePath hash];
}

@end