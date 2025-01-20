@interface _ACTUserActionStream
+ (BOOL)isPathableWord:(id)a3;
+ (_NSRange)segmentAnchorRangeForCursor:(id)a3 withDocumentBefore:(id)a4;
+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4;
- (ACTUserActionStreamDelegate)delegate;
- (ACTUserMentalCursor)cursor;
- (BOOL)advancePositionByAcceptingCandidate:(id)a3;
- (BOOL)advanceSegmentCursor;
- (BOOL)canBeginBackspacing;
- (BOOL)canContinueBackspacing;
- (BOOL)currentAndNextKeysAreTransposable;
- (BOOL)hasDesiredAutocorrection;
- (BOOL)inPartialCandidateSelection;
- (BOOL)isBackspacing;
- (BOOL)isFinished;
- (BOOL)isRetyping;
- (BOOL)lastActionSuppressesError;
- (BOOL)lastActionUseSecondaryString;
- (BOOL)lastAndCurrentKeysAreSame;
- (BOOL)preferBaseKeyForVariants;
- (BOOL)preferInlineSelection;
- (BOOL)preferManualCorrection;
- (BOOL)preferManualShift;
- (BOOL)preferPredictionSelection;
- (BOOL)rewindSegmentCursor;
- (BOOL)shouldBeginCorrectingAfterWord;
- (BOOL)shouldBeginCorrectingAfterWordTerminator;
- (BOOL)shouldIgnoreCurrentCharacter;
- (BOOL)shouldRejectBadAutocorrection;
- (BOOL)shouldTypeInternalString;
- (NSString)intendedText;
- (NSString)partialCandidateIntendedChunk;
- (NSString)partialCandidateSuffix;
- (TIErrorGenerator)errorGenerator;
- (TIKeyboardTyperUserModel)userModel;
- (TTKDefaultContinuousPathGenerator)pathGenerator;
- (UserPathManager)userPathManager;
- (_ACTUserActionStream)initWithParameters:(id)a3 delegate:(id)a4;
- (_NSRange)documentEditRangeWithSegmentRangePtr:(_NSRange *)a3;
- (double)averageActionInterval;
- (double)lastTimestamp;
- (double)randomActionInterval;
- (float)probabilityOfDoubledKey;
- (float)probabilityOfExtraneousKey;
- (float)probabilityOfSkippedKey;
- (float)probabilityOfSubstituteKey;
- (float)probabilityOfTransposition;
- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6;
- (id)candidateToSelectFromCandidates:(id)a3;
- (id)externalStringToInternal:(id)a3;
- (id)findPartialCandidate;
- (id)matchTransliterationCandidateToSegment:(id)a3 withCursorAt:(int)a4;
- (id)nextUserAction;
- (id)transliterationCandidate:(id)a3;
- (id)tryAcceptCandidate;
- (id)tryAcceptingCandidate:(id)a3;
- (id)tryBackspacing;
- (id)tryChangeKeyplane;
- (id)tryContinuousPath;
- (id)tryDoubleKeyTap;
- (id)tryExtraKeyTap;
- (id)tryKeyTap;
- (id)tryPeriodShortcut;
- (id)tryRejectCandidate;
- (id)trySelectPopupVariant;
- (id)trySkipKeyTap;
- (id)trySubstituteKeyTap;
- (id)tryTransposedKeyTaps;
- (id)tryTypingWillSuppressError:(BOOL *)a3;
- (int64_t)lastCursorPositionForTransliteratedCandidate;
- (unint64_t)segmentCursorBeforeBackspacing;
- (unint64_t)segmentEditHorizon;
- (unsigned)randomNumberSeed;
- (void)advancePositionByString:(id)a3;
- (void)configureWithParameters:(id)a3;
- (void)resetForIntendedSegments:(id)a3 expectedSegments:(id)a4;
- (void)resetForIntendedText:(id)a3;
- (void)rewindPositionByString:(id)a3;
- (void)setCursor:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorGenerator:(id)a3;
- (void)setIsBackspacing:(BOOL)a3;
- (void)setLastActionSuppressesError:(BOOL)a3;
- (void)setLastActionUseSecondaryString:(BOOL)a3;
- (void)setLastCursorPositionForTransliteratedCandidate:(int64_t)a3;
- (void)setLastTimestamp:(double)a3;
- (void)setPartialCandidateIntendedChunk:(id)a3;
- (void)setPartialCandidateSuffix:(id)a3;
- (void)setPathGenerator:(id)a3;
- (void)setRandomNumberSeed:(unsigned int)a3;
- (void)setSegmentCursorBeforeBackspacing:(unint64_t)a3;
- (void)setSegmentEditHorizon:(unint64_t)a3;
- (void)setUserModel:(id)a3;
- (void)setUserPathManager:(id)a3;
@end

@implementation _ACTUserActionStream

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partialCandidateIntendedChunk, 0);
  objc_storeStrong((id *)&self->_partialCandidateSuffix, 0);
  objc_storeStrong((id *)&self->_userPathManager, 0);
  objc_storeStrong((id *)&self->_pathGenerator, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_userModel, 0);
  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

- (void)setPartialCandidateIntendedChunk:(id)a3
{
}

- (NSString)partialCandidateIntendedChunk
{
  return self->_partialCandidateIntendedChunk;
}

- (void)setPartialCandidateSuffix:(id)a3
{
}

- (NSString)partialCandidateSuffix
{
  return self->_partialCandidateSuffix;
}

- (void)setUserPathManager:(id)a3
{
}

- (UserPathManager)userPathManager
{
  return self->_userPathManager;
}

- (void)setPathGenerator:(id)a3
{
}

- (TTKDefaultContinuousPathGenerator)pathGenerator
{
  return self->_pathGenerator;
}

- (void)setLastActionUseSecondaryString:(BOOL)a3
{
  self->_lastActionUseSecondaryString = a3;
}

- (BOOL)lastActionUseSecondaryString
{
  return self->_lastActionUseSecondaryString;
}

- (void)setLastActionSuppressesError:(BOOL)a3
{
  self->_lastActionSuppressesError = a3;
}

- (BOOL)lastActionSuppressesError
{
  return self->_lastActionSuppressesError;
}

- (void)setLastCursorPositionForTransliteratedCandidate:(int64_t)a3
{
  self->_lastCursorPositionForTransliteratedCandidate = a3;
}

- (int64_t)lastCursorPositionForTransliteratedCandidate
{
  return self->_lastCursorPositionForTransliteratedCandidate;
}

- (void)setSegmentEditHorizon:(unint64_t)a3
{
  self->_segmentEditHorizon = a3;
}

- (unint64_t)segmentEditHorizon
{
  return self->_segmentEditHorizon;
}

- (void)setSegmentCursorBeforeBackspacing:(unint64_t)a3
{
  self->_segmentCursorBeforeBackspacing = a3;
}

- (unint64_t)segmentCursorBeforeBackspacing
{
  return self->_segmentCursorBeforeBackspacing;
}

- (void)setIsBackspacing:(BOOL)a3
{
  self->_isBackspacing = a3;
}

- (BOOL)isBackspacing
{
  return self->_isBackspacing;
}

- (void)setLastTimestamp:(double)a3
{
  self->_lastTimestamp = a3;
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setCursor:(id)a3
{
}

- (ACTUserMentalCursor)cursor
{
  return self->_cursor;
}

- (unsigned)randomNumberSeed
{
  return self->_randomNumberSeed;
}

- (void)setUserModel:(id)a3
{
}

- (TIKeyboardTyperUserModel)userModel
{
  return self->_userModel;
}

- (void)setErrorGenerator:(id)a3
{
}

- (TIErrorGenerator)errorGenerator
{
  return self->_errorGenerator;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACTUserActionStreamDelegate *)a3;
}

- (ACTUserActionStreamDelegate)delegate
{
  return self->_delegate;
}

