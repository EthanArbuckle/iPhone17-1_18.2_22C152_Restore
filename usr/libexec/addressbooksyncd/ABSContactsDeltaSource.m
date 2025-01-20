@interface ABSContactsDeltaSource
+ (int64_t)estimatedLogCountForAnchor:(id)a3 store:(id)a4;
- (ABSContactsDeltaSource)initWithAnchor:(id)a3 keys:(id)a4 store:(id)a5;
- (BOOL)_primeWithAnchor:(id)a3 andKeys:(id)a4;
- (BOOL)containsInterestingChanges;
- (BOOL)keepGoing;
- (BOOL)reset;
- (NSEnumerator)changeLogEnumerator;
- (double)_computeProgressMultiplier;
- (double)currentIndex;
- (double)progress;
- (double)progressMultiplier;
- (id)addReplaceBlock;
- (id)deleteBlock;
- (id)fetchJustOneContactWithThese:(id)a3 forThisIdentifier:(id)a4;
- (int64_t)addMods;
- (int64_t)deletes;
- (void)_callAddReplace:(id)a3;
- (void)enumerateContactsAdd:(id)a3 remove:(id)a4;
- (void)setAddMods:(int64_t)a3;
- (void)setAddReplaceBlock:(id)a3;
- (void)setChangeLogEnumerator:(id)a3;
- (void)setCurrentIndex:(double)a3;
- (void)setDeleteBlock:(id)a3;
- (void)setDeletes:(int64_t)a3;
- (void)setKeepGoing:(BOOL)a3;
- (void)setProgressMultiplier:(double)a3;
- (void)setReset:(BOOL)a3;
- (void)visitAddContactEvent:(id)a3;
- (void)visitDeleteContactEvent:(id)a3;
- (void)visitDifferentMeCardEvent:(id)a3;
- (void)visitDropEverythingEvent:(id)a3;
- (void)visitLinkContactsEvent:(id)a3;
- (void)visitPreferredContactForImageEvent:(id)a3;
- (void)visitPreferredContactForNameEvent:(id)a3;
- (void)visitUnlinkContactEvent:(id)a3;
- (void)visitUpdateContactEvent:(id)a3;
@end

@implementation ABSContactsDeltaSource

- (ABSContactsDeltaSource)initWithAnchor:(id)a3 keys:(id)a4 store:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ABSContactsDeltaSource;
  v10 = [(ABSContactsSource *)&v14 initWithKeys:v9 store:a5];
  v11 = v10;
  if (v10 && ![(ABSContactsDeltaSource *)v10 _primeWithAnchor:v8 andKeys:v9]) {
    v12 = 0;
  }
  else {
    v12 = v11;
  }

  return v12;
}

+ (int64_t)estimatedLogCountForAnchor:(id)a3 store:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)CNChangeHistoryFetchRequest);
  [v7 setStartingToken:v6];

  v19 = CNContactIdentifierKey;
  id v8 = +[NSArray arrayWithObjects:&v19 count:1];
  [v7 setAdditionalContactKeyDescriptors:v8];

  [v7 setShouldUnifyResults:0];
  [v7 setMutableObjects:0];
  [v7 setIncludeGroupChanges:0];
  [v7 setIncludeLinkingChanges:1];
  id v9 = [objc_opt_class() abs_transactionSignature];
  v18 = v9;
  v10 = +[NSArray arrayWithObjects:&v18 count:1];
  [v7 setExcludedTransactionAuthors:v10];

  id v17 = 0;
  v11 = [v5 countForFetchRequest:v7 error:&v17];

  id v12 = v17;
  if (v12)
  {
    v13 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000374A8((uint64_t)v12, v13);
    }
    int64_t v14 = -1;
  }
  else
  {
    v15 = [v11 value];
    int64_t v14 = (int64_t)[v15 integerValue];
  }
  return v14;
}

