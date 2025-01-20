@interface CRNamedEntityRecognizer
+ (id)_NLLanguageFromLocale:(id)a3;
- (CRNamedEntityRecognizer)initWithNameGazetteerURL:(id)a3 lastNameGazetteerURL:(id)a4;
- (double)personNameScoreForStringWithGazetteers:(id)a3 locale:(id)a4 useLastNameGazetteer:(BOOL)a5;
- (double)personNameScoreForStringWithTagger:(id)a3 locale:(id)a4;
- (id)_labelForString:(id)a3 useLastNameGazetteer:(BOOL)a4;
- (id)_nameCandidateTokensFromString:(id)a3;
- (id)_tokenizeString:(id)a3;
@end

@implementation CRNamedEntityRecognizer

- (CRNamedEntityRecognizer)initWithNameGazetteerURL:(id)a3 lastNameGazetteerURL:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CRNamedEntityRecognizer;
  v8 = [(CRNamedEntityRecognizer *)&v19 init];
  if (v8)
  {
    v20[0] = *MEMORY[0x1E4F38868];
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F388D0]) initWithContentsOfURL:v6 error:0];
    nameGazetteer = v8->_nameGazetteer;
    v8->_nameGazetteer = (NLGazetteer *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F388D0]) initWithContentsOfURL:v7 error:0];
    lastNameGazetteer = v8->_lastNameGazetteer;
    v8->_lastNameGazetteer = (NLGazetteer *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F388F0]) initWithTagSchemes:v9];
    tagger = v8->_tagger;
    v8->_tagger = (NLTagger *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F38908]) initWithUnit:0];
    tokenizer = v8->_tokenizer;
    v8->_tokenizer = (NLTokenizer *)v16;
  }
  return v8;
}

- (id)_tokenizeString:(id)a3
{
  tokenizer = self->_tokenizer;
  id v5 = a3;
  [(NLTokenizer *)tokenizer setString:v5];
  id v6 = self->_tokenizer;
  uint64_t v7 = [v5 length];

  v8 = -[NLTokenizer tokensForRange:](v6, "tokensForRange:", 0, v7);
  [(NLTokenizer *)self->_tokenizer setString:&stru_1F38EED68];
  return v8;
}

- (id)_labelForString:(id)a3 useLastNameGazetteer:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (qword_1EB58CC60 != -1) {
    dispatch_once(&qword_1EB58CC60, &__block_literal_global_26);
  }
  uint64_t v7 = [v6 lowercaseString];
  if ([(id)_MergedGlobals_26 containsObject:v7])
  {
    v8 = @"PersonName";
  }
  else if ([(id)qword_1EB58CC58 containsObject:v7])
  {
    v8 = 0;
  }
  else
  {
    uint64_t v9 = 8;
    if (v4) {
      uint64_t v9 = 16;
    }
    v8 = [*(id *)((char *)&self->super.isa + v9) labelForString:v6];
  }

  return v8;
}

void __64__CRNamedEntityRecognizer__labelForString_useLastNameGazetteer___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3935C08];
  v1 = (void *)_MergedGlobals_26;
  _MergedGlobals_26 = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3935C20];
  v3 = (void *)qword_1EB58CC58;
  qword_1EB58CC58 = v2;
}

+ (id)_NLLanguageFromLocale:(id)a3
{
  uint64_t v3 = qword_1EB58CC70;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB58CC70, &__block_literal_global_28);
  }
  id v5 = [(id)qword_1EB58CC68 valueForKey:v4];

  return v5;
}

void __49__CRNamedEntityRecognizer__NLLanguageFromLocale___block_invoke()
{
  v8[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F38708];
  v7[0] = @"de-DE";
  v7[1] = @"en-US";
  uint64_t v1 = *MEMORY[0x1E4F386F0];
  v8[0] = v0;
  v8[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F38770];
  v7[2] = @"es-ES";
  v7[3] = @"fr-FR";
  uint64_t v3 = *MEMORY[0x1E4F38700];
  v8[2] = v2;
  v8[3] = v3;
  v7[4] = @"it-IT";
  v7[5] = @"pt-BR";
  uint64_t v4 = *MEMORY[0x1E4F38748];
  v8[4] = *MEMORY[0x1E4F38718];
  v8[5] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:6];
  id v6 = (void *)qword_1EB58CC68;
  qword_1EB58CC68 = v5;
}