- (id)trySelectPopupVariant
{
  v3 = [(_ACTUserActionStream *)self cursor];
  v4 = [v3 currentComposedCharacter];

  if (v4
    || ([(_ACTUserActionStream *)self cursor],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 currentLongCharacter],
        v4 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4))
  {
    [(_ACTUserActionStream *)self lastTimestamp];
    double v7 = v6;
    [(_ACTUserActionStream *)self randomActionInterval];
    double v9 = v7 + v8;
    [(_ACTUserActionStream *)self setLastTimestamp:v9];
    v10 = [[ACTSelectPopupVariant alloc] initWithIntendedKey:v4 timestamp:v9];
    if (v10)
    {
      v11 = [(_ACTUserActionStream *)self cursor];
      -[ACTUserAction setInputSegment:](v10, "setInputSegment:", [v11 segmentCursor]);

      [(_ACTUserActionStream *)self advancePositionByString:v4];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tryChangeKeyplane
{
  v3 = [(_ACTUserActionStream *)self cursor];
  v4 = [v3 currentLongCharacter];

  v5 = [(_ACTUserActionStream *)self delegate];
  double v6 = [v5 shiftKeyToAccessKeyplaneCloserToKeyString:v4];

  if (v6)
  {
    [(_ACTUserActionStream *)self setLastActionUseSecondaryString:1];
  }
  else
  {
    double v7 = [(_ACTUserActionStream *)self delegate];
    double v6 = [v7 keyToAccessKeyplaneCloserToKeyString:v4];

    if (!v6)
    {
      v28 = [(_ACTUserActionStream *)self delegate];
      v29 = [v28 keyboardController];
      v30 = [v29 layoutUtils];
      v31 = [v30 baseKeyForString:v4];

      if (v31)
      {
        v32 = [(_ACTUserActionStream *)self delegate];
        double v6 = [v32 keyToAccessKeyplaneCloserToKeyString:v31];

        if (v6) {
          goto LABEL_4;
        }
      }
      else
      {
        double v6 = 0;
      }
      v25 = 0;
      goto LABEL_10;
    }
  }
LABEL_4:
  [(_ACTUserActionStream *)self lastTimestamp];
  double v9 = v8;
  [(_ACTUserActionStream *)self randomActionInterval];
  double v11 = v9 + v10;
  v12 = [(_ACTUserActionStream *)self errorGenerator];
  v13 = [v6 representedString];
  [v6 paddedFrame];
  v14 = objc_msgSend(v12, "errorForKeyString:rect:", v13);

  v15 = [(_ACTUserActionStream *)self delegate];
  [v15 pointForAttemptedTapOnKey:v6 withError:v14];
  double v17 = v16;
  double v19 = v18;

  v20 = [(_ACTUserActionStream *)self delegate];
  v21 = [(_ACTUserActionStream *)self delegate];
  v22 = [v21 keyplane];
  v23 = objc_msgSend(v20, "keyContainingPoint:inKeyplane:", v22, v17, v19);

  if (v23) {
    v24 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v6, v23, v14, 0, v17, v19, v11);
  }
  else {
    v24 = [[ACTSkipKeyTap alloc] initWithIntendedKey:v6 timestamp:v11];
  }
  v25 = v24;
  if (v24)
  {
    v26 = [(_ACTUserActionStream *)self cursor];
    -[ACTUserAction setInputSegment:](v25, "setInputSegment:", [v26 segmentCursor]);

    [(_ACTUserActionStream *)self setLastTimestamp:v11];
  }

LABEL_10:
  return v25;
}

- (id)tryContinuousPath
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v3 = [(_ACTUserActionStream *)self cursor];
  v4 = [v3 currentInternalSegment];

  v5 = [(_ACTUserActionStream *)self userModel];
  char v6 = [v5 expectsAppendedSpaceToContinuousPath];

  if ((v6 & 1) != 0
    || ![v4 isEqualToString:@" "]
    || ([(_ACTUserActionStream *)self cursor],
        double v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 positionInCurrentInternalSegment],
        v7,
        v8))
  {
    int v9 = 0;
  }
  else
  {
    v29 = [(_ACTUserActionStream *)self cursor];
    [v29 advanceSegmentCursor];

    v30 = [(_ACTUserActionStream *)self cursor];
    uint64_t v31 = [v30 currentInternalSegment];

    int v9 = 1;
    v4 = (void *)v31;
  }
  if ([(id)objc_opt_class() isPathableWord:v4])
  {
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x3032000000;
    v70[3] = __Block_byref_object_copy__5567;
    v70[4] = __Block_byref_object_dispose__5568;
    id v71 = 0;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    char v69 = 0;
    uint64_t v62 = 0;
    v63 = &v62;
    uint64_t v64 = 0x2020000000;
    char v65 = 0;
    double v10 = [MEMORY[0x263EFF980] array];
    double v11 = [(_ACTUserActionStream *)self cursor];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __41___ACTUserActionStream_tryContinuousPath__block_invoke;
    v55[3] = &unk_265050388;
    v56 = @"'’׳״-";
    v57 = self;
    id v12 = v10;
    id v58 = v12;
    v59 = v70;
    v60 = &v66;
    v61 = &v62;
    [v11 enumerateRemainingLongCharactersForCurrentSegment:v55];

    if (*((unsigned char *)v63 + 24) || !*((unsigned char *)v67 + 24))
    {
      v13 = 0;
    }
    else
    {
      [(_ACTUserActionStream *)self lastTimestamp];
      double v15 = v14;
      [(_ACTUserActionStream *)self randomActionInterval];
      double v17 = v16;
      double v18 = [(_ACTUserActionStream *)self delegate];
      v50 = [v18 keyboardController];

      double v19 = [v50 layoutUtils];
      v20 = [(_ACTUserActionStream *)self delegate];
      v21 = [v20 keyplane];
      v22 = [v19 createTTKPlane:v21];

      v23 = [(_ACTUserActionStream *)self userPathManager];
      if (!v23) {
        goto LABEL_16;
      }
      v24 = [(_ACTUserActionStream *)self userPathManager];
      v25 = [(_ACTUserActionStream *)self delegate];
      v26 = [v25 keyboardController];
      v27 = [v24 lookup:v4 keyboardController:v26];

      if (v27)
      {
        uint64_t v28 = 1;
      }
      else
      {
LABEL_16:
        v32 = [MEMORY[0x263F089D8] string];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        id v33 = v12;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v72 count:16];
        if (v34)
        {
          uint64_t v35 = *(void *)v52;
          do
          {
            for (uint64_t i = 0; i != v34; ++i)
            {
              if (*(void *)v52 != v35) {
                objc_enumerationMutation(v33);
              }
              v37 = [*(id *)(*((void *)&v51 + 1) + 8 * i) representedString];
              [v32 appendString:v37];
            }
            uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v72 count:16];
          }
          while (v34);
        }

        v38 = [(_ACTUserActionStream *)self pathGenerator];
        v27 = [v38 generatePathFromString:v32 layout:v22];

        uint64_t v28 = 0;
      }
      v39 = [[ACTPathWord alloc] initWithPath:v27 intendedString:v4 keyplane:v22 fromUserData:v28];
      v40 = [(_ACTUserActionStream *)self cursor];
      -[ACTUserAction setInputSegment:](v39, "setInputSegment:", [v40 segmentCursor]);

      [(_ACTUserActionStream *)self setLastTimestamp:v15 + v17];
      [(_ACTUserActionStream *)self setLastActionUseSecondaryString:0];
      v41 = [(_ACTUserActionStream *)self cursor];
      v42 = [v41 currentInternalSegment];
      v43 = [(_ACTUserActionStream *)self cursor];
      v44 = objc_msgSend(v42, "substringFromIndex:", objc_msgSend(v43, "positionInCurrentInternalSegment"));

      [(_ACTUserActionStream *)self advancePositionByString:v44];
      v45 = [(_ACTUserActionStream *)self userModel];
      LODWORD(v41) = [v45 expectsAppendedSpaceToContinuousPath];

      if (v41)
      {
        v46 = [(_ACTUserActionStream *)self cursor];
        v47 = [v46 currentInternalSegment];
        int v48 = [v47 isEqualToString:@" "];

        if (v48) {
          [(_ACTUserActionStream *)self advancePositionByString:@" "];
        }
      }
      v13 = v39;
    }
    _Block_object_dispose(&v62, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(v70, 8);
  }
  else
  {
    if (v9) {
      [(_ACTUserActionStream *)self rewindSegmentCursor];
    }
    v13 = 0;
  }

  return v13;
}

