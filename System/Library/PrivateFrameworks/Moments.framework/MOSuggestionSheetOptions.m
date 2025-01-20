@interface MOSuggestionSheetOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)presentFullScreen;
- (BOOL)presentationIsAnimated;
- (BOOL)selectedTabIsRecommended;
- (BOOL)showBlankEntryButton;
- (BOOL)showCancelButton;
- (MOSuggestionSheetOptions)initWithCoder:(id)a3;
- (MOSuggestionSheetOptions)initWithShowCancelButton:(BOOL)a3 showBlankEntryButton:(BOOL)a4 peekDetentRatio:(double)a5 presentFullScreen:(BOOL)a6 presentationIsAnimated:(BOOL)a7 selectedTabIsRecommended:(BOOL)a8 selectedSuggestionId:(id)a9;
- (MOSuggestionSheetOptions)initWithShowCancelButton:(BOOL)a3 showBlankEntryButton:(BOOL)a4 peekDetentRatio:(double)a5 presentFullScreen:(BOOL)a6 presentationIsAnimated:(BOOL)a7 selectedTabIsRecommended:(BOOL)a8 selectedSuggestionId:(id)a9 contentOptions:(int64_t)a10;
- (NSUUID)selectedSuggestionId;
- (double)peekDetentRatio;
- (id)description;
- (int64_t)contentOptions;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOSuggestionSheetOptions

- (MOSuggestionSheetOptions)initWithShowCancelButton:(BOOL)a3 showBlankEntryButton:(BOOL)a4 peekDetentRatio:(double)a5 presentFullScreen:(BOOL)a6 presentationIsAnimated:(BOOL)a7 selectedTabIsRecommended:(BOOL)a8 selectedSuggestionId:(id)a9 contentOptions:(int64_t)a10
{
  id v18 = a9;
  v22.receiver = self;
  v22.super_class = (Class)MOSuggestionSheetOptions;
  v19 = [(MOSuggestionSheetOptions *)&v22 init];
  v20 = v19;
  if (v19)
  {
    v19->_showCancelButton = a3;
    v19->_showBlankEntryButton = a4;
    v19->_peekDetentRatio = a5;
    v19->_presentFullScreen = a6;
    v19->_presentationIsAnimated = a7;
    v19->_selectedTabIsRecommended = a8;
    objc_storeStrong((id *)&v19->_selectedSuggestionId, a9);
    v20->_contentOptions = a10;
  }

  return v20;
}

- (MOSuggestionSheetOptions)initWithShowCancelButton:(BOOL)a3 showBlankEntryButton:(BOOL)a4 peekDetentRatio:(double)a5 presentFullScreen:(BOOL)a6 presentationIsAnimated:(BOOL)a7 selectedTabIsRecommended:(BOOL)a8 selectedSuggestionId:(id)a9
{
  return [(MOSuggestionSheetOptions *)self initWithShowCancelButton:a3 showBlankEntryButton:a4 peekDetentRatio:a6 presentFullScreen:a7 presentationIsAnimated:a8 selectedTabIsRecommended:a9 selectedSuggestionId:a5 contentOptions:0];
}

- (MOSuggestionSheetOptions)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MOSuggestionSheetOptions;
  id v3 = a3;
  v4 = [(MOSuggestionSheetOptions *)&v10 init];
  v4->_showCancelButton = objc_msgSend(v3, "decodeBoolForKey:", @"showCancelButton", v10.receiver, v10.super_class);
  v4->_showBlankEntryButton = [v3 decodeBoolForKey:@"showBlankEntryButton"];
  [v3 decodeDoubleForKey:@"peekDetentRatio"];
  v4->_peekDetentRatio = v5;
  v4->_presentFullScreen = [v3 decodeBoolForKey:@"presentFullScreen"];
  v4->_presentationIsAnimated = [v3 decodeBoolForKey:@"presentationIsAnimated"];
  v4->_selectedTabIsRecommended = [v3 decodeBoolForKey:@"selectedTabIsRecommended"];
  uint64_t v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"selectedSuggestionId"];
  selectedSuggestionId = v4->_selectedSuggestionId;
  v4->_selectedSuggestionId = (NSUUID *)v6;

  uint64_t v8 = [v3 decodeIntegerForKey:@"contentOptions"];
  v4->_contentOptions = v8;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL showCancelButton = self->_showCancelButton;
  id v5 = a3;
  [v5 encodeBool:showCancelButton forKey:@"showCancelButton"];
  [v5 encodeBool:self->_showBlankEntryButton forKey:@"showBlankEntryButton"];
  [v5 encodeDouble:@"peekDetentRatio" forKey:self->_peekDetentRatio];
  [v5 encodeBool:self->_presentFullScreen forKey:@"presentFullScreen"];
  [v5 encodeBool:self->_presentationIsAnimated forKey:@"presentationIsAnimated"];
  [v5 encodeBool:self->_selectedTabIsRecommended forKey:@"selectedTabIsRecommended"];
  [v5 encodeObject:self->_selectedSuggestionId forKey:@"selectedSuggestionId"];
  [v5 encodeInteger:self->_contentOptions forKey:@"contentOptions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"suggestionSheetOptions, _showCancelButton=%d, _showBlankEntryButton=%d, _peekDetentRatio=%f, _presentFullScreen=%d, _presentationIsAnimated=%d, _selectedTabIsRecommended=%d, _selectedSuggestionId=%@, contentOptions=%ld", self->_showCancelButton, self->_showBlankEntryButton, *(void *)&self->_peekDetentRatio, self->_presentFullScreen, self->_presentationIsAnimated, self->_selectedTabIsRecommended, self->_selectedSuggestionId, self->_contentOptions];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (!v5) {
      goto LABEL_12;
    }
    int v6 = [(MOSuggestionSheetOptions *)self showBlankEntryButton];
    if (v6 != [v5 showBlankEntryButton]) {
      goto LABEL_12;
    }
    int v7 = [(MOSuggestionSheetOptions *)self showCancelButton];
    if (v7 == [v5 showCancelButton]
      && (int v8 = [(MOSuggestionSheetOptions *)self presentFullScreen],
          v8 == [v5 presentFullScreen])
      && (int v9 = [(MOSuggestionSheetOptions *)self presentationIsAnimated],
          v9 == [v5 presentationIsAnimated])
      && (int v10 = [(MOSuggestionSheetOptions *)self selectedTabIsRecommended],
          v10 == [v5 selectedTabIsRecommended])
      && ([(MOSuggestionSheetOptions *)self peekDetentRatio],
          double v12 = v11,
          [v5 peekDetentRatio],
          v12 == v13))
    {
      v14 = [(MOSuggestionSheetOptions *)self selectedSuggestionId];
      v15 = [v5 selectedSuggestionId];
      if (v14 == v15)
      {
        int64_t v18 = [(MOSuggestionSheetOptions *)self contentOptions];
        BOOL v16 = v18 == [v5 contentOptions];
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
LABEL_12:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (BOOL)showBlankEntryButton
{
  return self->_showBlankEntryButton;
}

- (double)peekDetentRatio
{
  return self->_peekDetentRatio;
}

- (BOOL)presentFullScreen
{
  return self->_presentFullScreen;
}

- (BOOL)presentationIsAnimated
{
  return self->_presentationIsAnimated;
}

- (BOOL)selectedTabIsRecommended
{
  return self->_selectedTabIsRecommended;
}

- (NSUUID)selectedSuggestionId
{
  return self->_selectedSuggestionId;
}

- (int64_t)contentOptions
{
  return self->_contentOptions;
}

- (void).cxx_destruct
{
}

@end