- (id)_nameCandidateTokensFromString:(id)a3
{
  id v3 = a3;
  if (qword_1EB58CC78 != -1) {
    dispatch_once(&qword_1EB58CC78, &__block_literal_global_31_1);
  }
  uint64_t v4 = [v3 componentsSeparatedByString:@" "];
  if ((unint64_t)[v4 count] < 2 || (unint64_t)objc_msgSend(v4, "count") > 4)
  {
    id v5 = 0;
    goto LABEL_21;
  }
  id v6 = objc_opt_new();
  if (![v4 count])
  {
LABEL_18:
    id v5 = v6;
    goto LABEL_20;
  }
  unint64_t v7 = 0;
  while (1)
  {
    v8 = [v4 objectAtIndexedSubscript:v7];
    if (v7 && v7 < [v4 count] - 1 && objc_msgSend(v8, "length") == 2)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
      if (objc_msgSend(v9, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", 0)))
      {
        int v10 = [v8 characterAtIndex:1];

        if (v10 == 46) {
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
    uint64_t v11 = qword_1EB58CC80;
    uint64_t v12 = [v8 lowercaseString];
    LOBYTE(v11) = [(id)v11 containsObject:v12];

    if (v11) {
      break;
    }
    [v6 addObject:v8];
LABEL_17:

    if (++v7 >= [v4 count]) {
      goto LABEL_18;
    }
  }

  id v5 = 0;
LABEL_20:

LABEL_21:
  return v5;
}

void __58__CRNamedEntityRecognizer__nameCandidateTokensFromString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3935C38];
  uint64_t v1 = (void *)qword_1EB58CC80;
  qword_1EB58CC80 = v0;
}

- (double)personNameScoreForStringWithGazetteers:(id)a3 locale:(id)a4 useLastNameGazetteer:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [a3 lowercaseString];
  v8 = [(CRNamedEntityRecognizer *)self _nameCandidateTokensFromString:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      double v14 = -1.0;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v17 = -[CRNamedEntityRecognizer _labelForString:useLastNameGazetteer:](self, "_labelForString:useLastNameGazetteer:", v16, 0, (void)v21);
          if (v17)
          {
          }
          else
          {
            if (!v5) {
              goto LABEL_17;
            }
            v18 = [v10 lastObject];
            if (v16 != v18)
            {

              goto LABEL_17;
            }
            objc_super v19 = [(CRNamedEntityRecognizer *)self _labelForString:v16 useLastNameGazetteer:1];

            if (!v19) {
              goto LABEL_17;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    double v14 = 1.0;
LABEL_17:
  }
  else
  {
    double v14 = -1.0;
  }

  return v14;
}

- (double)personNameScoreForStringWithTagger:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CRNamedEntityRecognizer *)self _nameCandidateTokensFromString:v6];
  if (v8)
  {
    uint64_t v9 = [(id)objc_opt_class() _NLLanguageFromLocale:v7];
    id v10 = (void *)v9;
    if (!self->_tagger || !v9) {
      goto LABEL_7;
    }
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 0;
    uint64_t v11 = [v8 componentsJoinedByString:@" "];
    [(NLTagger *)self->_tagger setString:v11];
    -[NLTagger setLanguage:range:](self->_tagger, "setLanguage:range:", v10, 0, [v11 length]);
    tagger = self->_tagger;
    uint64_t v13 = [v11 length];
    uint64_t v14 = *MEMORY[0x1E4F38868];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__CRNamedEntityRecognizer_personNameScoreForStringWithTagger_locale___block_invoke;
    v21[3] = &unk_1E6CDBBD0;
    v21[4] = &v22;
    -[NLTagger enumerateTagsInRange:unit:scheme:options:usingBlock:](tagger, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v13, 0, v14, 0, v21);
    uint64_t v15 = v23[3];
    uint64_t v16 = [v8 count];
    uint64_t v17 = 3;
    if (v16 > 3) {
      uint64_t v17 = v16;
    }
    uint64_t v18 = v17 - 1;

    _Block_object_dispose(&v22, 8);
    double v19 = 1.0;
    if (v15 < v18) {
LABEL_7:
    }
      double v19 = -1.0;
  }
  else
  {
    double v19 = -1.0;
  }

  return v19;
}

uint64_t __69__CRNamedEntityRecognizer_personNameScoreForStringWithTagger_locale___block_invoke(uint64_t result, uint64_t a2)
{
  if (*MEMORY[0x1E4F38820] == a2) {
    ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_tagger, 0);
  objc_storeStrong((id *)&self->_lastNameGazetteer, 0);
  objc_storeStrong((id *)&self->_nameGazetteer, 0);
}

@end