- (id)tryKeyTap
{
  v3 = [(_ACTUserActionStream *)self cursor];
  v4 = [v3 currentLongCharacter];

  v5 = [(_ACTUserActionStream *)self delegate];
  char v6 = [v5 keyplane];
  double v7 = [(_ACTUserActionStream *)self anyKeyForString:v4 keyplane:v6 wantSecondaryString:[(_ACTUserActionStream *)self lastActionUseSecondaryString] substituteUpperCaseForLowerCase:0];

  if (!v7)
  {
    if ([(_ACTUserActionStream *)self isRetyping]
      || !_isLetterKey(v4)
      || ([(_ACTUserActionStream *)self cursor],
          double v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 atBeginningOfText],
          v14,
          (v15 & 1) != 0))
    {
      double v7 = 0;
      uint64_t v8 = 0;
      goto LABEL_15;
    }
    v30 = [(_ACTUserActionStream *)self delegate];
    uint64_t v31 = [v30 locale];
    v32 = [v4 lowercaseStringWithLocale:v31];

    int v33 = [v32 isEqualToString:v4];
    uint64_t v34 = [(_ACTUserActionStream *)self delegate];
    uint64_t v35 = [v34 keyplane];
    int v36 = [v35 isShiftKeyplane];

    double v7 = 0;
    if (v33 && v36)
    {
      v37 = [(_ACTUserActionStream *)self delegate];
      v38 = [v37 locale];
      v39 = [v4 capitalizedStringWithLocale:v38];

      v40 = [(_ACTUserActionStream *)self delegate];
      v41 = [v40 keyplane];
      double v7 = [(_ACTUserActionStream *)self anyKeyForString:v39 keyplane:v41 wantSecondaryString:[(_ACTUserActionStream *)self lastActionUseSecondaryString] substituteUpperCaseForLowerCase:0];
    }
  }
  uint64_t v8 = 0;
  if (v7 && v4)
  {
    [(_ACTUserActionStream *)self lastTimestamp];
    double v10 = v9;
    [(_ACTUserActionStream *)self randomActionInterval];
    double v12 = v11;
    if ([(_ACTUserActionStream *)self isRetyping])
    {
      v13 = +[TIPointError errorWithErrorVector:](TIPointError, "errorWithErrorVector:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    }
    else
    {
      double v16 = [(_ACTUserActionStream *)self errorGenerator];
      double v17 = [v7 representedString];
      [v7 paddedFrame];
      v13 = objc_msgSend(v16, "errorForKeyString:rect:", v17);
    }
    double v18 = v10 + v12;
    double v19 = [(_ACTUserActionStream *)self delegate];
    [v19 pointForAttemptedTapOnKey:v7 withError:v13];
    double v21 = v20;
    double v23 = v22;

    v24 = [(_ACTUserActionStream *)self delegate];
    v25 = [(_ACTUserActionStream *)self delegate];
    v26 = [v25 keyplane];
    v27 = objc_msgSend(v24, "keyContainingPoint:inKeyplane:", v26, v21, v23);

    if (v27)
    {
      uint64_t v8 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v7, v27, v13, [(_ACTUserActionStream *)self lastActionUseSecondaryString], v21, v23, v18);
      [(_ACTUserActionStream *)self isRetyping];
      if (!v8)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v8 = [[ACTSkipKeyTap alloc] initWithIntendedKey:v7 timestamp:v18];
      if (!v8) {
        goto LABEL_14;
      }
    }
    uint64_t v28 = [(_ACTUserActionStream *)self cursor];
    -[ACTUserAction setInputSegment:](v8, "setInputSegment:", [v28 segmentCursor]);

    [(_ACTUserActionStream *)self advancePositionByString:v4];
    [(_ACTUserActionStream *)self setLastTimestamp:v18];
    [(_ACTUserActionStream *)self setLastActionUseSecondaryString:0];
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (id)tryDoubleKeyTap
{
  v3 = [(_ACTUserActionStream *)self cursor];
  v4 = [v3 currentLongCharacter];

  v5 = [(_ACTUserActionStream *)self delegate];
  char v6 = [v5 keyplane];
  double v7 = [(_ACTUserActionStream *)self anyKeyForString:v4 keyplane:v6 wantSecondaryString:0 substituteUpperCaseForLowerCase:0];

  uint64_t v8 = 0;
  if (v7 && v4)
  {
    [(_ACTUserActionStream *)self lastTimestamp];
    double v10 = v9;
    [(_ACTUserActionStream *)self randomActionInterval];
    double v12 = v10 + v11;
    v13 = [(_ACTUserActionStream *)self errorGenerator];
    [v7 paddedFrame];
    uint64_t v14 = objc_msgSend(v13, "errorForKeyString:rect:", v4);

    char v15 = [(_ACTUserActionStream *)self delegate];
    [v15 pointForAttemptedTapOnKey:v7 withError:v14];
    double v17 = v16;
    double v19 = v18;

    double v20 = [(_ACTUserActionStream *)self delegate];
    double v21 = [(_ACTUserActionStream *)self delegate];
    double v22 = [v21 keyplane];
    double v23 = objc_msgSend(v20, "keyContainingPoint:inKeyplane:", v22, v17, v19);

    v43 = (void *)v14;
    if (v23) {
      v24 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v7, v23, v14, 0, v17, v19, v12);
    }
    else {
      v24 = 0;
    }
    [(_ACTUserActionStream *)self randomActionInterval];
    double v26 = v25;
    v27 = [(_ACTUserActionStream *)self errorGenerator];
    [v7 paddedFrame];
    uint64_t v28 = objc_msgSend(v27, "errorForKeyString:rect:", v4);

    v29 = [(_ACTUserActionStream *)self delegate];
    [v29 pointForAttemptedTapOnKey:v7 withError:v28];
    double v31 = v30;
    double v33 = v32;

    uint64_t v34 = [(_ACTUserActionStream *)self delegate];
    uint64_t v35 = [(_ACTUserActionStream *)self delegate];
    int v36 = [v35 keyplane];
    v37 = objc_msgSend(v34, "keyContainingPoint:inKeyplane:", v36, v31, v33);

    if (v37)
    {
      double v38 = v12 + v26;
      v39 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", 0, v37, v28, 0, v31, v33, v38);
      v40 = v39;
      uint64_t v8 = 0;
      if (v24)
      {
        if (v39)
        {
          uint64_t v8 = [[ACTDoubleKeyTap alloc] initWithFirstTap:v24 secondTap:v39];
          if (v8)
          {
            v41 = [(_ACTUserActionStream *)self cursor];
            -[ACTUserAction setInputSegment:](v8, "setInputSegment:", [v41 segmentCursor]);

            [(_ACTUserActionStream *)self advancePositionByString:v4];
            [(_ACTUserActionStream *)self setLastTimestamp:v38];
          }
        }
      }
    }
    else
    {
      uint64_t v8 = 0;
      v40 = 0;
    }
  }
  return v8;
}

- (id)tryExtraKeyTap
{
  [(_ACTUserActionStream *)self lastTimestamp];
  double v4 = v3;
  [(_ACTUserActionStream *)self randomActionInterval];
  double v6 = v4 + v5;
  double v7 = [(_ACTUserActionStream *)self delegate];
  uint64_t v8 = [v7 keyboard];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = [(_ACTUserActionStream *)self errorGenerator];
  objc_msgSend(v17, "uniformRandomPointInRect:", v10, v12, v14, v16);
  double v19 = v18;
  double v21 = v20;

  double v22 = [(_ACTUserActionStream *)self delegate];
  double v23 = [(_ACTUserActionStream *)self delegate];
  v24 = [v23 keyplane];
  double v25 = objc_msgSend(v22, "keyContainingPoint:inKeyplane:", v24, v19, v21);

  double v26 = -[ACTExtraKeyTap initWithTouchedKey:location:timestamp:]([ACTExtraKeyTap alloc], "initWithTouchedKey:location:timestamp:", v25, v19, v21, v6);
  if (v26)
  {
    v27 = [(_ACTUserActionStream *)self cursor];
    if (![v27 positionInCurrentInternalSegment])
    {
      double v31 = [(_ACTUserActionStream *)self cursor];
      uint64_t v32 = [v31 currentExternalSegment];
      if (v32)
      {
        double v33 = (void *)v32;
        uint64_t v34 = [(_ACTUserActionStream *)self cursor];
        uint64_t v35 = [v34 currentExternalSegment];
        char v36 = [v35 isEqualToString:@" "];

        if (v36)
        {
          uint64_t v28 = [(_ACTUserActionStream *)self cursor];
          uint64_t v29 = [v28 segmentCursor] - 1;
          goto LABEL_5;
        }
LABEL_4:
        uint64_t v28 = [(_ACTUserActionStream *)self cursor];
        uint64_t v29 = [v28 segmentCursor];
LABEL_5:
        [(ACTUserAction *)v26 setInputSegment:v29];

        [(_ACTUserActionStream *)self setLastTimestamp:v6];
        goto LABEL_6;
      }
    }
    goto LABEL_4;
  }
LABEL_6:

  return v26;
}

- (id)trySubstituteKeyTap
{
  double v3 = [(_ACTUserActionStream *)self cursor];
  double v4 = [v3 currentLongCharacter];

  double v5 = [(_ACTUserActionStream *)self delegate];
  double v6 = [v5 keyplane];
  double v7 = [(_ACTUserActionStream *)self anyKeyForString:v4 keyplane:v6 wantSecondaryString:0 substituteUpperCaseForLowerCase:0];

  [(_ACTUserActionStream *)self lastTimestamp];
  double v9 = v8;
  [(_ACTUserActionStream *)self randomActionInterval];
  double v11 = v10;
  double v12 = [(_ACTUserActionStream *)self delegate];
  double v13 = [v12 keyboard];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = [(_ACTUserActionStream *)self errorGenerator];
  objc_msgSend(v22, "uniformRandomPointInRect:", v15, v17, v19, v21);
  double v24 = v23;
  double v26 = v25;

  v27 = [(_ACTUserActionStream *)self delegate];
  uint64_t v28 = [(_ACTUserActionStream *)self delegate];
  uint64_t v29 = [v28 keyplane];
  double v30 = objc_msgSend(v27, "keyContainingPoint:inKeyplane:", v29, v24, v26);

  double v31 = [(_ACTUserActionStream *)self userModel];
  if (![v31 prefersTransliteration]) {
    goto LABEL_6;
  }
  uint64_t v32 = [v30 representedString];
  if (([v32 isEqualToString:@" "] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  double v33 = [(_ACTUserActionStream *)self userModel];
  int v34 = [v33 spacesBetweenTransliterations];

  if (v34)
  {
    uint64_t v35 = [(_ACTUserActionStream *)self tryAcceptCandidate];
    goto LABEL_9;
  }
LABEL_7:
  double v36 = v9 + v11;
  uint64_t v35 = -[ACTSubstituteKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:]([ACTSubstituteKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:", v7, v30, 0, v24, v26, v36);
  if (v35)
  {
    v37 = [(_ACTUserActionStream *)self cursor];
    -[ACTUserAction setInputSegment:](v35, "setInputSegment:", [v37 segmentCursor]);

    [(_ACTUserActionStream *)self advancePositionByString:v4];
    [(_ACTUserActionStream *)self setLastTimestamp:v36];
  }
LABEL_9:

  return v35;
}

- (id)trySkipKeyTap
{
  double v3 = [(_ACTUserActionStream *)self cursor];
  double v4 = [v3 currentLongCharacter];

  double v5 = [(_ACTUserActionStream *)self delegate];
  double v6 = [v5 keyplane];
  double v7 = [(_ACTUserActionStream *)self anyKeyForString:v4 keyplane:v6 wantSecondaryString:0 substituteUpperCaseForLowerCase:0];

  [(_ACTUserActionStream *)self lastTimestamp];
  double v9 = v8;
  double v10 = [[ACTSkipKeyTap alloc] initWithIntendedKey:v7 timestamp:v8];
  if (v10)
  {
    double v11 = [(_ACTUserActionStream *)self cursor];
    -[ACTUserAction setInputSegment:](v10, "setInputSegment:", [v11 segmentCursor]);

    [(_ACTUserActionStream *)self advancePositionByString:v4];
    [(_ACTUserActionStream *)self setLastTimestamp:v9];
  }

  return v10;
}

- (id)tryTransposedKeyTaps
{
  double v3 = [(_ACTUserActionStream *)self cursor];
  double v4 = [v3 currentLongCharacter];

  double v5 = [(_ACTUserActionStream *)self delegate];
  double v6 = [v5 keyplane];
  double v7 = [(_ACTUserActionStream *)self anyKeyForString:v4 keyplane:v6 wantSecondaryString:0 substituteUpperCaseForLowerCase:0];

  double v8 = [(_ACTUserActionStream *)self cursor];
  double v9 = [v8 nextLongCharacter];

  double v10 = [(_ACTUserActionStream *)self delegate];
  double v11 = [v10 keyplane];
  double v12 = [(_ACTUserActionStream *)self anyKeyForString:v9 keyplane:v11 wantSecondaryString:0 substituteUpperCaseForLowerCase:0];

  double v13 = 0;
  if (v4 && v7 && v9 && v12)
  {
    [(_ACTUserActionStream *)self lastTimestamp];
    double v15 = v14;
    [(_ACTUserActionStream *)self randomActionInterval];
    double v17 = v15 + v16;
    double v18 = [(_ACTUserActionStream *)self errorGenerator];
    [v12 paddedFrame];
    uint64_t v19 = objc_msgSend(v18, "errorForKeyString:rect:", v9);

    double v20 = [(_ACTUserActionStream *)self delegate];
    [v20 pointForAttemptedTapOnKey:v12 withError:v19];
    double v22 = v21;
    double v24 = v23;

    double v25 = [(_ACTUserActionStream *)self delegate];
    double v26 = [(_ACTUserActionStream *)self delegate];
    v27 = [v26 keyplane];
    uint64_t v28 = objc_msgSend(v25, "keyContainingPoint:inKeyplane:", v27, v22, v24);

    int v48 = (void *)v28;
    v49 = (void *)v19;
    if (v28) {
      v50 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v12, v28, v19, 0, v22, v24, v17);
    }
    else {
      v50 = 0;
    }
    [(_ACTUserActionStream *)self randomActionInterval];
    double v30 = v29;
    double v31 = [(_ACTUserActionStream *)self errorGenerator];
    [v7 paddedFrame];
    uint64_t v32 = objc_msgSend(v31, "errorForKeyString:rect:", v4);

    double v33 = [(_ACTUserActionStream *)self delegate];
    [v33 pointForAttemptedTapOnKey:v7 withError:v32];
    double v35 = v34;
    double v37 = v36;

    double v38 = [(_ACTUserActionStream *)self delegate];
    v39 = [(_ACTUserActionStream *)self delegate];
    v40 = [v39 keyplane];
    v41 = objc_msgSend(v38, "keyContainingPoint:inKeyplane:", v40, v35, v37);

    if (v41)
    {
      double v42 = v17 + v30 * 0.5;
      v43 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v7, v41, v32, 0, v35, v37, v42);
      v44 = v43;
      double v13 = 0;
      v45 = v50;
      if (v50)
      {
        if (v43)
        {
          double v13 = [[ACTTransposeKeyTaps alloc] initWithFirstTap:v50 secondTap:v43];
          if (v13)
          {
            [(_ACTUserActionStream *)self setLastTimestamp:v42];
            v46 = [(_ACTUserActionStream *)self cursor];
            -[ACTUserAction setInputSegment:](v13, "setInputSegment:", [v46 segmentCursor]);

            v45 = v50;
            [(_ACTUserActionStream *)self advancePositionByString:v4];
            [(_ACTUserActionStream *)self advancePositionByString:v9];
          }
        }
      }
    }
    else
    {
      double v13 = 0;
      v44 = 0;
      v45 = v50;
    }
  }
  return v13;
}

- (id)tryTypingWillSuppressError:(BOOL *)a3
{
  *a3 = 0;
  if ([(_ACTUserActionStream *)self shouldIgnoreCurrentCharacter])
  {
    do
    {
      double v5 = [(_ACTUserActionStream *)self cursor];
      double v6 = [v5 currentLongCharacter];

      [(_ACTUserActionStream *)self advancePositionByString:v6];
    }
    while ([(_ACTUserActionStream *)self shouldIgnoreCurrentCharacter]);
  }
  double v7 = [(_ACTUserActionStream *)self cursor];
  char v8 = [v7 atEndOfText];

  if (v8)
  {
    double v9 = 0;
    goto LABEL_54;
  }
  double v10 = [(_ACTUserActionStream *)self userModel];
  if ([v10 prefersContinuousPath])
  {
    double v11 = [(_ACTUserActionStream *)self cursor];
    uint64_t v12 = [v11 positionInCurrentInternalSegment];

    if (!v12)
    {
      double v9 = [(_ACTUserActionStream *)self tryContinuousPath];
      goto LABEL_10;
    }
  }
  else
  {
  }
  double v9 = 0;
LABEL_10:
  double v13 = [(_ACTUserActionStream *)self errorGenerator];
  [v13 uniformRandomNumber];
  double v15 = v14;

  if (v9) {
    goto LABEL_54;
  }
  float v16 = v15;
  float v17 = 0.0;
  if (![(_ACTUserActionStream *)self isRetyping]
    && ![(_ACTUserActionStream *)self lastActionSuppressesError]
    && ![(_ACTUserActionStream *)self lastActionUseSecondaryString])
  {
    double v24 = [(_ACTUserActionStream *)self userModel];
    if ([v24 prefersTransliteration])
    {
      double v25 = [(_ACTUserActionStream *)self cursor];
      char v26 = [v25 nextLongCharacterEndsSegment];

      if (v26) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    [(_ACTUserActionStream *)self probabilityOfTransposition];
    float v17 = v29 + 0.0;
    if (v16 >= 0.0 && v17 > v16)
    {
      uint64_t v22 = [(_ACTUserActionStream *)self tryTransposedKeyTaps];
      if (v22) {
        goto LABEL_53;
      }
    }
  }
LABEL_14:
  if ([(_ACTUserActionStream *)self isRetyping]
    || [(_ACTUserActionStream *)self lastActionSuppressesError]
    || [(_ACTUserActionStream *)self lastActionUseSecondaryString])
  {
    float v18 = v17;
  }
  else
  {
    [(_ACTUserActionStream *)self probabilityOfSkippedKey];
    float v18 = v17 + v27;
    if (v17 <= v16 && v18 > v16)
    {
      uint64_t v22 = [(_ACTUserActionStream *)self trySkipKeyTap];
      if (v22) {
        goto LABEL_53;
      }
    }
  }
  if ([(_ACTUserActionStream *)self isRetyping]
    || [(_ACTUserActionStream *)self lastActionSuppressesError])
  {
    float v19 = v18;
  }
  else
  {
    [(_ACTUserActionStream *)self probabilityOfSubstituteKey];
    float v19 = v18 + v23;
    if (v18 <= v16 && v19 > v16)
    {
      uint64_t v22 = [(_ACTUserActionStream *)self trySubstituteKeyTap];
      if (v22) {
        goto LABEL_53;
      }
    }
  }
  if ([(_ACTUserActionStream *)self isRetyping]
    || [(_ACTUserActionStream *)self lastActionSuppressesError]
    || [(_ACTUserActionStream *)self lastActionUseSecondaryString])
  {
    float v20 = v19;
  }
  else
  {
    [(_ACTUserActionStream *)self probabilityOfExtraneousKey];
    float v20 = v19 + v28;
    if (v19 <= v16 && v20 > v16)
    {
      uint64_t v22 = [(_ACTUserActionStream *)self tryExtraKeyTap];
      if (v22) {
        goto LABEL_53;
      }
    }
  }
  if ([(_ACTUserActionStream *)self isRetyping]
    || [(_ACTUserActionStream *)self lastActionSuppressesError]
    || [(_ACTUserActionStream *)self lastActionUseSecondaryString]
    || ([(_ACTUserActionStream *)self probabilityOfDoubledKey], v20 > v16)
    || (float)(v20 + v21) <= v16
    || ([(_ACTUserActionStream *)self tryDoubleKeyTap],
        (uint64_t v22 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v9 = [(_ACTUserActionStream *)self tryKeyTap];
    if (v9) {
      goto LABEL_54;
    }
    uint64_t v22 = [(_ACTUserActionStream *)self tryChangeKeyplane];
    if (!v22)
    {
      double v9 = [(_ACTUserActionStream *)self trySelectPopupVariant];
      goto LABEL_54;
    }
  }
LABEL_53:
  double v9 = (void *)v22;
  *a3 = 1;
LABEL_54:
  return v9;
}

- (id)tryPeriodShortcut
{
  double v3 = [(_ACTUserActionStream *)self userModel];
  int v4 = [v3 prefersSpaceBarDoubleTap];

  if (!v4)
  {
    double v9 = 0;
    goto LABEL_27;
  }
  double v5 = [(_ACTUserActionStream *)self cursor];
  double v6 = [v5 currentLongCharacter];

  double v7 = [(_ACTUserActionStream *)self cursor];
  char v8 = [v7 nextLongCharacter];

  double v9 = 0;
  if (v6 && v8)
  {
    double v10 = [v6 stringByAppendingString:v8];
    if (![v10 isEqualToString:@". "])
    {
      double v9 = 0;
LABEL_25:

      goto LABEL_26;
    }
    double v11 = [(_ACTUserActionStream *)self delegate];
    uint64_t v12 = [v11 keyboardController];
    double v13 = [v12 layoutUtils];
    double v14 = [(_ACTUserActionStream *)self delegate];
    double v15 = [v14 keyplane];
    float v16 = [v13 exactKeyForString:@" " keyplane:v15];

    if (!v16)
    {
      double v9 = 0;
LABEL_24:

      goto LABEL_25;
    }
    [(_ACTUserActionStream *)self lastTimestamp];
    double v18 = v17;
    [(_ACTUserActionStream *)self randomActionInterval];
    double v20 = v18 + v19;
    float v21 = [(_ACTUserActionStream *)self errorGenerator];
    [v16 paddedFrame];
    uint64_t v22 = objc_msgSend(v21, "errorForKeyString:rect:", @" ");

    float v23 = [(_ACTUserActionStream *)self delegate];
    [v23 pointForAttemptedTapOnKey:v16 withError:v22];
    double v25 = v24;
    double v27 = v26;

    float v28 = [(_ACTUserActionStream *)self delegate];
    float v29 = [(_ACTUserActionStream *)self delegate];
    double v30 = [v29 keyplane];
    uint64_t v31 = objc_msgSend(v28, "keyContainingPoint:inKeyplane:", v30, v25, v27);

    long long v53 = (void *)v31;
    long long v54 = (void *)v22;
    if (v31) {
      v55 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v16, v31, v22, 0, v25, v27, v20);
    }
    else {
      v55 = 0;
    }
    [(_ACTUserActionStream *)self randomActionInterval];
    double v33 = v20 + v32 * 0.5;
    double v34 = [(_ACTUserActionStream *)self errorGenerator];
    [v16 paddedFrame];
    double v35 = objc_msgSend(v34, "errorForKeyString:rect:", @" ");

    double v36 = [(_ACTUserActionStream *)self delegate];
    [v36 pointForAttemptedTapOnKey:v16 withError:v35];
    double v38 = v37;
    double v40 = v39;

    v41 = [(_ACTUserActionStream *)self delegate];
    double v42 = [(_ACTUserActionStream *)self delegate];
    v43 = [v42 keyplane];
    v44 = objc_msgSend(v41, "keyContainingPoint:inKeyplane:", v43, v38, v40);

    if (v44)
    {
      v45 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", 0, v44, v35, 0, v38, v40, v33);
      v46 = v45;
      v47 = v55;
      BOOL v48 = v55 != 0;
      if (v55 && v45)
      {
        v49 = [[ACTDoubleKeyTap alloc] initWithFirstTap:v55 secondTap:v45];
LABEL_21:
        double v9 = v49;
        if (v49)
        {
          long long v51 = [(_ACTUserActionStream *)self cursor];
          -[ACTUserAction setInputSegment:](v9, "setInputSegment:", [v51 segmentCursor]);

          v47 = v55;
          [(_ACTUserActionStream *)self advancePositionByString:v10];
          [(_ACTUserActionStream *)self setLastTimestamp:v33];
        }

        goto LABEL_24;
      }
    }
    else
    {
      v46 = 0;
      v47 = v55;
      BOOL v48 = v55 != 0;
    }
    if (v48) {
      v50 = v47;
    }
    else {
      v50 = v46;
    }
    v49 = v50;
    goto LABEL_21;
  }
LABEL_26:

LABEL_27:
  return v9;
}

- (id)tryBackspacing
{
  BOOL v3 = [(_ACTUserActionStream *)self canBeginBackspacing];
  BOOL v4 = [(_ACTUserActionStream *)self canContinueBackspacing];
  BOOL v5 = v4;
  if (!v3 && !v4)
  {
LABEL_3:
    double v6 = 0;
    goto LABEL_4;
  }
  if (v3)
  {
    double v14 = [(_ACTUserActionStream *)self cursor];
    unint64_t v15 = [v14 segmentCursor];
    float v16 = [(_ACTUserActionStream *)self userModel];
    unint64_t v17 = [v16 maxPriorSegmentsCheckedForErrors];

    if (v15 <= v17)
    {
      unint64_t v21 = 0;
    }
    else
    {
      double v18 = [(_ACTUserActionStream *)self cursor];
      uint64_t v19 = [v18 segmentCursor];
      double v20 = [(_ACTUserActionStream *)self userModel];
      unint64_t v21 = v19 - [v20 maxPriorSegmentsCheckedForErrors];
    }
    unint64_t v37 = [(_ACTUserActionStream *)self segmentEditHorizon];
    if (v37 <= v21) {
      unint64_t v38 = v21;
    }
    else {
      unint64_t v38 = v37;
    }
    [(_ACTUserActionStream *)self setSegmentEditHorizon:v38];
  }
  long long v114 = xmmword_23F04A3D0;
  uint64_t v39 = [(_ACTUserActionStream *)self documentEditRangeWithSegmentRangePtr:&v114];
  if (v39 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_30;
  }
  unint64_t v41 = v114;
  if ((void)v114 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_30;
  }
  uint64_t v42 = v39;
  uint64_t v43 = v40;
  if (v41 < [(_ACTUserActionStream *)self segmentEditHorizon]
    || [(_ACTUserActionStream *)self hasDesiredAutocorrection])
  {
    goto LABEL_30;
  }
  v44 = [(_ACTUserActionStream *)self cursor];
  if ([v44 segmentCursor])
  {
    v45 = [(_ACTUserActionStream *)self cursor];
    if ([v45 positionInCurrentInternalSegment])
    {
      BOOL v112 = 0;
    }
    else
    {
      v110 = [(_ACTUserActionStream *)self cursor];
      v49 = [v110 externalSegments];
      v50 = [(_ACTUserActionStream *)self cursor];
      long long v51 = objc_msgSend(v49, "objectAtIndex:", objc_msgSend(v50, "segmentCursor") - 1);
      BOOL v112 = !_isWordEndingKey(v51);
    }
  }
  else
  {
    BOOL v112 = 0;
  }

  long long v52 = [(_ACTUserActionStream *)self cursor];
  if ([v52 segmentCursor])
  {
    long long v53 = [(_ACTUserActionStream *)self cursor];
    long long v54 = [v53 externalSegments];
    v55 = [(_ACTUserActionStream *)self cursor];
    v56 = objc_msgSend(v54, "objectAtIndex:", objc_msgSend(v55, "segmentCursor") - 1);
    LODWORD(v110) = _isWordEndingKey(v56);
  }
  else
  {
    LODWORD(v110) = 0;
  }

  v57 = [(_ACTUserActionStream *)self cursor];
  if ([v57 atEndOfText])
  {
    id v58 = [(_ACTUserActionStream *)self cursor];
    v59 = [v58 externalSegments];
    v60 = [v59 lastObject];
    BOOL v61 = !_isWordEndingKey(v60);
  }
  else
  {
    BOOL v61 = 0;
  }

  if (v43)
  {
    uint64_t v62 = [(_ACTUserActionStream *)self delegate];
    v63 = [v62 document];
    uint64_t v64 = objc_msgSend(v63, "substringWithRange:", v42, v43);

    char v65 = [(_ACTUserActionStream *)self cursor];
    uint64_t v66 = [v65 externalSegments];
    v67 = [v66 subarrayWithRange:v114];
    uint64_t v68 = [v67 componentsJoinedByString:&stru_26F2B7E50];

    if ([v64 length] && (objc_msgSend(v68, "hasPrefix:", v64) & 1) == 0)
    {
      if (!v3) {
        goto LABEL_64;
      }
      if ((v112 || v61)
        && [(_ACTUserActionStream *)self shouldBeginCorrectingAfterWord])
      {
        BOOL v69 = 1;
LABEL_66:
        LODWORD(v110) = v69;
        v78 = [(_ACTUserActionStream *)self delegate];
        v79 = [v78 keyboardController];
        v80 = [v79 layoutUtils];
        v81 = [(_ACTUserActionStream *)self delegate];
        v82 = [v81 keyplane];
        v83 = [v80 exactKeyForString:@"Delete" keyplane:v82 includeSecondaryStrings:0];

        v84 = v83;
        [(_ACTUserActionStream *)self lastTimestamp];
        double v86 = v85;
        [(_ACTUserActionStream *)self randomActionInterval];
        double v88 = v86 + v87;
        v89 = [(_ACTUserActionStream *)self errorGenerator];
        [v83 paddedFrame];
        v90 = objc_msgSend(v89, "errorForKeyString:rect:", @"Delete");

        v91 = [(_ACTUserActionStream *)self delegate];
        [v91 pointForAttemptedTapOnKey:v83 withError:v90];
        double v93 = v92;
        double v95 = v94;

        v96 = [(_ACTUserActionStream *)self delegate];
        v97 = [(_ACTUserActionStream *)self delegate];
        v98 = [v97 keyplane];
        v99 = objc_msgSend(v96, "keyContainingPoint:inKeyplane:", v98, v93, v95);

        if (v99) {
          v100 = -[ACTKeyTap initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:]([ACTKeyTap alloc], "initWithIntendedKey:touchedKey:error:location:timestamp:secondaryString:", v84, v99, v90, 0, v93, v95, v88);
        }
        else {
          v100 = [[ACTSkipKeyTap alloc] initWithIntendedKey:v84 timestamp:v88];
        }
        double v6 = (ACTBackspaceMentalCursor *)v100;
        v113 = v84;
        if (v111)
        {
          v105 = [(_ACTUserActionStream *)self cursor];
          -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:](self, "setSegmentCursorBeforeBackspacing:", [v105 segmentCursor]);
        }
        while (1)
        {
          v106 = [(_ACTUserActionStream *)self cursor];
          unint64_t v107 = [v106 segmentCursor];
          unint64_t v108 = v114;

          if (v107 <= v108) {
            break;
          }
          [(_ACTUserActionStream *)self rewindSegmentCursor];
        }
        v109 = [(_ACTUserActionStream *)self cursor];
        -[ACTUserAction setInputSegment:](v6, "setInputSegment:", [v109 segmentCursor]);

        [(_ACTUserActionStream *)self setLastTimestamp:v88];
        goto LABEL_69;
      }
      if ((v110 | v61) == 1) {
        BOOL v69 = [(_ACTUserActionStream *)self shouldBeginCorrectingAfterWordTerminator];
      }
      else {
LABEL_64:
      }
        BOOL v69 = 0;
      if (v5 || v69) {
        goto LABEL_66;
      }
    }
    double v6 = 0;
LABEL_69:

    goto LABEL_4;
  }
  if (*((void *)&v114 + 1)) {
    BOOL v70 = v3;
  }
  else {
    BOOL v70 = 0;
  }
  if (!v70) {
    goto LABEL_3;
  }
  unint64_t v71 = v114;
  v72 = [(_ACTUserActionStream *)self cursor];
  unint64_t v73 = [v72 segmentCursor];

  if (v71 >= v73) {
    goto LABEL_3;
  }
  if ((!v112 && !v61 || ![(_ACTUserActionStream *)self shouldBeginCorrectingAfterWord])
    && ((v110 | v61) != 1
     || ![(_ACTUserActionStream *)self shouldBeginCorrectingAfterWordTerminator]))
  {
    goto LABEL_3;
  }
  double v6 = objc_alloc_init(ACTBackspaceMentalCursor);
  v74 = [(_ACTUserActionStream *)self cursor];
  -[_ACTUserActionStream setSegmentCursorBeforeBackspacing:](self, "setSegmentCursorBeforeBackspacing:", [v74 segmentCursor]);

  while (1)
  {
    v75 = [(_ACTUserActionStream *)self cursor];
    unint64_t v76 = [v75 segmentCursor];
    unint64_t v77 = v114;

    if (v76 <= v77) {
      break;
    }
    [(_ACTUserActionStream *)self rewindSegmentCursor];
  }
  v101 = [(_ACTUserActionStream *)self cursor];
  -[ACTUserAction setInputSegment:](v6, "setInputSegment:", [v101 segmentCursor]);

  [(_ACTUserActionStream *)self lastTimestamp];
  double v103 = v102;
  [(_ACTUserActionStream *)self randomActionInterval];
  [(_ACTUserActionStream *)self setLastTimestamp:v103 + v104];
LABEL_4:
  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5;
  }
  if (!v7) {
    goto LABEL_31;
  }
  long long v114 = xmmword_23F04A3D0;
  uint64_t v8 = [(_ACTUserActionStream *)self documentEditRangeWithSegmentRangePtr:&v114];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = [(_ACTUserActionStream *)self cursor];
    double v11 = [v10 currentInternalSegment];
    uint64_t v12 = [(_ACTUserActionStream *)self cursor];
    double v13 = objc_msgSend(v11, "substringToIndex:", objc_msgSend(v12, "positionInCurrentInternalSegment"));

    [(_ACTUserActionStream *)self rewindPositionByString:v13];
  }
  else
  {
    uint64_t v22 = v8;
    uint64_t v23 = v9;
    double v24 = [(_ACTUserActionStream *)self delegate];
    double v25 = [v24 document];
    double v13 = objc_msgSend(v25, "substringWithRange:", v22, v23);

    double v26 = [(_ACTUserActionStream *)self externalStringToInternal:v13];
    unint64_t v27 = [v26 length];
    float v28 = [(_ACTUserActionStream *)self cursor];
    unint64_t v29 = [v28 positionInCurrentInternalSegment];

    double v30 = [(_ACTUserActionStream *)self cursor];
    uint64_t v31 = [v30 currentInternalSegment];
    if (v27 <= v29)
    {
      uint64_t v46 = [v26 length];
      v47 = [(_ACTUserActionStream *)self cursor];
      double v36 = objc_msgSend(v31, "substringWithRange:", v46, objc_msgSend(v47, "positionInCurrentInternalSegment") - objc_msgSend(v26, "length"));

      [(_ACTUserActionStream *)self rewindPositionByString:v36];
    }
    else
    {
      double v32 = [(_ACTUserActionStream *)self cursor];
      uint64_t v33 = [v32 positionInCurrentInternalSegment];
      uint64_t v34 = [v26 length];
      double v35 = [(_ACTUserActionStream *)self cursor];
      double v36 = objc_msgSend(v31, "substringWithRange:", v33, v34 - objc_msgSend(v35, "positionInCurrentInternalSegment"));

      [(_ACTUserActionStream *)self advancePositionByString:v36];
    }
  }
LABEL_30:
  double v6 = 0;
LABEL_31:
  return v6;
}

- (BOOL)shouldRejectBadAutocorrection
{
  if ([(_ACTUserActionStream *)self preferPredictionSelection])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(_ACTUserActionStream *)self preferManualCorrection];
    if (v3)
    {
      BOOL v4 = [(_ACTUserActionStream *)self userModel];
      [v4 probRejectBadAutocorrection];
      float v6 = v5;

      BOOL v7 = [(_ACTUserActionStream *)self errorGenerator];
      [v7 uniformRandomNumber];
      float v9 = v8;

      LOBYTE(v3) = v6 > v9;
    }
  }
  return v3;
}

