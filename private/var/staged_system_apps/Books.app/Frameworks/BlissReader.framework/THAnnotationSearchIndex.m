@interface THAnnotationSearchIndex
- (THAnnotationStorageController)annotationStorageController;
- (id)p_createModelSearchResultForTerm:(id)a3 searchContext:(id)a4 occurrence:(id *)a5 occurrenceIndex:(unsigned int)a6 previousEntry:(id)a7;
- (void)addTermsForAnnotation:(id)a3;
- (void)setAnnotationStorageController:(id)a3;
@end

@implementation THAnnotationSearchIndex

- (void)addTermsForAnnotation:(id)a3
{
  v5 = (__CFString *)objc_msgSend(objc_msgSend(a3, "annotationNote"), "tsu_stringByReplacingCharactersInSet:withCharacter:", self->super.mParagraphBreakCharacterSet, 8233);
  v27.length = (CFIndex)[(__CFString *)v5 length];
  v27.location = 0;
  CFStringTokenizerRef v6 = CFStringTokenizerCreate(0, v5, v27, 2uLL, 0);
  if (v6)
  {
    v7 = v6;
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    if (CFStringTokenizerAdvanceToNextToken(v7))
    {
      tokenizer = v7;
      do
      {
        CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v7);
        CFStringTokenizerRef v9 = CFStringTokenizerCreate(0, v5, CurrentTokenRange, 0, 0);
        if (v9)
        {
          v10 = v9;
          while (CFStringTokenizerAdvanceToNextToken(v10))
          {
            CFRange v29 = CFStringTokenizerGetCurrentTokenRange(v10);
            id v11 = [(__CFString *)(id)(id)CFStringCreateWithSubstring(0, v5, v29) lowercaseString];
            id v12 = [(TSLStemmer *)self->super.mStemmer stemWord:v11];
            uint64_t v21 = 0;
            v22 = &v21;
            uint64_t v23 = 0x3052000000;
            v24 = sub_1D4678;
            v25 = sub_1D4688;
            uint64_t v26 = 0;
            mTerms = self->super.mTerms;
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_1D4694;
            v20[3] = &unk_459410;
            v20[4] = v12;
            v20[5] = &v21;
            [(TSLSearchTree *)mTerms enumerateWordsForPrefix:v12 withBlock:v20];
            id v14 = (id)v22[5];
            if (!v14)
            {
              id v14 = [(THSearchIndex *)self addTermWithStem:v12];
              v22[5] = (uint64_t)v14;
            }
            id v15 = [v14 inflections];
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_1D46EC;
            v19[3] = &unk_458870;
            v19[4] = v11;
            id v16 = [v15 tsu_firstObjectPassingTest:v19];
            if (!v16) {
              id v16 = [(id)v22[5] addInflection:v11];
            }
            v17 = [(char *)[v8 objectForKey:v11] unsignedIntegerValue] + 1;
            [v8 setObject:[NSNumber numberWithUnsignedInteger:v17] forKey:v11];
            [v16 addOccurrence:[a3 annotationUuid] rank:100 paragraphIndex:v17 pageNumber:[a3 annotationAbsolutePhysicalPageIndex] displayPageNumber:0];
            _Block_object_dispose(&v21, 8);
          }
          CFRelease(v10);
        }
        v7 = tokenizer;
      }
      while (CFStringTokenizerAdvanceToNextToken(tokenizer));
    }

    CFRelease(v7);
  }
}

- (id)p_createModelSearchResultForTerm:(id)a3 searchContext:(id)a4 occurrence:(id *)a5 occurrenceIndex:(unsigned int)a6 previousEntry:(id)a7
{
  id v8 = [[THModelSearchResult alloc] initWithTerm:a3 annotation:[(THAnnotationStorageController *)[(THAnnotationSearchIndex *)self annotationStorageController] annotationWithUuid:a5->var4] pageNumber:a5->var2 displayPageNumber:0 occurrenceIndex:a6 context:a4];
  if (a7) {
    -[THModelSearchResult setOccurenceCount:](v8, "setOccurenceCount:", (char *)[a7 occurenceCount] + 1);
  }
  return v8;
}

- (THAnnotationStorageController)annotationStorageController
{
  return self->_annotationStorageController;
}

- (void)setAnnotationStorageController:(id)a3
{
  self->_annotationStorageController = (THAnnotationStorageController *)a3;
}

@end