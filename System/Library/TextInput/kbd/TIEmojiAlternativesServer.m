@interface TIEmojiAlternativesServer
+ (id)sharedInstance;
- (void)alternativesForText:(id)a3 completionHandler:(id)a4;
- (void)updateForActiveLocaleIdentifiers:(id)a3;
- (void)updateKeyboardType:(unint64_t)a3 appIdentifier:(id)a4;
@end

@implementation TIEmojiAlternativesServer

+ (id)sharedInstance
{
  if (qword_100026E08 != -1) {
    dispatch_once(&qword_100026E08, &stru_10001C8C0);
  }
  v2 = (void *)qword_100026E00;
  return v2;
}

- (void)updateForActiveLocaleIdentifiers:(id)a3
{
  id v5 = a3;
  if (![(NSArray *)self->_localeIdentifiers isEqualToArray:v5])
  {
    objc_storeStrong((id *)&self->_localeIdentifiers, a3);
    v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v11), (void)v15);
          if (v12) {
            [v6 addObject:v12];
          }

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    v13 = (TIEmojiCandidateGenerator *)[objc_alloc((Class)TIEmojiCandidateGenerator) initWithActiveInputModes:v6];
    generator = self->_generator;
    self->_generator = v13;
  }
}

- (void)updateKeyboardType:(unint64_t)a3 appIdentifier:(id)a4
{
}

- (void)alternativesForText:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  generator = self->_generator;
  if (generator)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008AA4;
    v9[3] = &unk_10001C8E8;
    id v10 = v6;
    [(TIEmojiCandidateGenerator *)generator emojiAlternativesForText:a3 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, const __CFString *, void *))v6 + 2))(v6, &stru_10001CF20, &__NSArray0__struct);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifiers, 0);
  objc_storeStrong((id *)&self->_generator, 0);
}

@end