- (BOOL)shouldBeginCorrectingAfterWordTerminator
{
  BOOL v3 = [(_ACTUserActionStream *)self userModel];
  [v3 probBeginCorrectingAfterWordTerminator];
  float v5 = v4;

  float v6 = [(_ACTUserActionStream *)self errorGenerator];
  [v6 uniformRandomNumber];
  float v8 = v7;

  return v5 > v8;
}

- (BOOL)shouldBeginCorrectingAfterWord
{
  BOOL v3 = [(_ACTUserActionStream *)self userModel];
  [v3 probBeginCorrectingAfterWord];
  float v5 = v4;

  float v6 = [(_ACTUserActionStream *)self errorGenerator];
  [v6 uniformRandomNumber];
  float v8 = v7;

  return v5 > v8;
}

- (BOOL)canContinueBackspacing
{
  BOOL v3 = [(_ACTUserActionStream *)self isBackspacing];
  if (v3)
  {
    LOBYTE(v3) = [(_ACTUserActionStream *)self preferManualCorrection];
  }
  return v3;
}

- (BOOL)canBeginBackspacing
{
  if ([(_ACTUserActionStream *)self isBackspacing]) {
    return 0;
  }
  BOOL v3 = [(_ACTUserActionStream *)self cursor];
  uint64_t v4 = [v3 segmentCursor];

  if (!v4) {
    return 0;
  }
  float v5 = [(_ACTUserActionStream *)self cursor];
  uint64_t v6 = [v5 positionInCurrentInternalSegment];

  if (v6) {
    return 0;
  }
  return [(_ACTUserActionStream *)self preferManualCorrection];
}