- (void)enumerateContactsAdd:(id)a3 remove:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ABSContactsDeltaSource *)self setAddReplaceBlock:v6];
  [(ABSContactsDeltaSource *)self setDeleteBlock:v7];
  [(ABSContactsDeltaSource *)self setKeepGoing:1];
  [(ABSContactsDeltaSource *)self setAddMods:0];
  [(ABSContactsDeltaSource *)self setDeletes:0];
  [(ABSContactsSource *)self gtLogger];
  id v8 = getCTGreenTeaOsLogHandle();
  id v9 = v8;
  if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Reading contacts", buf, 2u);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v10 = [(ABSContactsDeltaSource *)self changeLogEnumerator];
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v24;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v24 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
      [v15 acceptEventVisitor:self];
      [(ABSContactsDeltaSource *)self currentIndex];
      [(ABSContactsDeltaSource *)self setCurrentIndex:v17 + 1.0];
      if (![(ABSContactsDeltaSource *)self keepGoing]) {
        break;
      }
      [(ABSContactsDeltaSource *)self currentIndex];
      [(ABSContactsDeltaSource *)self setCurrentIndex:v18 + 1.0];
      if (v12 == (id)++v14)
      {
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v12) {
          goto LABEL_6;
        }
        break;
      }
    }
  }

  [(ABSContactsDeltaSource *)self setChangeLogEnumerator:0];
  [(ABSContactsDeltaSource *)self setAddReplaceBlock:0];
  [(ABSContactsDeltaSource *)self setDeleteBlock:0];
  v19 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v19;
    unsigned int v21 = [(ABSContactsDeltaSource *)self deletes];
    unsigned int v22 = [(ABSContactsDeltaSource *)self addMods];
    *(_DWORD *)buf = 67109376;
    unsigned int v28 = v21;
    __int16 v29 = 1024;
    unsigned int v30 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Changelog swept: %d deletes, %d addmods", buf, 0xEu);
  }
}

- (double)progress
{
  [(ABSContactsDeltaSource *)self currentIndex];
  double v4 = v3;
  [(ABSContactsDeltaSource *)self progressMultiplier];
  double result = v4 * v5;
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (BOOL)_primeWithAnchor:(id)a3 andKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_10001804C;
  v38 = sub_10001805C;
  id v39 = 0;
  id v8 = objc_alloc_init((Class)CNChangeHistoryFetchRequest);
  [v8 setStartingToken:v6];
  [v8 setAdditionalContactKeyDescriptors:0];
  [v8 setShouldUnifyResults:0];
  [v8 setMutableObjects:0];
  [v8 setIncludeGroupChanges:0];
  [v8 setIncludeLinkingChanges:1];
  if (v7)
  {
    id v9 = [v7 copy];
    [(ABSContactsSource *)self setKeysToFetch:v9];

    v10 = CNContactIdentifierKey;
  }
  else
  {
    v10 = CNContactIdentifierKey;
    v42 = CNContactIdentifierKey;
    id v11 = +[NSArray arrayWithObjects:&v42 count:1];
    [(ABSContactsSource *)self setKeysToFetch:v11];
  }
  v41 = v10;
  id v12 = +[NSArray arrayWithObjects:&v41 count:1];
  [v8 setAdditionalContactKeyDescriptors:v12];

  uint64_t v13 = [objc_opt_class() abs_transactionSignature];
  v40[0] = v13;
  v40[1] = @"com.apple.watch.contactsync";
  uint64_t v14 = +[NSArray arrayWithObjects:v40 count:2];
  [v8 setExcludedTransactionAuthors:v14];

  v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  __int16 v29 = sub_100018064;
  unsigned int v30 = &unk_1000552A0;
  v33 = &v34;
  v31 = self;
  id v15 = v8;
  id v32 = v15;
  v16 = sub_100005874((uint64_t)&v27);
  if (v16)
  {
    double v17 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100037520((uint64_t)v16, v17);
    }
  }
  else
  {
    double v18 = [[v35[5] value:v27, v28, v29, v30, v31];
    v19 = [v18 objectEnumerator];
    [(ABSContactsDeltaSource *)self setChangeLogEnumerator:v19];

    uint64_t v20 = [(id)v35[5] currentHistoryToken];
    [(ABSContactsSource *)self setHistoryAnchor:v20];

    unsigned int v21 = [(ABSContactsDeltaSource *)self changeLogEnumerator];
    LOBYTE(v20) = v21 == 0;

    if ((v20 & 1) == 0)
    {
      unsigned int v22 = [(ABSContactsDeltaSource *)self changeLogEnumerator];
      long long v23 = [v22 nextObject];

      [v23 acceptEventVisitor:self];
      if ([(ABSContactsDeltaSource *)self reset])
      {
        [(ABSContactsDeltaSource *)self _computeProgressMultiplier];
        -[ABSContactsDeltaSource setProgressMultiplier:](self, "setProgressMultiplier:");
      }
      else
      {
        long long v24 = [(id)v35[5] value];
        long long v25 = [v24 objectEnumerator];
        [(ABSContactsDeltaSource *)self setChangeLogEnumerator:v25];
      }
    }
  }

  _Block_object_dispose(&v34, 8);
  return v16 == 0;
}

