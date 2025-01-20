@interface _TransitDirectionsInstructionsCellConstraints
- (NSArray)initialConstraints;
- (NSLayoutConstraint)contentLayoutGuideToPrimaryLeadingConstraint;
- (NSLayoutConstraint)minimumCellHeightConstraint;
- (NSLayoutConstraint)platformArtworkBottomToBottomConstraint;
- (NSLayoutConstraint)platformArtworkTrailingToTextStackLabelLeadingConstraint;
- (NSLayoutConstraint)primaryAccessoryMaximumWidthFactorConstraint;
- (NSLayoutConstraint)primaryAccessoryToSecondaryAccessoryConstraint;
- (NSLayoutConstraint)primaryAccessoryToTrailingConstraint;
- (NSLayoutConstraint)primaryBaselineToBottomConstraint;
- (NSLayoutConstraint)primaryLabelTrailingToTrailingContentConstraint;
- (NSLayoutConstraint)secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint;
- (NSLayoutConstraint)secondaryLabelTrailingToTrailingContentConstraint;
- (NSLayoutConstraint)textStackLeadingToPrimaryLabelLeadingConstraint;
- (NSLayoutConstraint)topToPrimaryConstraint;
- (void)deactivateConstraints;
- (void)dealloc;
- (void)setContentLayoutGuideToPrimaryLeadingConstraint:(id)a3;
- (void)setInitialConstraints:(id)a3;
- (void)setMinimumCellHeightConstraint:(id)a3;
- (void)setPlatformArtworkBottomToBottomConstraint:(id)a3;
- (void)setPlatformArtworkTrailingToTextStackLabelLeadingConstraint:(id)a3;
- (void)setPrimaryAccessoryMaximumWidthFactorConstraint:(id)a3;
- (void)setPrimaryAccessoryToSecondaryAccessoryConstraint:(id)a3;
- (void)setPrimaryAccessoryToTrailingConstraint:(id)a3;
- (void)setPrimaryBaselineToBottomConstraint:(id)a3;
- (void)setPrimaryLabelTrailingToTrailingContentConstraint:(id)a3;
- (void)setSecondaryLabelFirstBaselineToPlatformArtworkBottomConstraint:(id)a3;
- (void)setSecondaryLabelTrailingToTrailingContentConstraint:(id)a3;
- (void)setTextStackLeadingToPrimaryLabelLeadingConstraint:(id)a3;
- (void)setTopToPrimaryConstraint:(id)a3;
@end

@implementation _TransitDirectionsInstructionsCellConstraints

- (void)deactivateConstraints
{
  id v30 = objc_alloc_init((Class)NSMutableArray);
  v3 = [(_TransitDirectionsInstructionsCellConstraints *)self minimumCellHeightConstraint];

  if (v3)
  {
    v4 = [(_TransitDirectionsInstructionsCellConstraints *)self minimumCellHeightConstraint];
    [v30 addObject:v4];
  }
  v5 = [(_TransitDirectionsInstructionsCellConstraints *)self topToPrimaryConstraint];

  if (v5)
  {
    v6 = [(_TransitDirectionsInstructionsCellConstraints *)self topToPrimaryConstraint];
    [v30 addObject:v6];
  }
  v7 = [(_TransitDirectionsInstructionsCellConstraints *)self contentLayoutGuideToPrimaryLeadingConstraint];

  if (v7)
  {
    v8 = [(_TransitDirectionsInstructionsCellConstraints *)self contentLayoutGuideToPrimaryLeadingConstraint];
    [v30 addObject:v8];
  }
  v9 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryBaselineToBottomConstraint];

  if (v9)
  {
    v10 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryBaselineToBottomConstraint];
    [v30 addObject:v10];
  }
  v11 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryAccessoryToSecondaryAccessoryConstraint];

  if (v11)
  {
    v12 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryAccessoryToSecondaryAccessoryConstraint];
    [v30 addObject:v12];
  }
  v13 = [(_TransitDirectionsInstructionsCellConstraints *)self platformArtworkBottomToBottomConstraint];

  if (v13)
  {
    v14 = [(_TransitDirectionsInstructionsCellConstraints *)self platformArtworkBottomToBottomConstraint];
    [v30 addObject:v14];
  }
  v15 = [(_TransitDirectionsInstructionsCellConstraints *)self platformArtworkTrailingToTextStackLabelLeadingConstraint];

  if (v15)
  {
    v16 = [(_TransitDirectionsInstructionsCellConstraints *)self platformArtworkTrailingToTextStackLabelLeadingConstraint];
    [v30 addObject:v16];
  }
  v17 = [(_TransitDirectionsInstructionsCellConstraints *)self textStackLeadingToPrimaryLabelLeadingConstraint];

  if (v17)
  {
    v18 = [(_TransitDirectionsInstructionsCellConstraints *)self textStackLeadingToPrimaryLabelLeadingConstraint];
    [v30 addObject:v18];
  }
  v19 = [(_TransitDirectionsInstructionsCellConstraints *)self secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint];

  if (v19)
  {
    v20 = [(_TransitDirectionsInstructionsCellConstraints *)self secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint];
    [v30 addObject:v20];
  }
  v21 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryLabelTrailingToTrailingContentConstraint];

  if (v21)
  {
    v22 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryLabelTrailingToTrailingContentConstraint];
    [v30 addObject:v22];
  }
  v23 = [(_TransitDirectionsInstructionsCellConstraints *)self secondaryLabelTrailingToTrailingContentConstraint];

  if (v23)
  {
    v24 = [(_TransitDirectionsInstructionsCellConstraints *)self secondaryLabelTrailingToTrailingContentConstraint];
    [v30 addObject:v24];
  }
  v25 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryAccessoryToTrailingConstraint];

  if (v25)
  {
    v26 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryAccessoryToTrailingConstraint];
    [v30 addObject:v26];
  }
  v27 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryAccessoryMaximumWidthFactorConstraint];

  if (v27)
  {
    v28 = [(_TransitDirectionsInstructionsCellConstraints *)self primaryAccessoryMaximumWidthFactorConstraint];
    [v30 addObject:v28];
  }
  v29 = [(_TransitDirectionsInstructionsCellConstraints *)self initialConstraints];
  [v30 addObjectsFromArray:v29];

  +[NSLayoutConstraint deactivateConstraints:v30];
}