- (_NSRange)documentEditRangeWithSegmentRangePtr:(_NSRange *)a3
{
  float v5 = [(_ACTUserActionStream *)self delegate];
  uint64_t v6 = [v5 document];

  double v7 = objc_opt_class();
  float v8 = [(_ACTUserActionStream *)self cursor];
  uint64_t v9 = [v7 segmentAnchorRangeForCursor:v8 withDocumentBefore:v6];
  uint64_t v11 = v10;

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = 0;
    *a3 = (_NSRange)xmmword_23F04A3D0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    double v35 = a3;
    double v14 = [(_ACTUserActionStream *)self cursor];
    unint64_t v15 = [v14 externalSegments];
    float v16 = objc_msgSend(v15, "subarrayWithRange:", v9, v11);
    uint64_t v17 = [v16 componentsJoinedByString:&stru_26F2B7E50];

    uint64_t v34 = (void *)v17;
    uint64_t v18 = [v6 rangeOfString:v17 options:4];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v19;
    }
    if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = v18;
    }
    uint64_t v13 = v20 + v21;
    uint64_t v12 = [v6 length] - (v20 + v21);
    NSUInteger v22 = v9 + v11;
    uint64_t v23 = [(_ACTUserActionStream *)self cursor];
    unint64_t v24 = [v23 segmentCursor];
    double v25 = [(_ACTUserActionStream *)self cursor];
    double v26 = [v25 externalSegments];
    unint64_t v27 = [v26 count];
    float v28 = [(_ACTUserActionStream *)self cursor];
    unint64_t v29 = v28;
    if (v24 >= v27)
    {
      uint64_t v31 = [v28 externalSegments];
      uint64_t v30 = [v31 count];
    }
    else
    {
      uint64_t v30 = [v28 segmentCursor] + 1;
    }

    v35->location = v22;
    v35->length = v30 - v22;
  }
  NSUInteger v32 = v13;
  NSUInteger v33 = v12;
  result.length = v33;
  result.location = v32;
  return result;
}

- (BOOL)isRetyping
{
  if ([(_ACTUserActionStream *)self isBackspacing]
    || [(_ACTUserActionStream *)self segmentCursorBeforeBackspacing] == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }
  uint64_t v4 = [(_ACTUserActionStream *)self cursor];
  unint64_t v5 = [v4 segmentCursor];
  BOOL v3 = v5 < [(_ACTUserActionStream *)self segmentCursorBeforeBackspacing];

  return v3;
}

- (id)tryRejectCandidate
{
  BOOL v3 = [(_ACTUserActionStream *)self delegate];
  uint64_t v4 = [v3 autocorrection];

  if (!v4) {
    goto LABEL_14;
  }
  unint64_t v5 = [(_ACTUserActionStream *)self cursor];
  if ([v5 positionInCurrentInternalSegment]) {
    goto LABEL_3;
  }
  if ([(_ACTUserActionStream *)self preferPredictionSelection])
  {
  }
  else
  {
    BOOL v7 = [(_ACTUserActionStream *)self preferManualCorrection];

    if (!v7) {
      goto LABEL_14;
    }
  }
  float v8 = [(_ACTUserActionStream *)self cursor];
  uint64_t v9 = [v8 rangeOfInputSegmentsForCandidate:v4];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = (void *)MEMORY[0x263F7E640];
    uint64_t v11 = [v4 input];
    unint64_t v5 = [v10 candidateWithUnchangedInput:v11];

    uint64_t v12 = [(_ACTUserActionStream *)self cursor];
    uint64_t v13 = [v12 rangeOfInputSegmentsForCandidate:v5];

    if (v13 != 0x7FFFFFFFFFFFFFFFLL
      && [(_ACTUserActionStream *)self shouldRejectBadAutocorrection])
    {
      [(_ACTUserActionStream *)self lastTimestamp];
      double v15 = v14;
      [(_ACTUserActionStream *)self randomActionInterval];
      double v17 = v15 + v16;
      uint64_t v6 = [[ACTRejectCandidate alloc] initWithCandidate:v4 timestamp:v17];
      if (v6)
      {
        uint64_t v18 = [(_ACTUserActionStream *)self cursor];
        if ([v18 segmentCursor])
        {
          uint64_t v19 = [(_ACTUserActionStream *)self cursor];
          -[ACTUserAction setInputSegment:](v6, "setInputSegment:", [v19 segmentCursor] - 1);
        }
        else
        {
          [(ACTUserAction *)v6 setInputSegment:1];
        }

        [(_ACTUserActionStream *)self setLastTimestamp:v17];
      }
      goto LABEL_4;
    }
LABEL_3:
    uint64_t v6 = 0;
LABEL_4:

    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
LABEL_15:

  return v6;
}

- (id)tryAcceptingCandidate:(id)a3
{
  id v4 = a3;
  [(_ACTUserActionStream *)self lastTimestamp];
  double v6 = v5;
  [(_ACTUserActionStream *)self randomActionInterval];
  double v8 = v6 + v7;
  uint64_t v9 = [(_ACTUserActionStream *)self userModel];
  int v10 = [v9 prefersTransliteration];

  if (!v10)
  {
    uint64_t v18 = [[ACTAcceptCandidate alloc] initWithCandidate:v4 timestamp:v8];
    if (!v18) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  uint64_t v11 = [(_ACTUserActionStream *)self cursor];
  uint64_t v12 = [v11 externalSegments];
  uint64_t v13 = [(_ACTUserActionStream *)self cursor];
  double v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v13, "segmentCursor"));

  partialCandidateIntendedChunk = self->_partialCandidateIntendedChunk;
  if (partialCandidateIntendedChunk)
  {
    double v16 = partialCandidateIntendedChunk;

    double v17 = self->_partialCandidateIntendedChunk;
    self->_partialCandidateIntendedChunk = 0;

    double v14 = v16;
  }
  uint64_t v18 = [[ACTAcceptCandidate alloc] initWithCandidate:v4 timestamp:v14 intendedCandidate:v8];

  if (v18)
  {
LABEL_7:
    uint64_t v19 = [(_ACTUserActionStream *)self cursor];
    -[ACTUserAction setInputSegment:](v18, "setInputSegment:", [v19 segmentCursor]);

    if ([(_ACTUserActionStream *)self advancePositionByAcceptingCandidate:v4])
    {
      [(_ACTUserActionStream *)self setLastTimestamp:v8];
    }
    else
    {

      uint64_t v18 = 0;
    }
  }