- (double)_computeProgressMultiplier
{
  id v3 = objc_alloc((Class)CNContactFetchRequest);
  uint64_t v13 = CNContactIdentifierKey;
  double v4 = +[NSArray arrayWithObjects:&v13 count:1];
  id v5 = [v3 initWithKeysToFetch:v4];

  [v5 setUnifyResults:0];
  id v6 = [(ABSContactsSource *)self store];
  uint64_t v12 = 0;
  id v7 = [v6 countForFetchRequest:v5 error:&v12];

  id v8 = [v7 value];
  id v9 = [v8 integerValue];

  if (v9) {
    double v10 = 1.0 / (double)(uint64_t)v9;
  }
  else {
    double v10 = 0.0;
  }

  return v10;
}

- (BOOL)containsInterestingChanges
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018338;
  v5[3] = &unk_1000552C8;
  v5[4] = &v6;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100018350;
  v4[3] = &unk_1000552F0;
  v4[4] = &v6;
  [(ABSContactsDeltaSource *)self enumerateContactsAdd:v5 remove:v4];
  char v2 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (id)fetchJustOneContactWithThese:(id)a3 forThisIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"ABSContactsDeltaSource.m" lineNumber:196 description:@"Keys to fetch is nil."];
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  __int16 v29 = sub_10001804C;
  unsigned int v30 = sub_10001805C;
  id v31 = 0;
  uint64_t v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = sub_10001804C;
  v24[3] = sub_10001805C;
  id v25 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000185AC;
  v17[3] = &unk_100055340;
  id v9 = v7;
  id v18 = v9;
  id v10 = v8;
  id v19 = v10;
  uint64_t v20 = self;
  unsigned int v21 = &v23;
  unsigned int v22 = &v26;
  id v11 = sub_100005874((uint64_t)v17);
  uint64_t v12 = (void *)v27[5];
  if (!v12)
  {
    uint64_t v13 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100037598((uint64_t)v10, (uint64_t)v24, v13);
    }
    uint64_t v12 = (void *)v27[5];
  }
  id v14 = v12;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v26, 8);

  return v14;
}

- (void)_callAddReplace:(id)a3
{
  id v15 = a3;
  [(ABSContactsDeltaSource *)self setAddMods:(char *)[(ABSContactsDeltaSource *)self addMods] + 1];
  id v5 = v15;
  if (!v15)
  {
    uint64_t v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ABSContactsDeltaSource.m" lineNumber:218 description:@"_callAddReplace received a nil contact pointer."];

    id v5 = 0;
  }
  uint64_t v6 = [v5 identifier];

  if (!v6)
  {
    uint64_t v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ABSContactsDeltaSource.m" lineNumber:219 description:@"_callAddReplace received a nil contact identifier."];
  }
  if ([v15 isUnified])
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"ABSContactsDeltaSource.m" lineNumber:220 description:@"We just got an unexpected unified contact from the change log."];
  }
  id v7 = [(ABSContactsSource *)self keysToFetch];
  id v8 = [v15 identifier];
  id v9 = [(ABSContactsDeltaSource *)self fetchJustOneContactWithThese:v7 forThisIdentifier:v8];

  id v10 = [(ABSContactsDeltaSource *)self addReplaceBlock];

  if (v10 && v9)
  {
    id v11 = [(ABSContactsDeltaSource *)self addReplaceBlock];
    [(ABSContactsDeltaSource *)self setKeepGoing:((uint64_t (**)(void, void *))v11)[2](v11, v9)];
  }
}