- (void)dealloc
{
  [(_TransitDirectionsInstructionsCellConstraints *)self deactivateConstraints];
  v3.receiver = self;
  v3.super_class = (Class)_TransitDirectionsInstructionsCellConstraints;
  [(_TransitDirectionsInstructionsCellConstraints *)&v3 dealloc];
}

- (NSLayoutConstraint)minimumCellHeightConstraint
{
  return self->_minimumCellHeightConstraint;
}

- (void)setMinimumCellHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)topToPrimaryConstraint
{
  return self->_topToPrimaryConstraint;
}

- (void)setTopToPrimaryConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentLayoutGuideToPrimaryLeadingConstraint
{
  return self->_contentLayoutGuideToPrimaryLeadingConstraint;
}

- (void)setContentLayoutGuideToPrimaryLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryBaselineToBottomConstraint
{
  return self->_primaryBaselineToBottomConstraint;
}

- (void)setPrimaryBaselineToBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryAccessoryToSecondaryAccessoryConstraint
{
  return self->_primaryAccessoryToSecondaryAccessoryConstraint;
}

- (void)setPrimaryAccessoryToSecondaryAccessoryConstraint:(id)a3
{
}

- (NSLayoutConstraint)platformArtworkBottomToBottomConstraint
{
  return self->_platformArtworkBottomToBottomConstraint;
}

- (void)setPlatformArtworkBottomToBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)platformArtworkTrailingToTextStackLabelLeadingConstraint
{
  return self->_platformArtworkTrailingToTextStackLabelLeadingConstraint;
}

- (void)setPlatformArtworkTrailingToTextStackLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)textStackLeadingToPrimaryLabelLeadingConstraint
{
  return self->_textStackLeadingToPrimaryLabelLeadingConstraint;
}

- (void)setTextStackLeadingToPrimaryLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint
{
  return self->_secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint;
}

- (void)setSecondaryLabelFirstBaselineToPlatformArtworkBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryLabelTrailingToTrailingContentConstraint
{
  return self->_primaryLabelTrailingToTrailingContentConstraint;
}

- (void)setPrimaryLabelTrailingToTrailingContentConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryLabelTrailingToTrailingContentConstraint
{
  return self->_secondaryLabelTrailingToTrailingContentConstraint;
}

- (void)setSecondaryLabelTrailingToTrailingContentConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryAccessoryToTrailingConstraint
{
  return self->_primaryAccessoryToTrailingConstraint;
}

- (void)setPrimaryAccessoryToTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryAccessoryMaximumWidthFactorConstraint
{
  return self->_primaryAccessoryMaximumWidthFactorConstraint;
}

- (void)setPrimaryAccessoryMaximumWidthFactorConstraint:(id)a3
{
}

- (NSArray)initialConstraints
{
  return self->_initialConstraints;
}

- (void)setInitialConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialConstraints, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryMaximumWidthFactorConstraint, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryToTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelTrailingToTrailingContentConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLabelTrailingToTrailingContentConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textStackLeadingToPrimaryLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_platformArtworkTrailingToTextStackLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_platformArtworkBottomToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryToSecondaryAccessoryConstraint, 0);
  objc_storeStrong((id *)&self->_primaryBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuideToPrimaryLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topToPrimaryConstraint, 0);

  objc_storeStrong((id *)&self->_minimumCellHeightConstraint, 0);
}

@end