LABEL_10:

  return v18;
}

- (id)candidateToSelectFromCandidates:(id)a3
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56___ACTUserActionStream_candidateToSelectFromCandidates___block_invoke;
  v9[3] = &unk_265050340;
  v9[4] = self;
  id v3 = a3;
  id v4 = [v3 indexesOfObjectsPassingTest:v9];
  double v5 = [v3 objectsAtIndexes:v4];

  double v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_5595];
  double v7 = [v6 firstObject];

  return v7;
}

- (id)transliterationCandidate:(id)a3
{
  id v4 = a3;
  double v5 = [(_ACTUserActionStream *)self cursor];
  uint64_t v6 = [v5 segmentCursor];

  double v7 = [(_ACTUserActionStream *)self cursor];
  if ([v7 positionInCurrentInternalSegment]) {
    goto LABEL_2;
  }
  uint64_t v12 = [(_ACTUserActionStream *)self cursor];
  if (![v12 segmentCursor])
  {

LABEL_2:
    goto LABEL_3;
  }
  int64_t v13 = v6 - 1;
  int64_t v14 = [(_ACTUserActionStream *)self lastCursorPositionForTransliteratedCandidate];

  if (v14 < v13)
  {
    uint64_t v9 = [(_ACTUserActionStream *)self matchTransliterationCandidateToSegment:v4 withCursorAt:v13];
    if (v9)
    {
LABEL_36:
      [(_ACTUserActionStream *)self setLastCursorPositionForTransliteratedCandidate:v13];
      [(_ACTUserActionStream *)self rewindSegmentCursor];
      goto LABEL_5;
    }
    double v15 = [(_ACTUserActionStream *)self cursor];
    double v16 = [v15 internalSegments];
    double v17 = [v16 objectAtIndex:v13];
    uint64_t v18 = [(_ACTUserActionStream *)self cursor];
    uint64_t v19 = [v18 externalSegments];
    uint64_t v20 = [v19 objectAtIndex:v13];
    uint64_t v21 = [v17 caseInsensitiveCompare:v20];

    if ([(TIKeyboardTyperUserModel *)self->_userModel usePartialCandidates] && v21)
    {
      NSUInteger v22 = [(_ACTUserActionStream *)self cursor];
      uint64_t v23 = [v22 externalSegments];
      unint64_t v24 = [v23 objectAtIndexedSubscript:v13];
      double v25 = (NSString *)[v24 copy];
      partialCandidateSuffix = self->_partialCandidateSuffix;
      self->_partialCandidateSuffix = v25;

      uint64_t v27 = [(_ACTUserActionStream *)self findPartialCandidate];
LABEL_35:
      uint64_t v9 = (void *)v27;
      goto LABEL_36;
    }
    if (v21)
    {
      float v28 = [(_ACTUserActionStream *)self delegate];
      unint64_t v29 = [v28 keyboardController];
      uint64_t v30 = [v29 inputMode];
      uint64_t v31 = [v30 normalizedIdentifier];
      if ([v31 hasSuffix:@"-Translit"]
        && (unint64_t)[v4 count] >= 2)
      {
        NSUInteger v32 = [v4 objectAtIndexedSubscript:0];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          NSUInteger v33 = [v4 objectAtIndexedSubscript:1];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v27 = [v4 objectAtIndexedSubscript:1];
            goto LABEL_35;
          }
LABEL_34:
          uint64_t v27 = [v4 firstObject];
          goto LABEL_35;
        }
      }
      goto LABEL_34;
    }
    double v35 = [v4 firstObject];
    double v36 = [(_ACTUserActionStream *)self cursor];
    unint64_t v37 = [v36 internalSegments];
    unint64_t v38 = [v37 objectAtIndex:v13];

    uint64_t v39 = [v35 input];
    if ([v39 length])
    {
      unint64_t v40 = [v38 length];
      unint64_t v41 = [v35 input];
      if (v40 > [v41 length])
      {
        uint64_t v42 = [v38 lowercaseString];
        uint64_t v43 = [v35 input];
        v44 = [v43 lowercaseString];
        char v52 = [v42 hasSuffix:v44];

        if (v52)
        {
          id v45 = [v35 input];
          int v46 = 0;
LABEL_28:
          v47 = [(_ACTUserActionStream *)self cursor];
          BOOL v48 = [v47 externalSegments];
          v49 = [v48 objectAtIndex:v13];

          if (v46)
          {
            id v50 = v49;
          }
          else
          {
            objc_msgSend(v49, "substringFromIndex:", objc_msgSend(v49, "length") - objc_msgSend(v45, "length"));
            id v50 = (id)objc_claimAutoreleasedReturnValue();
          }
          long long v51 = v50;
          uint64_t v9 = [MEMORY[0x263F7E640] candidateWithCandidate:v50 forInput:v45];

          goto LABEL_36;
        }
LABEL_27:
        id v45 = v38;
        int v46 = 1;
        goto LABEL_28;
      }
    }
    goto LABEL_27;
  }
LABEL_3:
  double v8 = [(_ACTUserActionStream *)self cursor];
  uint64_t v9 = -[_ACTUserActionStream matchTransliterationCandidateToSegment:withCursorAt:](self, "matchTransliterationCandidateToSegment:withCursorAt:", v4, [v8 segmentCursor]);

  if (v9)
  {
    int v10 = [(_ACTUserActionStream *)self cursor];
    -[_ACTUserActionStream setLastCursorPositionForTransliteratedCandidate:](self, "setLastCursorPositionForTransliteratedCandidate:", [v10 segmentCursor]);
  }
LABEL_5:

  return v9;
}

- (id)findPartialCandidate
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(_ACTUserActionStream *)self delegate];
  id v4 = [v3 predictionBarCandidates];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    double v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int64_t v13 = objc_msgSend(v12, "candidate", (void)v23);
        if ([(NSString *)self->_partialCandidateSuffix hasPrefix:v13]
          && [v13 length] > v9)
        {
          unint64_t v9 = [v13 length];
          id v14 = v12;

          double v8 = v14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);

    if (v8)
    {
      NSUInteger v15 = [(NSString *)self->_partialCandidateSuffix length];
      partialCandidateSuffix = self->_partialCandidateSuffix;
      if (v9 == v15)
      {
        double v17 = 0;
      }
      else
      {
        double v17 = [(NSString *)partialCandidateSuffix substringFromIndex:v9];
        partialCandidateSuffix = self->_partialCandidateSuffix;
      }
      self->_partialCandidateSuffix = v17;

      uint64_t v21 = [v8 candidate];
      partialCandidateIntendedChunk = self->_partialCandidateIntendedChunk;
      self->_partialCandidateIntendedChunk = v21;
      goto LABEL_18;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_partialCandidateIntendedChunk, self->_partialCandidateSuffix);
  uint64_t v18 = self->_partialCandidateSuffix;
  self->_partialCandidateSuffix = 0;

  partialCandidateIntendedChunk = [v5 firstObject];
  uint64_t v20 = [partialCandidateIntendedChunk input];
  double v8 = [MEMORY[0x263F7E640] candidateWithCandidate:@"NO_PARTIAL_CANDIDATE" forInput:v20];

LABEL_18:
  return v8;
}

- (id)matchTransliterationCandidateToSegment:(id)a3 withCursorAt:(int)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 < 0
    || ([(_ACTUserActionStream *)self cursor],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 externalSegments],
        double v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 count],
        v8,
        v7,
        v9 <= a4))
  {
    id v16 = 0;
  }
  else
  {
    uint64_t v10 = [(_ACTUserActionStream *)self cursor];
    uint64_t v11 = [v10 externalSegments];
    uint64_t v12 = [v11 objectAtIndexedSubscript:a4];

    int64_t v13 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    id v14 = [v12 stringByTrimmingCharactersInSet:v13];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v6;
    id v16 = (id)[v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      long long v24 = v12;
      id v25 = v6;
      uint64_t v17 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          uint64_t v20 = objc_msgSend(v19, "candidate", v24, v25, (void)v26);
          uint64_t v21 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          NSUInteger v22 = [v20 stringByTrimmingCharactersInSet:v21];

          if ([v22 isEqualToString:v14])
          {
            id v16 = v19;

            goto LABEL_14;
          }
        }
        id v16 = (id)[v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_14:
      uint64_t v12 = v24;
      id v6 = v25;
    }
  }
  return v16;
}

- (id)tryAcceptCandidate
{
  if (![(_ACTUserActionStream *)self preferPredictionSelection]
    && ![(_ACTUserActionStream *)self preferInlineSelection])
  {
    id v25 = 0;
    goto LABEL_29;
  }
  id v3 = [(_ACTUserActionStream *)self delegate];
  id v4 = [v3 predictionBarCandidates];

  id v5 = [(_ACTUserActionStream *)self delegate];
  id v6 = [v5 inlineCompletionCandidates];

  uint64_t v7 = [(_ACTUserActionStream *)self userModel];
  int v8 = [v7 prefersTransliteration];

  if (v8)
  {
    if (self->_partialCandidateSuffix) {
      [(_ACTUserActionStream *)self findPartialCandidate];
    }
    else {
    uint64_t v9 = [(_ACTUserActionStream *)self transliterationCandidate:v4];
    }
    goto LABEL_21;
  }
  if (![v6 count])
  {
LABEL_17:
    if ([(_ACTUserActionStream *)self preferInlineSelection])
    {
      long long v26 = 0;
      goto LABEL_27;
    }
    uint64_t v9 = [(_ACTUserActionStream *)self candidateToSelectFromCandidates:v4];
LABEL_21:
    long long v26 = (void *)v9;
    if (v9) {
      goto LABEL_22;
    }
    goto LABEL_27;
  }
  uint64_t v31 = v4;
  uint64_t v10 = [v6 firstObject];
  uint64_t v11 = [(_ACTUserActionStream *)self delegate];
  uint64_t v12 = [v10 candidate];
  int64_t v13 = [v11 inputSegmentsForString:v12];

  uint64_t v14 = [v13 count];
  if (!v14)
  {
LABEL_16:

    id v4 = v31;
    goto LABEL_17;
  }
  for (uint64_t i = v14 - 1; ; --i)
  {
    id v16 = [v13 objectAtIndexedSubscript:i];
    BOOL isSpaceKey = _isSpaceKey(v16);

    if (isSpaceKey) {
      goto LABEL_13;
    }
    uint64_t v18 = (void *)[v10 copy];
    uint64_t v19 = objc_msgSend(v13, "subarrayWithRange:", 0, i + 1);
    uint64_t v20 = [v19 componentsJoinedByString:&stru_26F2B7E50];
    uint64_t v21 = [v18 candidateByReplacingWithCandidate:v20];

    id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v22 addObject:v21];
    uint64_t v23 = [(_ACTUserActionStream *)self candidateToSelectFromCandidates:v22];
    if (v23) {
      break;
    }
    BOOL v24 = [(_ACTUserActionStream *)self preferInlineSelection];

    if (v24) {
      goto LABEL_16;
    }
LABEL_13:
    if (!i) {
      goto LABEL_16;
    }
  }
  long long v26 = (void *)v23;

  id v4 = v31;