- (void)visitDropEverythingEvent:(id)a3
{
}

- (void)visitAddContactEvent:(id)a3
{
  id v4 = [a3 contact];
  [(ABSContactsDeltaSource *)self _callAddReplace:v4];
}

- (void)visitDeleteContactEvent:(id)a3
{
  id v9 = a3;
  [(ABSContactsDeltaSource *)self setDeletes:(char *)[(ABSContactsDeltaSource *)self deletes] + 1];
  uint64_t v4 = [(ABSContactsDeltaSource *)self deleteBlock];
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = [v9 contactIdentifier];

    if (v6)
    {
      id v7 = [(ABSContactsDeltaSource *)self deleteBlock];
      id v8 = [v9 contactIdentifier];
      [(ABSContactsDeltaSource *)self setKeepGoing:((uint64_t (**)(void, void *))v7)[2](v7, v8)];
    }
  }
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4 = [a3 contact];
  [(ABSContactsDeltaSource *)self _callAddReplace:v4];
}

- (void)visitLinkContactsEvent:(id)a3
{
  id v4 = [a3 fromContact];
  [(ABSContactsDeltaSource *)self _callAddReplace:v4];
}

- (void)visitUnlinkContactEvent:(id)a3
{
  id v4 = [a3 contact];
  [(ABSContactsDeltaSource *)self _callAddReplace:v4];
}

- (void)visitPreferredContactForNameEvent:(id)a3
{
  id v4 = [a3 preferredContact];
  [(ABSContactsDeltaSource *)self _callAddReplace:v4];
}

- (void)visitPreferredContactForImageEvent:(id)a3
{
  id v4 = [a3 preferredContact];
  [(ABSContactsDeltaSource *)self _callAddReplace:v4];
}

- (void)visitDifferentMeCardEvent:(id)a3
{
  id v5 = a3;
  id v4 = [(ABSContactsDeltaSource *)self addReplaceBlock];

  if (v4) {
    abort();
  }
}

- (BOOL)reset
{
  return self->_reset;
}

- (void)setReset:(BOOL)a3
{
  self->_reset = a3;
}

- (NSEnumerator)changeLogEnumerator
{
  return self->_changeLogEnumerator;
}

- (void)setChangeLogEnumerator:(id)a3
{
}

- (id)addReplaceBlock
{
  return self->_addReplaceBlock;
}

- (void)setAddReplaceBlock:(id)a3
{
}

- (id)deleteBlock
{
  return self->_deleteBlock;
}

- (void)setDeleteBlock:(id)a3
{
}

- (BOOL)keepGoing
{
  return self->_keepGoing;
}

- (void)setKeepGoing:(BOOL)a3
{
  self->_keepGoing = a3;
}

- (double)progressMultiplier
{
  return self->_progressMultiplier;
}

- (void)setProgressMultiplier:(double)a3
{
  self->_progressMultiplier = a3;
}

- (double)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(double)a3
{
  self->_currentIndex = a3;
}

- (int64_t)deletes
{
  return self->_deletes;
}

- (void)setDeletes:(int64_t)a3
{
  self->_deletes = a3;
}

- (int64_t)addMods
{
  return self->_addMods;
}

- (void)setAddMods:(int64_t)a3
{
  self->_addMods = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deleteBlock, 0);
  objc_storeStrong(&self->_addReplaceBlock, 0);

  objc_storeStrong((id *)&self->_changeLogEnumerator, 0);
}

@end