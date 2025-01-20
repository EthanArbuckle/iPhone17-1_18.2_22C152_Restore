@interface TISKCandidateAcceptEvent
- (BOOL)isAutocorrection;
- (NSString)wordBucketCategory;
- (TIKeyboardCandidate)candidate;
- (id)description;
- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 wordBucketCategory:(id)a6 isAutocorrection:(BOOL)a7;
- (void)reportToSession:(id)a3;
- (void)setCandidate:(id)a3;
- (void)setIsAutocorrection:(BOOL)a3;
- (void)setWordBucketCategory:(id)a3;
@end

@implementation TISKCandidateAcceptEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wordBucketCategory, 0);

  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setIsAutocorrection:(BOOL)a3
{
  self->_isAutocorrection = a3;
}

- (BOOL)isAutocorrection
{
  return self->_isAutocorrection;
}

- (void)setWordBucketCategory:(id)a3
{
}

- (NSString)wordBucketCategory
{
  return self->_wordBucketCategory;
}

- (void)setCandidate:(id)a3
{
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (void)reportToSession:(id)a3
{
  id v24 = a3;
  uint64_t v4 = [(TISKEvent *)self isValidCandidate:self->_candidate];
  id v5 = v24;
  if (!v4) {
    goto LABEL_37;
  }
  [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfWordsCounter];
  if ([(TISKCandidateAcceptEvent *)self isAutocorrection]) {
    [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfAutoCorrections];
  }
  int v6 = [(TIKeyboardCandidate *)self->_candidate usageTrackingMask];
  int v7 = v6;
  if ((v6 & 0x10) != 0)
  {
    [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfSpaceCorrections];
    if ((v7 & 0x20) == 0)
    {
LABEL_6:
      if ((v7 & 0x400) == 0) {
        goto LABEL_7;
      }
      goto LABEL_18;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_6;
  }
  [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfRetroCorrections];
  if ((v7 & 0x400) == 0)
  {
LABEL_7:
    if ((v7 & 0x800) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfTranspositionCorrections];
  if ((v7 & 0x800) == 0)
  {
LABEL_8:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfInsertKeyCorrections];
  if ((v7 & 0x1000) == 0)
  {
LABEL_9:
    if ((v7 & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfSkipTouchCorrections];
  if ((v7 & 0x4000) == 0)
  {
LABEL_10:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_11;
    }
LABEL_22:
    [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfSubstitutionCorrections];
    if ((v7 & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfNearKeyCorrections];
  if ((v7 & 0x8000) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((v7 & 0x10000) != 0) {
LABEL_12:
  }
    [v24 addSample:&unk_1F3FA7D00 forKey:kTISKNumberOfHitTestCorrections];
LABEL_13:
  v8 = [(TISKCandidateAcceptEvent *)self wordBucketCategory];

  id v5 = v24;
  if (!v8) {
    goto LABEL_37;
  }
  v9 = [(TISKCandidateAcceptEvent *)self wordBucketCategory];
  char v10 = [v9 isEqualToString:@"absolutistWord"];

  if (v10)
  {
    v11 = &kTISKtotalAbsolutistWords;
  }
  else
  {
    v12 = [(TISKCandidateAcceptEvent *)self wordBucketCategory];
    char v13 = [v12 isEqualToString:@"downWord"];

    if (v13)
    {
      v11 = &kTISKtotalDownWords;
    }
    else
    {
      v14 = [(TISKCandidateAcceptEvent *)self wordBucketCategory];
      char v15 = [v14 isEqualToString:@"deathWord"];

      if (v15)
      {
        v11 = &kTISKtotalDeathWords;
      }
      else
      {
        v16 = [(TISKCandidateAcceptEvent *)self wordBucketCategory];
        char v17 = [v16 isEqualToString:@"anxietyWord"];

        if (v17)
        {
          v11 = &kTISKtotalAnxietyWords;
        }
        else
        {
          v18 = [(TISKCandidateAcceptEvent *)self wordBucketCategory];
          char v19 = [v18 isEqualToString:@"angerWord"];

          if (v19)
          {
            v11 = &kTISKtotalAngerWords;
          }
          else
          {
            v20 = [(TISKCandidateAcceptEvent *)self wordBucketCategory];
            char v21 = [v20 isEqualToString:@"healthFeelingWord"];

            if (v21)
            {
              v11 = &kTISKtotalHealthFeelingWords;
            }
            else
            {
              v22 = [(TISKCandidateAcceptEvent *)self wordBucketCategory];
              int v23 = [v22 isEqualToString:@"positiveWord"];

              id v5 = v24;
              if (!v23) {
                goto LABEL_37;
              }
              v11 = &kTISKtotalPositiveWords;
            }
          }
        }
      }
    }
  }
  uint64_t v4 = [v24 addSample:&unk_1F3FA7D00 forKey:*v11];
  id v5 = v24;
LABEL_37:

  MEMORY[0x1F41817F8](v4, v5);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"ca"];
}

- (id)init:(id)a3 emojiSearchMode:(BOOL)a4 order:(int64_t)a5 wordBucketCategory:(id)a6 isAutocorrection:(BOOL)a7
{
  BOOL v10 = a4;
  id v13 = a3;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TISKCandidateAcceptEvent;
  char v15 = [(TISKEvent *)&v18 init:7 emojiSearchMode:v10 order:a5];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(v15 + 5, a3);
    objc_storeStrong(v16 + 6, a6);
    *((unsigned char *)v16 + 32) = a7;
  }

  return v16;
}

@end