LABEL_22:
  if ([v26 isAutocorrection]) {
    goto LABEL_26;
  }
  long long v27 = [(_ACTUserActionStream *)self userModel];
  if ([v27 prefersTransliteration])
  {

    goto LABEL_26;
  }
  long long v28 = [(_ACTUserActionStream *)self userModel];
  int v29 = [v28 prefersContinuousPath];

  if (v29)
  {
LABEL_26:
    id v25 = [(_ACTUserActionStream *)self tryAcceptingCandidate:v26];
    goto LABEL_28;
  }
LABEL_27:
  id v25 = 0;
LABEL_28:

LABEL_29:
  return v25;
}

- (BOOL)isFinished
{
  v2 = [(_ACTUserActionStream *)self cursor];
  char v3 = [v2 atEndOfText];

  return v3;
}

- (id)nextUserAction
{
  [(_ACTUserActionStream *)self advancePositionForAutospace];
  char v9 = 0;
  uint64_t v3 = [(_ACTUserActionStream *)self tryAcceptCandidate];
  if (v3
    || ([(_ACTUserActionStream *)self tryRejectCandidate],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    [(_ACTUserActionStream *)self setIsBackspacing:0];
LABEL_4:
    BOOL v5 = 0;
    goto LABEL_5;
  }
  uint64_t v7 = [(_ACTUserActionStream *)self tryBackspacing];
  if (v7)
  {
    id v4 = (void *)v7;
    BOOL v5 = 1;
    [(_ACTUserActionStream *)self setIsBackspacing:1];
    char v9 = 1;
  }
  else
  {
    [(_ACTUserActionStream *)self setIsBackspacing:0];
    uint64_t v8 = [(_ACTUserActionStream *)self tryPeriodShortcut];
    if (v8)
    {
      id v4 = (void *)v8;
      goto LABEL_4;
    }
    id v4 = [(_ACTUserActionStream *)self tryTypingWillSuppressError:&v9];
    BOOL v5 = v9 != 0;
  }
LABEL_5:
  [(_ACTUserActionStream *)self setLastActionSuppressesError:v5];
  return v4;
}

- (float)probabilityOfExtraneousKey
{
  uint64_t v3 = [(_ACTUserActionStream *)self cursor];
  id v4 = [v3 currentLongCharacter];

  int isLetterKey = _isLetterKey(v4);
  id v6 = [(_ACTUserActionStream *)self cursor];
  uint64_t v7 = [v6 positionInCurrentInternalSegment];

  uint64_t v8 = [(_ACTUserActionStream *)self cursor];
  char v9 = [v8 previousLongCharacter];

  int v10 = _isLetterKey(v9);
  uint64_t v11 = [(_ACTUserActionStream *)self cursor];
  uint64_t v12 = [v11 positionInCurrentInternalSegment];

  if (isLetterKey)
  {
    int64_t v13 = [(_ACTUserActionStream *)self userModel];
    uint64_t v14 = v13;
    if (v7) {
      [v13 probExtraneousKey];
    }
    else {
      [v13 probExtraneousInitialKey];
    }
    goto LABEL_10;
  }
  if (v12) {
    int v16 = 0;
  }
  else {
    int v16 = v10;
  }
  float v17 = 0.0;
  if (v16 == 1)
  {
    uint64_t v14 = [(_ACTUserActionStream *)self userModel];
    [v14 probExtraneousFinalKey];
LABEL_10:
    float v17 = v15;
  }
  return v17;
}

- (float)probabilityOfSubstituteKey
{
  uint64_t v3 = [(_ACTUserActionStream *)self cursor];
  id v4 = [v3 currentLongCharacter];

  BOOL v5 = [(_ACTUserActionStream *)self delegate];
  id v6 = [v5 keyplane];
  uint64_t v7 = [(_ACTUserActionStream *)self anyKeyForString:v4 keyplane:v6 wantSecondaryString:0 substituteUpperCaseForLowerCase:0];

  float v8 = 0.0;
  if (v7)
  {
    if (_isLetterKey(v4))
    {
      char v9 = [(_ACTUserActionStream *)self cursor];
      uint64_t v10 = [v9 positionInCurrentInternalSegment];

      uint64_t v11 = [(_ACTUserActionStream *)self userModel];
      uint64_t v12 = v11;
      if (v10) {
        [v11 probSubstituteLetter];
      }
      else {
        [v11 probSubstituteInitialLetter];
      }
      goto LABEL_8;
    }
    if (_isSpaceKey(v4))
    {
      uint64_t v12 = [(_ACTUserActionStream *)self userModel];
      [v12 probSubstituteSpace];
LABEL_8:
      float v8 = v13;
    }
  }

  return v8;
}

- (float)probabilityOfDoubledKey
{
  uint64_t v3 = [(_ACTUserActionStream *)self cursor];
  id v4 = [v3 currentLongCharacter];
  if (!_isLetterKey(v4))
  {

    float v6 = 0.0;
LABEL_8:

    return v6;
  }
  BOOL v5 = [(_ACTUserActionStream *)self lastAndCurrentKeysAreSame];

  float v6 = 0.0;
  if (!v5)
  {
    uint64_t v7 = [(_ACTUserActionStream *)self cursor];
    uint64_t v8 = [v7 positionInCurrentInternalSegment];

    char v9 = [(_ACTUserActionStream *)self userModel];
    uint64_t v3 = v9;
    if (v8) {
      [v9 probDoubleTapLetter];
    }
    else {
      [v9 probDoubleTapInitialLetter];
    }
    float v6 = v10;
    goto LABEL_8;
  }
  return v6;
}

- (float)probabilityOfSkippedKey
{
  uint64_t v3 = [(_ACTUserActionStream *)self cursor];
  id v4 = [v3 currentLongCharacter];

  if (_isLetterKey(v4))
  {
    if ([(_ACTUserActionStream *)self lastAndCurrentKeysAreSame])
    {
      BOOL v5 = [(_ACTUserActionStream *)self userModel];
      [v5 probSkipRepeatLetter];
    }
    else
    {
      uint64_t v8 = [(_ACTUserActionStream *)self cursor];
      uint64_t v9 = [v8 positionInCurrentInternalSegment];

      float v10 = [(_ACTUserActionStream *)self userModel];
      BOOL v5 = v10;
      if (v9) {
        [v10 probSkipLetter];
      }
      else {
        [v10 probSkipInitialLetter];
      }
    }
    goto LABEL_9;
  }
  float v7 = 0.0;
  if (_isSpaceKey(v4))
  {
    BOOL v5 = [(_ACTUserActionStream *)self userModel];
    [v5 probSkipSpace];
LABEL_9:
    float v7 = v6;
  }
  return v7;
}

- (float)probabilityOfTransposition
{
  float v3 = 0.0;
  if ([(_ACTUserActionStream *)self currentAndNextKeysAreTransposable])
  {
    id v4 = [(_ACTUserActionStream *)self cursor];
    BOOL v5 = [v4 currentLongCharacter];

    float v6 = [(_ACTUserActionStream *)self cursor];
    float v7 = [v6 nextLongCharacter];

    if (_isLetterKey(v5) && _isLetterKey(v7))
    {
      uint64_t v8 = [(_ACTUserActionStream *)self userModel];
      [v8 probTransposeLetters];
    }
    else
    {
      if ((!_isLetterKey(v5) || !_isSpaceKey(v7))
        && (!_isSpaceKey(v5) || !_isLetterKey(v7)))
      {
        goto LABEL_11;
      }
      uint64_t v8 = [(_ACTUserActionStream *)self userModel];
      [v8 probTransposeLetterAndSpace];
    }
    float v3 = v9;

LABEL_11:
  }
  return v3;
}

- (double)randomActionInterval
{
  float v3 = [(_ACTUserActionStream *)self errorGenerator];
  [v3 uniformRandomNumber];
  float v5 = v4;

  [(_ACTUserActionStream *)self averageActionInterval];
  *(float *)&double v6 = v6;
  *(float *)&double v6 = (v5 + 0.5) * *(float *)&v6;
  return *(float *)&v6;
}

- (id)anyKeyForString:(id)a3 keyplane:(id)a4 wantSecondaryString:(BOOL)a5 substituteUpperCaseForLowerCase:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(_ACTUserActionStream *)self delegate];
  float v13 = [v12 keyboardController];
  uint64_t v14 = [v13 layoutUtils];
  LOBYTE(v17) = a6;
  float v15 = objc_msgSend(v14, "anyKeyForString:keyplane:wantSecondaryString:isRetyping:preferBaseKeyVariants:preferManualShift:substituteUpperCaseForLowerCase:", v11, v10, v7, -[_ACTUserActionStream isRetyping](self, "isRetyping"), -[_ACTUserActionStream preferBaseKeyForVariants](self, "preferBaseKeyForVariants"), -[_ACTUserActionStream preferManualShift](self, "preferManualShift"), v17);

  return v15;
}

- (BOOL)shouldIgnoreCurrentCharacter
{
  float v3 = [(_ACTUserActionStream *)self cursor];
  double v4 = [v3 currentLongCharacter];

  float v5 = [(_ACTUserActionStream *)self cursor];
  if ([v5 positionInCurrentInternalSegment])
  {
    double v6 = [(_ACTUserActionStream *)self cursor];
    uint64_t v7 = [v6 positionInCurrentInternalSegment];
    unint64_t v8 = [v4 length] + v7;
    float v9 = [(_ACTUserActionStream *)self cursor];
    id v10 = [v9 currentInternalSegment];
    BOOL v11 = v8 >= [v10 length];
  }
  else
  {
    BOOL v11 = 1;
  }

  if ([v4 isEqualToString:@"'"]) {
    LOBYTE(v12) = 0;
  }
  else {
    int v12 = [v4 isEqualToString:@"’"] ^ 1;
  }
  float v13 = [(_ACTUserActionStream *)self userModel];
  int v14 = [v13 prefersAutocorrectForApostrophes];

  int v15 = v14 & ![(_ACTUserActionStream *)self isRetyping];
  if ((v11 | v12)) {
    BOOL v16 = 0;
  }
  else {
    BOOL v16 = v15;
  }

  return v16;
}

- (BOOL)preferManualCorrection
{
  v2 = [(_ACTUserActionStream *)self userModel];
  char v3 = [v2 prefersToCorrectErrors];

  return v3;
}

- (BOOL)preferInlineSelection
{
  v2 = [(_ACTUserActionStream *)self userModel];
  char v3 = [v2 prefersInlineSelection];

  return v3;
}

- (BOOL)preferPredictionSelection
{
  v2 = [(_ACTUserActionStream *)self userModel];
  char v3 = [v2 prefersPredictionSelection];

  return v3;
}

- (BOOL)preferBaseKeyForVariants
{
  v2 = [(_ACTUserActionStream *)self userModel];
  char v3 = [v2 baseKeyForVariants];

  return v3;
}

- (BOOL)preferManualShift
{
  v2 = [(_ACTUserActionStream *)self userModel];
  char v3 = [v2 prefersAutocorrectForCaps] ^ 1;

  return v3;
}

- (double)averageActionInterval
{
  v2 = [(_ACTUserActionStream *)self userModel];
  [v2 averageKeyTapsPerSecond];
  float v4 = v3;

  return (float)(1.0 / v4);
}

- (BOOL)shouldTypeInternalString
{
  v2 = [(_ACTUserActionStream *)self userModel];
  char v3 = [v2 decomposeInputString];

  return v3;
}

- (BOOL)lastAndCurrentKeysAreSame
{
  char v3 = [(_ACTUserActionStream *)self cursor];
  float v4 = [v3 previousLongCharacter];

  float v5 = [(_ACTUserActionStream *)self delegate];
  double v6 = [v5 keyboardController];
  uint64_t v7 = [v6 layoutUtils];
  unint64_t v8 = [(_ACTUserActionStream *)self delegate];
  float v9 = [v8 keyplane];
  id v10 = [v7 exactKeyForString:v4 keyplane:v9 includeSecondaryStrings:0];

  BOOL v11 = [(_ACTUserActionStream *)self cursor];
  int v12 = [v11 currentLongCharacter];

  float v13 = [(_ACTUserActionStream *)self delegate];
  int v14 = [v13 keyboardController];
  int v15 = [v14 layoutUtils];
  BOOL v16 = [(_ACTUserActionStream *)self delegate];
  uint64_t v17 = [v16 keyplane];
  uint64_t v18 = [v15 exactKeyForString:v12 keyplane:v17 includeSecondaryStrings:0];

  if (v10) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  BOOL v21 = !v19 && v10 == v18;

  return v21;
}

- (BOOL)currentAndNextKeysAreTransposable
{
  char v3 = [(_ACTUserActionStream *)self cursor];
  float v4 = [v3 currentLongCharacter];

  float v5 = [(_ACTUserActionStream *)self delegate];
  double v6 = [v5 keyboardController];
  uint64_t v7 = [v6 layoutUtils];
  unint64_t v8 = [(_ACTUserActionStream *)self delegate];
  float v9 = [v8 keyplane];
  id v10 = [v7 exactKeyForString:v4 keyplane:v9 includeSecondaryStrings:0];

  BOOL v11 = [(_ACTUserActionStream *)self cursor];
  int v12 = [v11 nextLongCharacter];

  float v13 = [(_ACTUserActionStream *)self delegate];
  int v14 = [v13 keyboardController];
  int v15 = [v14 layoutUtils];
  BOOL v16 = [(_ACTUserActionStream *)self delegate];
  uint64_t v17 = [v16 keyplane];
  uint64_t v18 = [v15 exactKeyForString:v12 keyplane:v17 includeSecondaryStrings:0];

  if (v10) {
    BOOL v19 = v18 == 0;
  }
  else {
    BOOL v19 = 1;
  }
  BOOL v21 = !v19 && v10 != v18;

  return v21;
}

- (BOOL)hasDesiredAutocorrection
{
  char v3 = [(_ACTUserActionStream *)self delegate];
  float v4 = [v3 autocorrection];

  if ([v4 isAutocorrection])
  {
    float v5 = [(_ACTUserActionStream *)self cursor];
    uint64_t v6 = [v5 rangeOfInputSegmentsForCandidate:v4];

    BOOL v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)advancePositionByAcceptingCandidate:(id)a3
{
  id v4 = a3;
  float v5 = [(_ACTUserActionStream *)self userModel];
  int v6 = [v5 prefersTransliteration];

  if (v6)
  {
    if (!self->_partialCandidateSuffix) {
      [(_ACTUserActionStream *)self advanceSegmentCursor];
    }
    goto LABEL_13;
  }
  BOOL v7 = [(_ACTUserActionStream *)self cursor];
  uint64_t v8 = [v7 rangeOfInputSegmentsForCandidate:v4];
  uint64_t v10 = v9;

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v11 = v8 + v10;
    int v12 = [(_ACTUserActionStream *)self cursor];
    if (v11 >= [v12 segmentCursor])
    {
      float v13 = [(_ACTUserActionStream *)self cursor];
      if (v11 == [v13 segmentCursor])
      {
        int v14 = [(_ACTUserActionStream *)self cursor];
        uint64_t v15 = [v14 positionInCurrentInternalSegment];

        if (v15) {
          goto LABEL_9;
        }
      }
      else
      {
      }
      while (1)
      {
        uint64_t v17 = [(_ACTUserActionStream *)self cursor];
        unint64_t v18 = [v17 segmentCursor];

        if (v18 >= v11) {
          break;
        }
        [(_ACTUserActionStream *)self advanceSegmentCursor];
      }
LABEL_13:
      BOOL v16 = 1;
      goto LABEL_14;
    }
  }
LABEL_9:
  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (void)rewindPositionByString:(id)a3
{
  id v4 = a3;
  id v5 = [(_ACTUserActionStream *)self cursor];
  [v5 rewindPositionByString:v4];
}

- (void)advancePositionByString:(id)a3
{
  id v4 = a3;
  id v5 = [(_ACTUserActionStream *)self cursor];
  [v5 advancePositionByString:v4];

  int v6 = [(_ACTUserActionStream *)self cursor];
  unint64_t v7 = [v6 segmentCursor];
  unint64_t v8 = [(_ACTUserActionStream *)self segmentCursorBeforeBackspacing];

  if (v7 >= v8)
  {
    [(_ACTUserActionStream *)self setSegmentCursorBeforeBackspacing:0x7FFFFFFFFFFFFFFFLL];
  }
}

- (BOOL)rewindSegmentCursor
{
  v2 = [(_ACTUserActionStream *)self cursor];
  char v3 = [v2 rewindSegmentCursor];

  return v3;
}

- (BOOL)advanceSegmentCursor
{
  char v3 = [(_ACTUserActionStream *)self cursor];
  char v4 = [v3 advanceSegmentCursor];

  id v5 = [(_ACTUserActionStream *)self cursor];
  unint64_t v6 = [v5 segmentCursor];
  unint64_t v7 = [(_ACTUserActionStream *)self segmentCursorBeforeBackspacing];

  if (v6 >= v7) {
    [(_ACTUserActionStream *)self setSegmentCursorBeforeBackspacing:0x7FFFFFFFFFFFFFFFLL];
  }
  return v4;
}

- (void)resetForIntendedSegments:(id)a3 expectedSegments:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_ACTUserActionStream *)self setLastTimestamp:0.0];
  [(_ACTUserActionStream *)self setLastActionSuppressesError:0];
  [(_ACTUserActionStream *)self setSegmentEditHorizon:0];
  [(_ACTUserActionStream *)self setLastCursorPositionForTransliteratedCandidate:-1];
  unint64_t v8 = [[ACTUserMentalCursor alloc] initWithInternalSegments:v7 externalSegments:v6];

  [(_ACTUserActionStream *)self setCursor:v8];
}

- (void)resetForIntendedText:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_ACTUserActionStream *)self userModel];
  char v6 = [v5 prefersContinuousPath];
  id v7 = [(_ACTUserActionStream *)self delegate];
  unint64_t v8 = v7;
  if (v6) {
    [v7 inputSegmentsForContinuousPathString:v4];
  }
  else {
  uint64_t v9 = [v7 inputSegmentsForString:v4];
  }

  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v9, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        BOOL v16 = -[_ACTUserActionStream externalStringToInternal:](self, "externalStringToInternal:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  uint64_t v17 = (void *)[v10 copy];
  [(_ACTUserActionStream *)self resetForIntendedSegments:v17 expectedSegments:v11];
}

- (id)externalStringToInternal:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ([(_ACTUserActionStream *)self shouldTypeInternalString])
  {
    char v6 = [(_ACTUserActionStream *)self delegate];
    id v5 = [v6 externalStringToInternal:v4];
  }
  if ([(_ACTUserActionStream *)self preferBaseKeyForVariants])
  {
    id v7 = [(_ACTUserActionStream *)self delegate];
    uint64_t v8 = [v7 splitDigraphsInString:v5];

    id v5 = (void *)v8;
  }

  return v5;
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_randomNumberSeed = a3;
  id v5 = [(_ACTUserActionStream *)self errorGenerator];
  [v5 setRandomNumberSeed:v3];

  char v6 = [(_ACTUserActionStream *)self pathGenerator];
  [v6 setRandomNumberSeed:v3];

  id v7 = [(_ACTUserActionStream *)self userPathManager];
  [v7 setRandomNumberSeed:v3];
}

- (NSString)intendedText
{
  v2 = [(_ACTUserActionStream *)self cursor];
  uint64_t v3 = [v2 intendedText];

  return (NSString *)v3;
}

- (BOOL)inPartialCandidateSelection
{
  return self->_partialCandidateSuffix != 0;
}

- (void)configureWithParameters:(id)a3
{
  id v11 = a3;
  id v4 = [[TIKeyboardTyperUserModel alloc] initWithModel:v11];
  [(_ACTUserActionStream *)self setUserModel:v4];

  id v5 = +[TIErrorGenerator errorGeneratorWithAttributes:v11];
  [(_ACTUserActionStream *)self setErrorGenerator:v5];

  char v6 = [(_ACTUserActionStream *)self userModel];
  int v7 = [v6 prefersContinuousPath];

  if (v7)
  {
    uint64_t v8 = +[TTKDefaultContinuousPathGenerator pathGeneratorWithAttributes:v11];
    [(_ACTUserActionStream *)self setPathGenerator:v8];
  }
  uint64_t v9 = [v11 objectForKey:@"USER_PATH_FILE"];
  if ([v9 length])
  {
    uint64_t v10 = [[UserPathManager alloc] initWithPathFile:v9];
    [(_ACTUserActionStream *)self setUserPathManager:v10];
  }
}

- (_ACTUserActionStream)initWithParameters:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  int v7 = (ACTUserActionStreamDelegate *)a4;
  v14.receiver = self;
  v14.super_class = (Class)_ACTUserActionStream;
  uint64_t v8 = [(_ACTUserActionStream *)&v14 init];
  if (v8)
  {
    uint64_t v9 = objc_alloc_init(ACTUserMentalCursor);
    cursor = v8->_cursor;
    v8->_cursor = v9;

    v8->_lastCursorPositionForTransliteratedCandidate = -1;
    partialCandidateSuffix = v8->_partialCandidateSuffix;
    v8->_partialCandidateSuffix = 0;

    partialCandidateIntendedChunk = v8->_partialCandidateIntendedChunk;
    v8->_partialCandidateIntendedChunk = 0;

    v8->_delegate = v7;
  }
  [(_ACTUserActionStream *)v8 configureWithParameters:v6];

  return v8;
}

+ (BOOL)isPathableWord:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F089C0];
  id v4 = a3;
  id v5 = [v3 letterCharacterSet];
  [v5 addCharactersInString:@"'’׳״-"];
  [v5 removeCharactersInString:@"œŒß"];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];
  unint64_t v7 = [v4 length];

  BOOL v8 = v7 >= 2 && [v6 length] == 0;
  return v8;
}

+ (_NSRange)segmentAnchorRangeForCursor:(id)a3 withDocumentBefore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 segmentCursor];
  if (v7 < 0) {
    goto LABEL_27;
  }
  uint64_t v8 = v7;
  while (2)
  {
    NSUInteger v9 = 0;
    uint64_t v26 = v8;
    while (1)
    {
      uint64_t v10 = [v5 externalSegments];
      id v11 = objc_msgSend(v10, "subarrayWithRange:", v8, v9);
      uint64_t v12 = [v11 componentsJoinedByString:&stru_26F2B7E50];

      uint64_t v13 = [v6 rangeOfString:v12 options:4];
      uint64_t v15 = v14;
      unint64_t v16 = [v12 length];
      BOOL v17 = !v8 || v16 >= 6;
      BOOL v18 = !v17;
      if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (!v8) {
        goto LABEL_16;
      }
      BOOL v19 = 0;
LABEL_19:
      BOOL v17 = v8-- != 0;
      char v22 = v17;
      int v23 = v18 || v19;

      if (v23 == 1)
      {
        ++v9;
        if (v22) {
          continue;
        }
      }
      goto LABEL_26;
    }
    unint64_t v20 = [v6 length] - (v13 + v15);
    BOOL v21 = v20 >= 0x15;
    BOOL v19 = v20 < 0x15;
    if (v8 || !v21)
    {
LABEL_18:
      if (!v18 && v19)
      {

        goto LABEL_29;
      }
      goto LABEL_19;
    }
LABEL_16:
    if (![v12 length])
    {
      BOOL v19 = (unint64_t)[v6 length] < 0x15;
      goto LABEL_18;
    }

LABEL_26:
    uint64_t v8 = v26 - 1;
    if (v26 > 0) {
      continue;
    }
    break;
  }
LABEL_27:
  NSUInteger v9 = 0;
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_29:

  NSUInteger v24 = v8;
  NSUInteger v25 = v9;
  result.length = v25;
  result.location = v24;
  return result;
}

+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [[_ACTUserActionStream alloc] initWithParameters:v6 delegate:v5];

  return v7;
}

@end