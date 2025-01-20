@interface NSObject(AXPrivCategory)
+ (BOOL)_accessibilityHasUnitTestingOrientation;
+ (id)_accessibilityTextChecker;
+ (uint64_t)_accessibilityClearProcessedClasses:()AXPrivCategory;
+ (uint64_t)_accessibilityUnitTestingOrientation;
+ (void)_accessibilitySetUnitTestingOrientation:()AXPrivCategory;
+ (void)_accessibilityUndoAttributedDecisionCaching:()AXPrivCategory;
+ (void)_accessibilityUnsetUnitTestingOrientation;
- (BOOL)_accessibilityActivateKeyboardReturnKey;
- (BOOL)_accessibilityAdjustScrollOffset:()AXPrivCategory;
- (BOOL)_accessibilityAnimationsInProgress;
- (BOOL)_accessibilityApplicationIsRTL;
- (BOOL)_accessibilityCanPerformEscapeAction;
- (BOOL)_accessibilityDidSetOpaqueElementProvider;
- (BOOL)_accessibilityFrameSupportsMediaAnalysis;
- (BOOL)_accessibilityHandlesTabKey;
- (BOOL)_accessibilityHandwritingAttributeAcceptsContractedBraille;
- (BOOL)_accessibilityHandwritingAttributeShouldEchoCharacter;
- (BOOL)_accessibilityHandwritingAttributeShouldPlayKeyboardSecureClickSound;
- (BOOL)_accessibilityHasDescendantOfType:()AXPrivCategory;
- (BOOL)_accessibilityHasOrderedChildren;
- (BOOL)_accessibilityHierarchyIsRTL;
- (BOOL)_accessibilityIsDescendantOfElement:()AXPrivCategory;
- (BOOL)_accessibilityIsDraggableElementAttribute;
- (BOOL)_accessibilityIsInCollectionCell;
- (BOOL)_accessibilityIsInTableCell;
- (BOOL)_accessibilityIsMap;
- (BOOL)_accessibilityIsPressed;
- (BOOL)_accessibilityIsTouchContainer;
- (BOOL)_accessibilityIsUserInteractionEnabled;
- (BOOL)_accessibilityIsViewDescendantOfElement:()AXPrivCategory;
- (BOOL)_accessibilityIsVisibleByCompleteHitTest:()AXPrivCategory;
- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:()AXPrivCategory;
- (BOOL)_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:()AXPrivCategory nonAttributedSelector:attributedSelector:;
- (BOOL)_accessibilityRespondsToUserInteractionForElement:()AXPrivCategory;
- (BOOL)_accessibilityShouldPerformIncrementOrDecrement;
- (BOOL)_accessibilitySiblingWithAncestor:()AXPrivCategory isFirst:isLast:sawAXElement:;
- (BOOL)_accessibilitySupportsActivateAction;
- (BOOL)_accessibilitySupportsAudiographs;
- (BOOL)_accessibilitySupportsRangeForLineNumber;
- (BOOL)_accessibilitySupportsTextInsertionAndDeletion;
- (BOOL)accessibilityShouldEnumerateContainerElementsArrayDirectly;
- (UIAccessibilityAddToDragSessionCustomAction)_accessibilityAddToDragSessionCustomAction;
- (__CFString)_accessibilityRotorTypeStringForCustomRotor:()AXPrivCategory;
- (__CFString)_iosAccessibilityAttributeValue:()AXPrivCategory;
- (__CFString)accessibilityLabelForRange:()AXPrivCategory;
- (__n128)_accessibilityJailTransform;
- (char)_accessibilityScrollSelectorForDirection:()AXPrivCategory;
- (double)__accessibilityVisibleScrollArea:()AXPrivCategory;
- (double)_accessibilityAllowedGeometryOverlap;
- (double)_accessibilityAllowedGeometryOverlapX;
- (double)_accessibilityBoundsForRange:()AXPrivCategory;
- (double)_accessibilityChildrenUnionContentFrame;
- (double)_accessibilityCompareFrameForScrollParent:()AXPrivCategory frame:fromOrientation:toOrientation:;
- (double)_accessibilityContentOffset;
- (double)_accessibilityContentSize;
- (double)_accessibilityConvertSystemBoundedScreenRectToContextSpace:()AXPrivCategory;
- (double)_accessibilityDataSeriesSonificationDuration;
- (double)_accessibilityDelayBeforeUpdatingOnActivation;
- (double)_accessibilityDisplayRectForSceneReferenceRect:()AXPrivCategory;
- (double)_accessibilityDistance:()AXPrivCategory forAngle:toRoad:;
- (double)_accessibilityFocusableFrameForZoom;
- (double)_accessibilityFontSize;
- (double)_accessibilityFrameForRange:()AXPrivCategory;
- (double)_accessibilityFrameForSorting;
- (double)_accessibilityGesturePracticeRegion;
- (double)_accessibilityKeyboardFrame;
- (double)_accessibilityLeftOpaqueScrollViewContentOffsetLimit;
- (double)_accessibilityMagnifierZoomLevel;
- (double)_accessibilityMaxScrubberPosition;
- (double)_accessibilityMinScrubberPosition;
- (double)_accessibilityNavigationControllerInset;
- (double)_accessibilityOffsetForOpaqueElementDirection:()AXPrivCategory;
- (double)_accessibilityRightOpaqueScrollViewContentOffsetLimit;
- (double)_accessibilityScrollRectToVisible:()AXPrivCategory;
- (double)_accessibilityTextCursorFrame;
- (double)_accessibilityViewAlpha;
- (double)_accessibilityVisibleContentInset;
- (double)_accessibilityVisibleFrame:()AXPrivCategory;
- (double)_accessibilityVisibleItemDenominator;
- (double)_accessibilityVisiblePointHitTestingAnyElement:()AXPrivCategory;
- (double)_accessibilityVisibleScrollArea:()AXPrivCategory;
- (double)_accessibilityZoomScale;
- (double)_axFrameForBoundsCheck:()AXPrivCategory;
- (double)_axScreenBoundsForBoundsCheck;
- (double)_handleRotatingFrame:()AXPrivCategory fromOrientation:toOrientation:;
- (double)accessibilityBoundsForTextMarkers:()AXPrivCategory;
- (double)accessibilityFrameForLineNumber:()AXPrivCategory;
- (double)accessibilityVisibleContentRect;
- (float)_accessibilityActivationDelay;
- (float)_accessibilityDistanceFromEndOfRoad:()AXPrivCategory forAngle:;
- (id)__accessibilityRetrieveFrameOrPathDelegate;
- (id)__accessibilityRoleDescription;
- (id)_accessibilityAXAttributedHint;
- (id)_accessibilityAXAttributedLabel;
- (id)_accessibilityAXAttributedUserInputLabels;
- (id)_accessibilityAXAttributedUserInputLabelsIncludingFallbacks;
- (id)_accessibilityAXAttributedValue;
- (id)_accessibilityAccessibleAncestor;
- (id)_accessibilityAccessibleDescendants;
- (id)_accessibilityActiveKeyboard;
- (id)_accessibilityAllContextDescriptors;
- (id)_accessibilityAllDragSourceDescriptors;
- (id)_accessibilityAllDropPointDescriptors;
- (id)_accessibilityAncestorForSiblingsWithType:()AXPrivCategory;
- (id)_accessibilityAncestorIsKindOf:()AXPrivCategory;
- (id)_accessibilityApplication;
- (id)_accessibilityApplicationWindowContextIDs;
- (id)_accessibilityAttributedValueForRange:()AXPrivCategory;
- (id)_accessibilityAuditIssuesWithOptions:()AXPrivCategory;
- (id)_accessibilityBaseHitTest:()AXPrivCategory withEvent:;
- (id)_accessibilityBrailleMap;
- (id)_accessibilityBrailleMapsFromGraphData;
- (id)_accessibilityChartDescriptor;
- (id)_accessibilityChartStructureDescription;
- (id)_accessibilityChildrenForContinuityDisplay;
- (id)_accessibilityCollectionViewCellContentSubviews;
- (id)_accessibilityContainerInDirection:()AXPrivCategory;
- (id)_accessibilityContainerToStopVisibilityCheck;
- (id)_accessibilityContainerTypes;
- (id)_accessibilityContainingParentForOrdering;
- (id)_accessibilityContextDescriptors;
- (id)_accessibilityControlDescendantWithAction:()AXPrivCategory;
- (id)_accessibilityControlDescendantWithTarget:()AXPrivCategory;
- (id)_accessibilityConvertMathExpression:()AXPrivCategory;
- (id)_accessibilityConvertSystemBoundedPathToContextSpace:()AXPrivCategory;
- (id)_accessibilityCurrentStatus;
- (id)_accessibilityCustomActionNamesAndIdentifiers;
- (id)_accessibilityCustomActions;
- (id)_accessibilityCustomContent;
- (id)_accessibilityCustomRotorResultHelper:()AXPrivCategory array:;
- (id)_accessibilityDefaultFocusGroupIdentifier;
- (id)_accessibilityDescendantOfType:()AXPrivCategory;
- (id)_accessibilityDisplayPathForScreenPath:()AXPrivCategory;
- (id)_accessibilityDragSourceDescriptorDictionaryRepresentations;
- (id)_accessibilityDropPointDescriptorDictionaryRepresentations;
- (id)_accessibilityElementToFocusForAppearanceScreenChange;
- (id)_accessibilityElements;
- (id)_accessibilityEquivalenceTag;
- (id)_accessibilityFBSceneIdentifier;
- (id)_accessibilityFindAncestor:()AXPrivCategory startWithSelf:findTopmostAncestor:;
- (id)_accessibilityFindDescendant:()AXPrivCategory;
- (id)_accessibilityFindElementInDirection:()AXPrivCategory searchType:allowOutOfBoundsChild:;
- (id)_accessibilityFindElementInDirection:()AXPrivCategory searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:;
- (id)_accessibilityFindSubviewDescendant:()AXPrivCategory;
- (id)_accessibilityFindSubviewDescendantsPassingTest:()AXPrivCategory;
- (id)_accessibilityFindUnsortedDescendantsPassingTest:()AXPrivCategory;
- (id)_accessibilityFindUnsortedSubviewDescendantsPassingTest:()AXPrivCategory;
- (id)_accessibilityFindViewAncestor:()AXPrivCategory startWithSelf:;
- (id)_accessibilityFindViewControllerDescendant:()AXPrivCategory;
- (id)_accessibilityFindViewControllerDescendantOfType:()AXPrivCategory;
- (id)_accessibilityFirstContainedElementForTechnology:()AXPrivCategory honoringGroups:shouldAlwaysScroll:;
- (id)_accessibilityFirstDescendant;
- (id)_accessibilityFirstElementForFocus;
- (id)_accessibilityFirstElementForFocusHonoringGroups:()AXPrivCategory;
- (id)_accessibilityFirstElementForFocusWithOptions:()AXPrivCategory;
- (id)_accessibilityFirstElementsForSpeakThis;
- (id)_accessibilityFirstOpaqueElement;
- (id)_accessibilityFirstOpaqueElementForFocus;
- (id)_accessibilityFirstOpaqueElementForFocusWithOptions:()AXPrivCategory;
- (id)_accessibilityFirstOpaqueElementWithOptions:()AXPrivCategory;
- (id)_accessibilityFirstResponderForKeyWindow;
- (id)_accessibilityFirstWebElement;
- (id)_accessibilityFocusAbsoluteFirstLastOpaqueElement:()AXPrivCategory technology:honorsGroups:shouldAlwaysScroll:;
- (id)_accessibilityGroupedParent;
- (id)_accessibilityGuideElementHeaderText;
- (id)_accessibilityGuideElementInDirection:()AXPrivCategory;
- (id)_accessibilityHandwritingAttributeLanguage;
- (id)_accessibilityHandwritingAttributes;
- (id)_accessibilityHandwritingElement;
- (id)_accessibilityHeaderElementsForColumn:()AXPrivCategory;
- (id)_accessibilityHeaderElementsForRow:()AXPrivCategory;
- (id)_accessibilityHeadingLevel;
- (id)_accessibilityHitTest:()AXPrivCategory withEvent:;
- (id)_accessibilityHitTestAdditionalElements:()AXPrivCategory event:;
- (id)_accessibilityHitTestSupplementaryViews:()AXPrivCategory event:;
- (id)_accessibilityHitTestSupplementaryViews:()AXPrivCategory point:withEvent:;
- (id)_accessibilityImageData;
- (id)_accessibilityInputIdentifierForKeyboard;
- (id)_accessibilityInternalTextLinkCustomRotors;
- (id)_accessibilityInternalTextLinks;
- (id)_accessibilityKeyCommands;
- (id)_accessibilityLastElementsUpdatedWithContainerElementReferences;
- (id)_accessibilityLastOpaqueElement;
- (id)_accessibilityLastOpaqueElementWithOptions:()AXPrivCategory;
- (id)_accessibilityLineEndMarker:()AXPrivCategory;
- (id)_accessibilityLineStartMarker:()AXPrivCategory;
- (id)_accessibilityLinkedUIElements;
- (id)_accessibilityMarkerForPoint:()AXPrivCategory;
- (id)_accessibilityMarkerLineEndsForMarkers:()AXPrivCategory;
- (id)_accessibilityMarkersForPoints:()AXPrivCategory;
- (id)_accessibilityMarkersForRange:()AXPrivCategory;
- (id)_accessibilityMediaAnalysisElement;
- (id)_accessibilityMoveFocusToNextOpaqueElementForTechnology:()AXPrivCategory direction:searchType:range:shouldScrollToVisible:honorsGroups:;
- (id)_accessibilityNextElementsForSpeakThis;
- (id)_accessibilityNextMarker:()AXPrivCategory;
- (id)_accessibilityNextOpaqueElementsForTechnology:()AXPrivCategory startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:;
- (id)_accessibilityObscuredScreenAllowedViews;
- (id)_accessibilityOpaqueElementParent;
- (id)_accessibilityOrderedChildrenContainerWithinElements:()AXPrivCategory;
- (id)_accessibilityParentView;
- (id)_accessibilityPerformPublicCustomRotorSearch:()AXPrivCategory searchDirection:currentItem:;
- (id)_accessibilityPhotoDescription;
- (id)_accessibilityPostProcessValueForAutomation:()AXPrivCategory;
- (id)_accessibilityPotentiallyAttributedValueForNonAttributedSelector:()AXPrivCategory attributedSelector:;
- (id)_accessibilityPreferredScrollActions;
- (id)_accessibilityPreviousMarker:()AXPrivCategory;
- (id)_accessibilityPrivateCustomActionsElement;
- (id)_accessibilityProcessChildrenForParameter:()AXPrivCategory;
- (id)_accessibilityProcessElementsInDirection:()AXPrivCategory forParameter:;
- (id)_accessibilityProcessMathExpression:()AXPrivCategory;
- (id)_accessibilityProcessedLabelAttribute;
- (id)_accessibilityPublicCustomRotorIdForSystemType:()AXPrivCategory;
- (id)_accessibilityPublicCustomRotorName:()AXPrivCategory;
- (id)_accessibilityPublicCustomRotors;
- (id)_accessibilityRawIsSpeakThisElement;
- (id)_accessibilityRemoteApplication;
- (id)_accessibilityRemoteParent;
- (id)_accessibilityResponderChainForKeyWindow;
- (id)_accessibilityResponderChainForWindow:()AXPrivCategory;
- (id)_accessibilityRetieveHeaderElementText;
- (id)_accessibilityRetrieveImagePathLabel:()AXPrivCategory;
- (id)_accessibilityRetrieveLinkedUIElementsFromContainerChain;
- (id)_accessibilityRetrieveLocalizationBundleID;
- (id)_accessibilityRetrieveLocalizationBundlePath;
- (id)_accessibilityRetrieveLocalizedStringKey;
- (id)_accessibilityRetrieveLocalizedStringTableName;
- (id)_accessibilityRoleDescription;
- (id)_accessibilityScannerElementsGrouped:()AXPrivCategory shouldIncludeNonScannerElements:;
- (id)_accessibilityScrollAncestorForSelector:()AXPrivCategory alwaysAllowRefreshAction:;
- (id)_accessibilityScrollParent;
- (id)_accessibilityScrollStatus;
- (id)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:;
- (id)_accessibilitySemanticContext;
- (id)_accessibilitySortPriorityContainer;
- (id)_accessibilitySortedElementsWithin;
- (id)_accessibilitySortedElementsWithinWithOptions:()AXPrivCategory;
- (id)_accessibilitySpeakThisLeafDescendants;
- (id)_accessibilitySpeakThisString;
- (id)_accessibilitySpeakThisStringValue;
- (id)_accessibilityStoredChartDescriptor;
- (id)_accessibilityString:()AXPrivCategory withSpeechHint:;
- (id)_accessibilityStringForLabelKeyValues:()AXPrivCategory;
- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers;
- (id)_accessibilitySupportedLanguages;
- (id)_accessibilitySwipeIsland;
- (id)_accessibilityTableViewCellContentSubviews;
- (id)_accessibilityTextHandlingAncestorMatchingBlock:()AXPrivCategory;
- (id)_accessibilityTextMarkerForPosition:()AXPrivCategory;
- (id)_accessibilityTextMarkerRange;
- (id)_accessibilityTextMarkerRangeForSelection;
- (id)_accessibilityTextOperations;
- (id)_accessibilityTextualContext;
- (id)_accessibilityTouchContainerStartingWithSelf:()AXPrivCategory;
- (id)_accessibilityTraitsAsHumanReadableStrings:()AXPrivCategory;
- (id)_accessibilityUserDefinedAdditionalElements;
- (id)_accessibilityUserDefinedGuideElementHeaderText;
- (id)_accessibilityUserDefinedLinkedUIElements;
- (id)_accessibilityUserDefinedScrollAcrossPageBoundaries;
- (id)_accessibilityUserDefinedScrollingEnabled;
- (id)_accessibilityUserDefinedShouldIncludeRowRangeInElementDescription;
- (id)_accessibilityUserTestingActionIdentifiers;
- (id)_accessibilityValueForRange:()AXPrivCategory;
- (id)_accessibilityViewAncestorIsKindOf:()AXPrivCategory;
- (id)_accessibilityVisibleElementsHonoringGroups:()AXPrivCategory respectGroupedParents:;
- (id)_accessibilityVisibleItemInList;
- (id)_accessibilityVisibleOpaqueElementsHonoringGroups:()AXPrivCategory sorted:;
- (id)_accessibilityWatchAutoSpeakElements;
- (id)_accessibilityWindow;
- (id)_accessibilityWindowScene;
- (id)_accessibilityWindowSceneIdentifier;
- (id)_axAncestorTypes;
- (id)_axCachedHasTabBarAncestor;
- (id)_axDebugTraits;
- (id)_axGetStoredFocusGroupIdentifier;
- (id)_axOutermostScrollParent;
- (id)_axSuperviews;
- (id)_getAccessibilityAttributedString;
- (id)_iosAccessibilityAttributeValue:()AXPrivCategory forParameter:;
- (id)_processMathChildrenExpressions:()AXPrivCategory;
- (id)_processMathMultiscriptExpressions:()AXPrivCategory;
- (id)_retrieveCustomActionsForElement:()AXPrivCategory;
- (id)accessibilityAssistiveTechnologyFocusedIdentifiers;
- (id)accessibilityCustomContent;
- (id)accessibilityDataTableCellElementForRow:()AXPrivCategory column:;
- (id)accessibilityElementForRow:()AXPrivCategory andColumn:;
- (id)accessibilityHeaderElementsForColumn:()AXPrivCategory;
- (id)accessibilityHeaderElementsForRow:()AXPrivCategory;
- (id)accessibilityMathEquation;
- (id)accessibilitySortDirection;
- (id)accessibilityStringForTextMarkers:()AXPrivCategory;
- (id)accessibilityUserDefinedOpaqueElementScrollsContentIntoView;
- (id)accessibilityViewWithIdentifier:()AXPrivCategory;
- (uint64_t)__accessibilityReadAllOnFocus;
- (uint64_t)__accessibilitySupportsActivateAction;
- (uint64_t)_acceessibilityUIKitIsUserInteractionDisabled;
- (uint64_t)_accessibililtyLabelForTabBarButton:()AXPrivCategory;
- (uint64_t)_accessibility2DBrailleCanvasElement;
- (uint64_t)_accessibilityActivateKeyboardDeleteKey;
- (uint64_t)_accessibilityActivateParagraphInTextViewRange:()AXPrivCategory;
- (uint64_t)_accessibilityActivateTextViewLink:()AXPrivCategory;
- (uint64_t)_accessibilityActiveURL;
- (uint64_t)_accessibilityAddTrait:()AXPrivCategory;
- (uint64_t)_accessibilityAdditionalElementOrderedLast;
- (uint64_t)_accessibilityAllowOutOfBoundsHitTestAtPoint:()AXPrivCategory withEvent:;
- (uint64_t)_accessibilityAllowedPagingOverlap;
- (uint64_t)_accessibilityAllowsAlternativeCharacterActivation;
- (uint64_t)_accessibilityAlternateActionForURL:()AXPrivCategory;
- (uint64_t)_accessibilityAlternativesForTextAtPosition:()AXPrivCategory;
- (uint64_t)_accessibilityAlwaysNo;
- (uint64_t)_accessibilityAlwaysOrderedFirst;
- (uint64_t)_accessibilityAlwaysSpeakTableHeaders;
- (uint64_t)_accessibilityAlwaysYes;
- (uint64_t)_accessibilityAncestorIsAccessibilityElementsHidden;
- (uint64_t)_accessibilityAppSwitcherApps;
- (uint64_t)_accessibilityApplicationOrientation;
- (uint64_t)_accessibilityApplicationSemanticContext;
- (uint64_t)_accessibilityAuditVisibleElementsHonoringGroups:()AXPrivCategory;
- (uint64_t)_accessibilityAuthenticatedPasteWithValue:()AXPrivCategory;
- (uint64_t)_accessibilityAutomaticIdentifier;
- (uint64_t)_accessibilityBackgroundTextColorAttribute;
- (uint64_t)_accessibilityBackingElementIsValid;
- (uint64_t)_accessibilityBannerIsSticky;
- (uint64_t)_accessibilityBasePerformOrbGesture:()AXPrivCategory;
- (uint64_t)_accessibilityBaseScrollToVisible;
- (uint64_t)_accessibilityBeginUndoableTextInsertion;
- (uint64_t)_accessibilityBookShowsDualPages;
- (uint64_t)_accessibilityBoundaryEdges;
- (uint64_t)_accessibilityBundleIdentifier;
- (uint64_t)_accessibilityCameraIrisOpen;
- (uint64_t)_accessibilityCanAppearInContextMenuPreview;
- (uint64_t)_accessibilityCanBeConsideredAsMainWindow;
- (uint64_t)_accessibilityCanBeConsideredMediaAnalysisElement;
- (uint64_t)_accessibilityCanBeFirstResponder;
- (uint64_t)_accessibilityCanBeFirstResponderWhenNotAnElement;
- (uint64_t)_accessibilityCanDeleteTableViewCell;
- (uint64_t)_accessibilityCanDismissPopoverController:()AXPrivCategory;
- (uint64_t)_accessibilityCanDisplayMultipleControllers;
- (uint64_t)_accessibilityCanPerformAction:()AXPrivCategory;
- (uint64_t)_accessibilityCanScrollInAtLeastOneDirection;
- (uint64_t)_accessibilityCellWithRowIndex:()AXPrivCategory column:containingView:;
- (uint64_t)_accessibilityCharacterRangeForPosition:()AXPrivCategory;
- (uint64_t)_accessibilityChartElement;
- (uint64_t)_accessibilityCirclePathBasedOnBoundsWidth;
- (uint64_t)_accessibilityCollectionViewCellScrollShouldInformScrollDelegate;
- (uint64_t)_accessibilityColumnCount;
- (uint64_t)_accessibilityColumnRange;
- (uint64_t)_accessibilityCompareElement:()AXPrivCategory toElement:;
- (uint64_t)_accessibilityContainedByTableLogicIsEnabledOutsideOfWebContext;
- (uint64_t)_accessibilityContextDrawingAnnotations;
- (uint64_t)_accessibilityContextId;
- (uint64_t)_accessibilityConvertSystemBoundedScreenPointToContextSpace:()AXPrivCategory;
- (uint64_t)_accessibilityCustomActionGroupIdentifier;
- (uint64_t)_accessibilityCustomRotorTypeForString:()AXPrivCategory;
- (uint64_t)_accessibilityDOMAttributes;
- (uint64_t)_accessibilityDataDetectorScheme:()AXPrivCategory;
- (uint64_t)_accessibilityDataSeriesCategoryLabelsForAxis:()AXPrivCategory;
- (uint64_t)_accessibilityDataSeriesGridlinePositionsForAxis:()AXPrivCategory;
- (uint64_t)_accessibilityDataSeriesIncludesTrendlineInSonification;
- (uint64_t)_accessibilityDataSeriesMaximumValueForAxis:()AXPrivCategory;
- (uint64_t)_accessibilityDataSeriesMinimumValueForAxis:()AXPrivCategory;
- (uint64_t)_accessibilityDataSeriesName;
- (uint64_t)_accessibilityDataSeriesSupportsSonification;
- (uint64_t)_accessibilityDataSeriesSupportsSummarization;
- (uint64_t)_accessibilityDataSeriesTitleForAxis:()AXPrivCategory;
- (uint64_t)_accessibilityDataSeriesType;
- (uint64_t)_accessibilityDataSeriesUnitLabelForAxis:()AXPrivCategory;
- (uint64_t)_accessibilityDataSeriesValueDescriptionForPosition:()AXPrivCategory axis:;
- (uint64_t)_accessibilityDataSeriesValuesForAxis:()AXPrivCategory;
- (uint64_t)_accessibilityDatePickerComponentType;
- (uint64_t)_accessibilityDateTimePickerValues;
- (uint64_t)_accessibilityDescendantElementAtIndexPathIsValid:()AXPrivCategory;
- (uint64_t)_accessibilityDidDeleteTableViewCell;
- (uint64_t)_accessibilityDidMoveToTabBar;
- (uint64_t)_accessibilityDigitalCrownScrollAmount;
- (uint64_t)_accessibilityDirectTouchOptionsAttribute;
- (uint64_t)_accessibilityDismissAlternativeKeyPicker;
- (uint64_t)_accessibilityDispatchKeyboardAction:()AXPrivCategory;
- (uint64_t)_accessibilityDisplayFocusIndicatorForFocusEverywhereView;
- (uint64_t)_accessibilityDisplayId;
- (uint64_t)_accessibilityDragSourceDescriptorAuxiliaryDictionary;
- (uint64_t)_accessibilityDropPointDescriptorAuxiliaryDictionary;
- (uint64_t)_accessibilityEffectiveMediaAnalysisOptions;
- (uint64_t)_accessibilityElementCommunityIdentifier;
- (uint64_t)_accessibilityElementForFindSessionResult;
- (uint64_t)_accessibilityElementForTextInsertionAndDeletion;
- (uint64_t)_accessibilityElementHasImage;
- (uint64_t)_accessibilityElementHelp;
- (uint64_t)_accessibilityElementIsBeingHitTested;
- (uint64_t)_accessibilityElementServesAsHeadingLandmark;
- (uint64_t)_accessibilityElementShouldBeInvalid;
- (uint64_t)_accessibilityElementStoredUserLabel;
- (uint64_t)_accessibilityElementVisibilityAffectsLayout;
- (uint64_t)_accessibilityElementsForSearchParameter:()AXPrivCategory;
- (uint64_t)_accessibilityEncodedHierarchyData;
- (uint64_t)_accessibilityEndUndoableTextInsertion;
- (uint64_t)_accessibilityExpandedStatus;
- (uint64_t)_accessibilityExpandedStatusTogglesOnActivate;
- (uint64_t)_accessibilityFKAArrowKeysHandled;
- (uint64_t)_accessibilityFKAShouldBeProcessed;
- (uint64_t)_accessibilityFKAShouldIncludeViewsAsElements;
- (uint64_t)_accessibilityFKAShouldProcessChildren;
- (uint64_t)_accessibilityFilenameForAttachmentCID:()AXPrivCategory;
- (uint64_t)_accessibilityFilterInteractionLocationDescriptorsForVisible:()AXPrivCategory;
- (uint64_t)_accessibilityFindAncestor:()AXPrivCategory startWithSelf:;
- (uint64_t)_accessibilityFirstElement;
- (uint64_t)_accessibilityFirstResponderForWindow:()AXPrivCategory;
- (uint64_t)_accessibilityFirstVisibleItem;
- (uint64_t)_accessibilityFocusRingAncestor;
- (uint64_t)_accessibilityFocusRingTintColor;
- (uint64_t)_accessibilityForegroundTextColorAttribute;
- (uint64_t)_accessibilityFuzzyHitTestElements;
- (uint64_t)_accessibilityGeometrySortedElements:()AXPrivCategory;
- (uint64_t)_accessibilityHandlePublicScroll:()AXPrivCategory;
- (uint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets;
- (uint64_t)_accessibilityHandwritingAttributeAllowedCharacterSetsForKeyboardType:()AXPrivCategory;
- (uint64_t)_accessibilityHandwritingAttributePreferredCharacterSet;
- (uint64_t)_accessibilityHandwritingAttributePreferredCharacterSetForKeyboardType:()AXPrivCategory;
- (uint64_t)_accessibilityHasBadge;
- (uint64_t)_accessibilityHasDeletableText;
- (uint64_t)_accessibilityHasDragDestinations;
- (uint64_t)_accessibilityHasDragSources;
- (uint64_t)_accessibilityHasTextOperations;
- (uint64_t)_accessibilityHasVariantKeys;
- (uint64_t)_accessibilityHeaderElement;
- (uint64_t)_accessibilityHitTestReverseOrder;
- (uint64_t)_accessibilityHitTestShouldFallbackToNearestChild;
- (uint64_t)_accessibilityHitTestShouldUseWindowBounds;
- (uint64_t)_accessibilityHitTestingObscuredScreenAllowedViews;
- (uint64_t)_accessibilityHitTestsStatusBar;
- (uint64_t)_accessibilityHorizontalScrollBarElement;
- (uint64_t)_accessibilityHorizontalSizeClass;
- (uint64_t)_accessibilityHoverTypingShouldAdjustDockedMode;
- (uint64_t)_accessibilityIgnoreNextNotification:()AXPrivCategory;
- (uint64_t)_accessibilityIgnoresStatusBarFrame;
- (uint64_t)_accessibilityImplementsDefaultRowRange;
- (uint64_t)_accessibilityIncludeDuringContentReading;
- (uint64_t)_accessibilityIncludeRoleDescription;
- (uint64_t)_accessibilityIncludeRoleInGroupNavigationOnly;
- (uint64_t)_accessibilityIncreaseLayoutBounds;
- (uint64_t)_accessibilityIndexForPickerString:()AXPrivCategory;
- (uint64_t)_accessibilityIndexPath;
- (uint64_t)_accessibilityIndexPathAsRange;
- (uint64_t)_accessibilityInheritedTraits;
- (uint64_t)_accessibilityInsertTextWithAlternatives:()AXPrivCategory;
- (uint64_t)_accessibilityInterfaceOrientationForScreenCoordinates;
- (uint64_t)_accessibilityIsAccessibilityUIServer;
- (uint64_t)_accessibilityIsAwayAlertElement;
- (uint64_t)_accessibilityIsAwayAlertElementNew;
- (uint64_t)_accessibilityIsBannerNotificationElement;
- (uint64_t)_accessibilityIsChartElement;
- (uint64_t)_accessibilityIsDictating;
- (uint64_t)_accessibilityIsEscapable;
- (uint64_t)_accessibilityIsFKARunningForFocusItem;
- (uint64_t)_accessibilityIsFirstElementForFocus;
- (uint64_t)_accessibilityIsFirstSibling;
- (uint64_t)_accessibilityIsFirstSiblingForType:()AXPrivCategory;
- (uint64_t)_accessibilityIsFocusForFocusEverywhereRunningForFocusItem;
- (uint64_t)_accessibilityIsFrameOutOfBounds;
- (uint64_t)_accessibilityIsFrameOutOfBoundsConsideringScrollParents:()AXPrivCategory;
- (uint64_t)_accessibilityIsGroupedParent;
- (uint64_t)_accessibilityIsGuideElement;
- (uint64_t)_accessibilityIsInAppSwitcher;
- (uint64_t)_accessibilityIsInFolder;
- (uint64_t)_accessibilityIsInJindo;
- (uint64_t)_accessibilityIsInTabBar;
- (uint64_t)_accessibilityIsInWidgetStack;
- (uint64_t)_accessibilityIsInternationalKeyboardKey;
- (uint64_t)_accessibilityIsIsolatedWindow;
- (uint64_t)_accessibilityIsJindo;
- (uint64_t)_accessibilityIsKeyboardPassthroughInputAccessoryView;
- (uint64_t)_accessibilityIsKindOfUIView;
- (uint64_t)_accessibilityIsLastSibling;
- (uint64_t)_accessibilityIsLastSiblingForType:()AXPrivCategory;
- (uint64_t)_accessibilityIsMacVisualAppearance;
- (uint64_t)_accessibilityIsMainWindow;
- (uint64_t)_accessibilityIsMathTouchExplorationView;
- (uint64_t)_accessibilityIsNonDismissableStatusBarElement;
- (uint64_t)_accessibilityIsNotFirstElement;
- (uint64_t)_accessibilityIsOrnamentWindow;
- (uint64_t)_accessibilityIsPHAssetLocallyAvailable;
- (uint64_t)_accessibilityIsRTL;
- (uint64_t)_accessibilityIsRealtimeElement;
- (uint64_t)_accessibilityIsRemoteElement;
- (uint64_t)_accessibilityIsRootElementForElementTraversal;
- (uint64_t)_accessibilityIsScrollAncestor;
- (uint64_t)_accessibilityIsScrollBarIndicator;
- (uint64_t)_accessibilityIsScrollable;
- (uint64_t)_accessibilityIsSoftwareKeyboardMimic;
- (uint64_t)_accessibilityIsSortPriorityContainer;
- (uint64_t)_accessibilityIsSpeakThisElement;
- (uint64_t)_accessibilityIsStarkElement;
- (uint64_t)_accessibilityIsStrongPasswordField;
- (uint64_t)_accessibilityIsSupportedGestureRecognizer;
- (uint64_t)_accessibilityIsSwiftUIHostingView;
- (uint64_t)_accessibilityIsSwitch;
- (uint64_t)_accessibilityIsTableCell;
- (uint64_t)_accessibilityIsTitleElement;
- (uint64_t)_accessibilityIsTourGuideRunning;
- (uint64_t)_accessibilityIsUsingRemoteParentActivateAction;
- (uint64_t)_accessibilityIsVerticalAdjustableElement;
- (uint64_t)_accessibilityIsVisibleByCompleteHitTest;
- (uint64_t)_accessibilityIsWebDocumentView;
- (uint64_t)_accessibilityIterateParentsForTestBlock:()AXPrivCategory;
- (uint64_t)_accessibilityIterateScrollParentsUsingBlock:()AXPrivCategory;
- (uint64_t)_accessibilityKeyCommandsShouldOverrideKeyCommands;
- (uint64_t)_accessibilityKeyboardIsContinuousPathAvailable;
- (uint64_t)_accessibilityKeyboardIsContinuousPathTracking;
- (uint64_t)_accessibilityKeyboardIsEmojiInputMode;
- (uint64_t)_accessibilityKeyboardKeyAllowsTouchTyping;
- (uint64_t)_accessibilityKeyboardKeyForString:()AXPrivCategory;
- (uint64_t)_accessibilityKeyboardKeyHasSignificantAlternateActions;
- (uint64_t)_accessibilityKeyboardSupportsGestureMode;
- (uint64_t)_accessibilityLanguageOverriddesUser;
- (uint64_t)_accessibilityLastHitTestNearBorder;
- (uint64_t)_accessibilityLaunchableApps;
- (uint64_t)_accessibilityLineEndPosition;
- (uint64_t)_accessibilityLineNumberAndColumnForPoint:()AXPrivCategory;
- (uint64_t)_accessibilityLineRangeForPosition:()AXPrivCategory;
- (uint64_t)_accessibilityLineStartPosition;
- (uint64_t)_accessibilityLoadAccessibilityInformationSupplementaryItems;
- (uint64_t)_accessibilityLoadURL:()AXPrivCategory;
- (uint64_t)_accessibilityMapDetailedInfoAtPoint:()AXPrivCategory;
- (uint64_t)_accessibilityMapFeatureType;
- (uint64_t)_accessibilityMapsExplorationCurrentIntersectionDescription;
- (uint64_t)_accessibilityMapsExplorationCurrentLocation;
- (uint64_t)_accessibilityMapsExplorationCurrentRoadsWithAngles;
- (uint64_t)_accessibilityMapsExplorationDecreaseVerbosity;
- (uint64_t)_accessibilityMapsExplorationIncreaseVerbosity;
- (uint64_t)_accessibilityMapsExplorationIsActive;
- (uint64_t)_accessibilityMapsExplorationIsPending;
- (uint64_t)_accessibilityMarkElementForVisiblePointHitTest:()AXPrivCategory;
- (uint64_t)_accessibilityMediaAnalysisFrame;
- (uint64_t)_accessibilityMediaAnalysisOptions;
- (uint64_t)_accessibilityMoveFocusToNextOpaqueElementForTechnology:()AXPrivCategory direction:searchType:range:;
- (uint64_t)_accessibilityMoveFocusToNextOpaqueElementForTechnology:()AXPrivCategory direction:searchType:range:shouldScrollToVisible:;
- (uint64_t)_accessibilityNativeFocusElement;
- (uint64_t)_accessibilityNotificationCount;
- (uint64_t)_accessibilityNotificationSummary:()AXPrivCategory;
- (uint64_t)_accessibilityObjectForTextMarker:()AXPrivCategory;
- (uint64_t)_accessibilityOnlyComparesByXAxis;
- (uint64_t)_accessibilityOpaqueElementProvider;
- (uint64_t)_accessibilityOpaqueElementScrollsContentIntoView;
- (uint64_t)_accessibilityOpaqueHeaderElementInDirection:()AXPrivCategory childElement:;
- (uint64_t)_accessibilityOrderedChildrenContainer;
- (uint64_t)_accessibilityOrientation;
- (uint64_t)_accessibilityOrientationForCompareGeometryForApplication:()AXPrivCategory;
- (uint64_t)_accessibilityOverridesInstructionsHint;
- (uint64_t)_accessibilityOverridesInvalidFrames;
- (uint64_t)_accessibilityOverridesInvisibility;
- (uint64_t)_accessibilityPHAssetLocalIdentifier;
- (uint64_t)_accessibilityPageContent;
- (uint64_t)_accessibilityPageCount;
- (uint64_t)_accessibilityPageIndex;
- (uint64_t)_accessibilityPageTextMarkerRange;
- (uint64_t)_accessibilityPagingEnabled;
- (uint64_t)_accessibilityParentCollectionView;
- (uint64_t)_accessibilityParentTableView;
- (uint64_t)_accessibilityPerformCustomActionWithIdentifier:()AXPrivCategory;
- (uint64_t)_accessibilityPerformEscape;
- (uint64_t)_accessibilityPerformLegacyCustomAction:()AXPrivCategory;
- (uint64_t)_accessibilityPerformOrbGesture:()AXPrivCategory;
- (uint64_t)_accessibilityPerformUserTestingAction:()AXPrivCategory;
- (uint64_t)_accessibilityPhotoLibraryURL;
- (uint64_t)_accessibilityPickerType;
- (uint64_t)_accessibilityPlayKeyboardClickSound;
- (uint64_t)_accessibilityPositionInDirection:()AXPrivCategory offset:forPosition:;
- (uint64_t)_accessibilityPostPasteboardTextForOperation:()AXPrivCategory;
- (uint64_t)_accessibilityPostValueChangedNotificationWithChangeType:()AXPrivCategory;
- (uint64_t)_accessibilityPostValueChangedNotificationWithInsertedText:()AXPrivCategory;
- (uint64_t)_accessibilityPostValueChangedNotificationWithInsertedText:()AXPrivCategory keyInputDelegate:;
- (uint64_t)_accessibilityPotentiallyAttributedSelectorForNonAttributedSelector:()AXPrivCategory attributedSelector:;
- (uint64_t)_accessibilityPrefersNonAttributedHint;
- (uint64_t)_accessibilityPrefersNonAttributedLabel;
- (uint64_t)_accessibilityPrefersNonAttributedValue;
- (uint64_t)_accessibilityPublicCustomRotorLinkCount:()AXPrivCategory;
- (uint64_t)_accessibilityPublicCustomRotorVisibleInTouchRotor:()AXPrivCategory;
- (uint64_t)_accessibilityRangeForLineNumber:()AXPrivCategory;
- (uint64_t)_accessibilityRangeForLineNumberAndColumn:()AXPrivCategory;
- (uint64_t)_accessibilityRangeForTextMarker:()AXPrivCategory;
- (uint64_t)_accessibilityRangeForTextMarkers:()AXPrivCategory;
- (uint64_t)_accessibilityRawRangeForUITextRange:()AXPrivCategory;
- (uint64_t)_accessibilityRawSetIsSpeakThisElement:()AXPrivCategory;
- (uint64_t)_accessibilityReadAllContinuesWithScroll;
- (uint64_t)_accessibilityReadAllOnFocus;
- (uint64_t)_accessibilityRealtimeCompleted;
- (uint64_t)_accessibilityRealtimeHasUnread;
- (uint64_t)_accessibilityRecentlyActivatedApplicationBundleIdentifiers;
- (uint64_t)_accessibilityReinterpretVoiceOverCommand:()AXPrivCategory;
- (uint64_t)_accessibilityRemoteElementShouldHitTestHostProcess;
- (uint64_t)_accessibilityRemoveTrait:()AXPrivCategory;
- (uint64_t)_accessibilityReplaceTextInRange:()AXPrivCategory withString:;
- (uint64_t)_accessibilityRepresentsInfiniteCollection;
- (uint64_t)_accessibilityRequiresLaTeXInput;
- (uint64_t)_accessibilityResetBannerTimer;
- (uint64_t)_accessibilityResolvedEditingStyles;
- (uint64_t)_accessibilityRespectsTableScrollEnabledFlag;
- (uint64_t)_accessibilityResponderElement;
- (uint64_t)_accessibilityRespondsToUserInteraction;
- (uint64_t)_accessibilityRetainsCustomRotorActionSetting;
- (uint64_t)_accessibilityRetainsFocusOnScreenChange;
- (uint64_t)_accessibilityRoadContainsTrackingPoint:()AXPrivCategory;
- (uint64_t)_accessibilityRowCount;
- (uint64_t)_accessibilityRowRange;
- (uint64_t)_accessibilityRowRangeFromTableOrCollectionView:()AXPrivCategory;
- (uint64_t)_accessibilityRuntimeElementTransactionSummary;
- (uint64_t)_accessibilitySavePhotoLabel:()AXPrivCategory;
- (uint64_t)_accessibilityScannerShouldUseActivateInPointMode;
- (uint64_t)_accessibilityScrollAcrossPageBoundaries;
- (uint64_t)_accessibilityScrollAncestor;
- (uint64_t)_accessibilityScrollAncestorForSelector:()AXPrivCategory;
- (uint64_t)_accessibilityScrollDownPage:()AXPrivCategory;
- (uint64_t)_accessibilityScrollLeftPage:()AXPrivCategory;
- (uint64_t)_accessibilityScrollNextPage;
- (uint64_t)_accessibilityScrollPageInDirection:()AXPrivCategory shouldSendScrollFailed:;
- (uint64_t)_accessibilityScrollParentForComparingByXAxis;
- (uint64_t)_accessibilityScrollPreviousPage;
- (uint64_t)_accessibilityScrollRightPage:()AXPrivCategory;
- (uint64_t)_accessibilityScrollToFrame:()AXPrivCategory forView:;
- (uint64_t)_accessibilityScrollToPoint:()AXPrivCategory;
- (uint64_t)_accessibilityScrollToVisibleForNextElementRetrieval:()AXPrivCategory;
- (uint64_t)_accessibilityScrollUpPage:()AXPrivCategory;
- (uint64_t)_accessibilityScrollingEnabled;
- (uint64_t)_accessibilitySecondaryActivate;
- (uint64_t)_accessibilitySecureName;
- (uint64_t)_accessibilitySelectedChildren;
- (uint64_t)_accessibilitySelectedNSRangeForObject;
- (uint64_t)_accessibilitySelectedTextRange;
- (uint64_t)_accessibilitySelfFoundByHitTesting;
- (uint64_t)_accessibilitySemanticContextForElement:()AXPrivCategory;
- (uint64_t)_accessibilityServesAsFirstElement;
- (uint64_t)_accessibilityServesAsFirstResponder;
- (uint64_t)_accessibilitySetAdditionalElementOrderedLast:()AXPrivCategory;
- (uint64_t)_accessibilitySetAdditionalImportantScannerMenuItems:()AXPrivCategory;
- (uint64_t)_accessibilitySetApplicationOrientation:()AXPrivCategory;
- (uint64_t)_accessibilitySetContainerToStopVisibilityCheck:()AXPrivCategory;
- (uint64_t)_accessibilitySetContextDescriptors:()AXPrivCategory;
- (uint64_t)_accessibilitySetContextDrawingAnnotations:()AXPrivCategory;
- (uint64_t)_accessibilitySetElementHelp:()AXPrivCategory;
- (uint64_t)_accessibilitySetFocusRingTintColor:()AXPrivCategory;
- (uint64_t)_accessibilitySetLastElementsUpdatedWithContainerElementReferences:()AXPrivCategory;
- (uint64_t)_accessibilitySetOnlyComparesByXAxis:()AXPrivCategory;
- (uint64_t)_accessibilitySetOverridesInvisibility:()AXPrivCategory;
- (uint64_t)_accessibilitySetPagingEnabled:()AXPrivCategory;
- (uint64_t)_accessibilitySetPrivateCustomActionsElement:()AXPrivCategory;
- (uint64_t)_accessibilitySetRoleDescription:()AXPrivCategory;
- (uint64_t)_accessibilitySetShouldHitTestFallBackToNearestChild:()AXPrivCategory;
- (uint64_t)_accessibilitySetShouldIgnoreOpaqueElementProviders:()AXPrivCategory;
- (uint64_t)_accessibilitySetShouldPreventOpaqueScrolling:()AXPrivCategory;
- (uint64_t)_accessibilitySetStartingPointForIsVisible:()AXPrivCategory;
- (uint64_t)_accessibilitySetSupplementaryFooterViews:()AXPrivCategory;
- (uint64_t)_accessibilitySetSupplementaryHeaderViews:()AXPrivCategory;
- (uint64_t)_accessibilitySetSupportsChartsV2:()AXPrivCategory;
- (uint64_t)_accessibilitySetTextViewIgnoresValueChanges:()AXPrivCategory;
- (uint64_t)_accessibilitySetUserDefinedAdditionalElements:()AXPrivCategory;
- (uint64_t)_accessibilitySetUserDefinedIsGuideElement:()AXPrivCategory;
- (uint64_t)_accessibilitySetUserDefinedMediaAnalysisOptions:()AXPrivCategory;
- (uint64_t)_accessibilitySetUserDefinedScrollAcrossPageBoundaries:()AXPrivCategory;
- (uint64_t)_accessibilitySetUserDefinedScrollingEnabled:()AXPrivCategory;
- (uint64_t)_accessibilitySetUserDefinedShouldIncludeRowRangeInElementDescription:()AXPrivCategory;
- (uint64_t)_accessibilitySetUsesScrollParentForOrdering:()AXPrivCategory;
- (uint64_t)_accessibilitySetWantsOpaqueElementProviders:()AXPrivCategory;
- (uint64_t)_accessibilityShouldAnnounceFontInfo;
- (uint64_t)_accessibilityShouldApplySemanticGroupContainerType;
- (uint64_t)_accessibilityShouldAttemptScrollToFrameOnParentView;
- (uint64_t)_accessibilityShouldAttemptToAddDismissalElement;
- (uint64_t)_accessibilityShouldAvoidAnnouncing;
- (uint64_t)_accessibilityShouldAvoidScrollingCollectionViewCells;
- (uint64_t)_accessibilityShouldExpandMathEquation;
- (uint64_t)_accessibilityShouldHitTestRemoteElementProcess;
- (uint64_t)_accessibilityShouldHitTestStatusBarWindow;
- (uint64_t)_accessibilityShouldIgnoreOpaqueElementProviders;
- (uint64_t)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement;
- (uint64_t)_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren;
- (uint64_t)_accessibilityShouldIncludeMediaDescriptionsRotor;
- (uint64_t)_accessibilityShouldIncludeParentCustomActions;
- (uint64_t)_accessibilityShouldIncludeParentCustomContent;
- (uint64_t)_accessibilityShouldIncludeRegionDescription;
- (uint64_t)_accessibilityShouldIncludeRemoteParentCustomActions;
- (uint64_t)_accessibilityShouldIncludeRowRangeInElementDescription;
- (uint64_t)_accessibilityShouldInheritTraits;
- (uint64_t)_accessibilityShouldPreventOpaqueScrolling;
- (uint64_t)_accessibilityShouldReleaseAfterUnregistration;
- (uint64_t)_accessibilityShouldSpeakMathEquationTrait;
- (uint64_t)_accessibilityShouldSpeakScrollStatusOnEntry;
- (uint64_t)_accessibilityShouldSuppressCustomActionsHint;
- (uint64_t)_accessibilityShouldUseFallbackForVisibleContentInset;
- (uint64_t)_accessibilityShouldUseHostContextIDForLongPress;
- (uint64_t)_accessibilityShouldUseHostContextIDForPress;
- (uint64_t)_accessibilityShouldUseHostContextIDForTap;
- (uint64_t)_accessibilityShouldUseViewHierarchyForFindingScrollParent;
- (uint64_t)_accessibilityShowContextMenuForElement:()AXPrivCategory targetPointValue:;
- (uint64_t)_accessibilityShowContextMenuWithTargetPointValue:()AXPrivCategory;
- (uint64_t)_accessibilitySiblingWithAncestor:()AXPrivCategory isFirst:isLast:;
- (uint64_t)_accessibilitySkipImageTraitDescription;
- (uint64_t)_accessibilitySoftwareMimicKeyboard;
- (uint64_t)_accessibilitySortCollectionViewLogically;
- (uint64_t)_accessibilitySortElementsUsingGeometry:()AXPrivCategory;
- (uint64_t)_accessibilitySortPriority;
- (uint64_t)_accessibilitySortPriorityWithReturningElement:()AXPrivCategory;
- (uint64_t)_accessibilitySpeakThisIgnoresAccessibilityElementStatus;
- (uint64_t)_accessibilityStartingPointForIsVisible;
- (uint64_t)_accessibilityStatusBar;
- (uint64_t)_accessibilitySupplementaryFooterViews;
- (uint64_t)_accessibilitySupplementaryHeaderViews;
- (uint64_t)_accessibilitySupportGesturesAttributes;
- (uint64_t)_accessibilitySupportsChartsV2;
- (uint64_t)_accessibilitySupportsDirectioOrbManipulation;
- (uint64_t)_accessibilitySupportsFrameForRange;
- (uint64_t)_accessibilitySupportsHandwriting;
- (uint64_t)_accessibilitySupportsMultipleCustomRotorTitles;
- (uint64_t)_accessibilitySupportsPressedState;
- (uint64_t)_accessibilitySupportsReadingContent;
- (uint64_t)_accessibilitySupportsSecondaryActivateAction;
- (uint64_t)_accessibilitySupportsSemanticContext;
- (uint64_t)_accessibilitySwipeIslandIdentifier;
- (uint64_t)_accessibilityTabBarAncestor;
- (uint64_t)_accessibilityTableCellUsesDetailTextAsValue;
- (uint64_t)_accessibilityTableIndexTitles;
- (uint64_t)_accessibilityTapReplacementGestures;
- (uint64_t)_accessibilityTextChecker;
- (uint64_t)_accessibilityTextFieldText;
- (uint64_t)_accessibilityTextInputElement;
- (uint64_t)_accessibilityTextInputElementRange;
- (uint64_t)_accessibilityTextInputElementRangeAsNSRange;
- (uint64_t)_accessibilityTextInputProxiesForRealTextView;
- (uint64_t)_accessibilityTextOperationAction:()AXPrivCategory;
- (uint64_t)_accessibilityTextRangeFromNSRange:()AXPrivCategory;
- (uint64_t)_accessibilityTextViewIgnoresValueChanges;
- (uint64_t)_accessibilityTextViewShouldBreakUpParagraphs;
- (uint64_t)_accessibilityTouchContainer;
- (uint64_t)_accessibilityTouchContainerShouldOutputBraille;
- (uint64_t)_accessibilityTraitsInspectorHumanReadable;
- (uint64_t)_accessibilityTriggerDictationFromPath:()AXPrivCategory;
- (uint64_t)_accessibilityTryScrollWithSelector:()AXPrivCategory shouldSendScrollFailed:;
- (uint64_t)_accessibilityUIViewAccessibilityFrame;
- (uint64_t)_accessibilityUnignoredDescendant;
- (uint64_t)_accessibilityUpcomingRoadsForPoint:()AXPrivCategory forAngle:;
- (uint64_t)_accessibilityUpdatesOnActivationAfterDelay;
- (uint64_t)_accessibilityUpdatesSwitchMenu;
- (uint64_t)_accessibilityUseContextlessPassthroughForDrag;
- (uint64_t)_accessibilityUseElementAtPositionAfterActivation;
- (uint64_t)_accessibilityUseWindowBoundsForOutOfBoundsChecking;
- (uint64_t)_accessibilityUserDefinedIsGuideElement;
- (uint64_t)_accessibilityUserDefinedMediaAnalysisOptions;
- (uint64_t)_accessibilityUserTestingActions;
- (uint64_t)_accessibilityUserTestingProxyView;
- (uint64_t)_accessibilityUserTestingVisibleAncestor;
- (uint64_t)_accessibilityUserTestingVisibleCells;
- (uint64_t)_accessibilityUserTestingVisibleSections;
- (uint64_t)_accessibilityUsesChildrenFramesForSorting;
- (uint64_t)_accessibilityUsesScrollParentForOrdering;
- (uint64_t)_accessibilityUsesSpecialKeyboardDismiss;
- (uint64_t)_accessibilityVariantKeys;
- (uint64_t)_accessibilityVerticalScrollBarElement;
- (uint64_t)_accessibilityVerticalSizeClass;
- (uint64_t)_accessibilityViewController;
- (uint64_t)_accessibilityViewControllerShouldPreventScrollToVisibleForElement:()AXPrivCategory;
- (uint64_t)_accessibilityViewIsMacIdiom;
- (uint64_t)_accessibilityVisibleElementsHonoringGroups:()AXPrivCategory;
- (uint64_t)_accessibilityVisibleFrame;
- (uint64_t)_accessibilityVisibleOpaqueElements;
- (uint64_t)_accessibilityVisiblePoint;
- (uint64_t)_accessibilityVisiblePointHonorsScreenBounds;
- (uint64_t)_accessibilityVisibleTextRange;
- (uint64_t)_accessibilityWantsOpaqueElementProviders;
- (uint64_t)_accessibilityWarmPrefersNonAttributedLabelValueHintCache;
- (uint64_t)_accessibilityWebAreaURL;
- (uint64_t)_accessibilityWebSearchResultsActive;
- (uint64_t)_accessibilityWebViewIsLoading;
- (uint64_t)_accessibilityWindowSections;
- (uint64_t)_accessibilityWindowVisible;
- (uint64_t)_accessibiltyAvailableKeyplanes;
- (uint64_t)_allowCustomActionHintSpeakOverride;
- (uint64_t)_animateScrollViewWithScrollAmount:()AXPrivCategory point:;
- (uint64_t)_axAdditionalElementHitTestingInProgress;
- (uint64_t)_axNavigationalGroupParentOfChild:()AXPrivCategory;
- (uint64_t)_axSetAdditionalElementHitTestingInProgress:()AXPrivCategory;
- (uint64_t)_axSetCachedHasTabBarAncestor:()AXPrivCategory;
- (uint64_t)_privateAccessibilityCustomActions;
- (uint64_t)_setAccessibilityEncodedHierarchyData:()AXPrivCategory;
- (uint64_t)_setAccessibilityHeadingLevel:()AXPrivCategory;
- (uint64_t)_setAccessibilityTableCellUsesDetailTextAsValue:()AXPrivCategory;
- (uint64_t)_setAccessibilityUpdatesOnActivationAfterDelay:()AXPrivCategory;
- (uint64_t)_setAxStoredFocusGroupIdentifier:()AXPrivCategory;
- (uint64_t)accessibilityARIAColumnCount;
- (uint64_t)accessibilityARIAColumnIndex;
- (uint64_t)accessibilityARIARowCount;
- (uint64_t)accessibilityARIARowIndex;
- (uint64_t)accessibilityArrayOfTextForTextMarkers:()AXPrivCategory;
- (uint64_t)accessibilityBlockquoteLevel;
- (uint64_t)accessibilityChartDescriptor;
- (uint64_t)accessibilityChildrenContainerGroupingBehaviorHasOverridingParentDelegate;
- (uint64_t)accessibilityColumnCount;
- (uint64_t)accessibilityColumnRange;
- (uint64_t)accessibilityCompareGeometry:()AXPrivCategory;
- (uint64_t)accessibilityContainerElements;
- (uint64_t)accessibilityContentForLineNumber:()AXPrivCategory;
- (uint64_t)accessibilityCustomAttribute:()AXPrivCategory;
- (uint64_t)accessibilityDatetimeValue;
- (uint64_t)accessibilityEditOperationAction:()AXPrivCategory;
- (uint64_t)accessibilityElementIsFocused;
- (uint64_t)accessibilityErrorMessageElements;
- (uint64_t)accessibilityExpandedTextValue;
- (uint64_t)accessibilityFlowToElements;
- (uint64_t)accessibilityHasPopup;
- (uint64_t)accessibilityHeaderElements;
- (uint64_t)accessibilityHitTest:()AXPrivCategory;
- (uint64_t)accessibilityImageOverlayElements;
- (uint64_t)accessibilityInvalidStatus;
- (uint64_t)accessibilityIsAttachmentElement;
- (uint64_t)accessibilityIsComboBox;
- (uint64_t)accessibilityIsDeletion;
- (uint64_t)accessibilityIsFirstItemInSuggestion;
- (uint64_t)accessibilityIsInDescriptionListDefinition;
- (uint64_t)accessibilityIsInDescriptionListTerm;
- (uint64_t)accessibilityIsInNonNativeTextControl;
- (uint64_t)accessibilityIsInsertion;
- (uint64_t)accessibilityIsLastItemInSuggestion;
- (uint64_t)accessibilityIsMarkAnnotation;
- (uint64_t)accessibilityIsMediaPlaying;
- (uint64_t)accessibilityIsWindow;
- (uint64_t)accessibilityLineNumberForPoint:()AXPrivCategory;
- (uint64_t)accessibilityLinkRelationshipType;
- (uint64_t)accessibilityLinkedElement;
- (uint64_t)accessibilityMathMLSource;
- (uint64_t)accessibilityMenuActions;
- (uint64_t)accessibilityPageContent;
- (uint64_t)accessibilityParentDiscardsChildrenContainerGroupingBehavior;
- (uint64_t)accessibilityPerformCustomAction:()AXPrivCategory;
- (uint64_t)accessibilityPlaceholderValue;
- (uint64_t)accessibilityPopupValue;
- (uint64_t)accessibilityRequired;
- (uint64_t)accessibilityRowCount;
- (uint64_t)accessibilityRowRange;
- (uint64_t)accessibilityScrollDownPage;
- (uint64_t)accessibilityScrollDownPageSupported;
- (uint64_t)accessibilityScrollLeftPage;
- (uint64_t)accessibilityScrollLeftPageSupported;
- (uint64_t)accessibilityScrollRightPage;
- (uint64_t)accessibilityScrollRightPageSupported;
- (uint64_t)accessibilityScrollToTopSupported;
- (uint64_t)accessibilityScrollUpPage;
- (uint64_t)accessibilityScrollUpPageSupported;
- (uint64_t)accessibilitySecondaryLabel;
- (uint64_t)accessibilitySemanticGroupChildrentCount;
- (uint64_t)accessibilitySetUserDefinedOpaqueElementScrollsContentIntoView:()AXPrivCategory;
- (uint64_t)accessibilitySpeechHint;
- (uint64_t)accessibilityStartStopToggle;
- (uint64_t)accessibilitySupportsTextSelection;
- (uint64_t)accessibilityTitleElement;
- (uint64_t)accessibilityURL;
- (uint64_t)accessibilityUserDefinedIsMainWindow;
- (uint64_t)accessibilityUserDefinedNotFirstElement;
- (uint64_t)accessibilityUserDefinedServesAsFirstElement;
- (uint64_t)accessibilityUserDefinedSize;
- (uint64_t)accessibilityUserDefinedWindowVisible;
- (uint64_t)accessibilityVisibleText;
- (uint64_t)accessibilityZoomInAtPoint:()AXPrivCategory;
- (uint64_t)accessibilityZoomOutAtPoint:()AXPrivCategory;
- (uint64_t)axContainerTypeFromUIKitContainerType:()AXPrivCategory;
- (uint64_t)beaxContainerTypeFromUIKitContainerType:()AXPrivCategory;
- (uint64_t)impOrNullForSelector:()AXPrivCategory;
- (uint64_t)isAccessibilityOpaqueElementProvider;
- (uint64_t)isAccessibilityUserDefinedScrollAncestor;
- (uint64_t)setIsAccessibilityOpaqueElementProvider:()AXPrivCategory;
- (void)_accessibilityAddAutoCorrectionAttributes:()AXPrivCategory;
- (void)_accessibilityAddMispellingsToAttributedString:()AXPrivCategory;
- (void)_accessibilityAnnouncementComplete:()AXPrivCategory;
- (void)_accessibilityBaseScrollToVisible;
- (void)_accessibilityChildrenForContinuityDisplay;
- (void)_accessibilityConvertStyleAttributesToAccessibility:()AXPrivCategory;
- (void)_accessibilityDetectAnimationsNonActive;
- (void)_accessibilityHandleATFocused:()AXPrivCategory assistiveTech:;
- (void)_accessibilityHideKeyboard;
- (void)_accessibilityIgnoreNextPostPasteboardTextOperation:()AXPrivCategory;
- (void)_accessibilityInsertText:()AXPrivCategory;
- (void)_accessibilityInsertText:()AXPrivCategory atPosition:;
- (void)_accessibilityIsSpeakThisElement;
- (void)_accessibilityIterateScrollParentsUsingBlock:()AXPrivCategory includeSelf:;
- (void)_accessibilityOpaqueElementScrollToDirection:()AXPrivCategory;
- (void)_accessibilityPlaySystemSound:()AXPrivCategory;
- (void)_accessibilityPostAnnouncement:()AXPrivCategory;
- (void)_accessibilityPostNotificationHelper:()AXPrivCategory;
- (void)_accessibilityPostPasteboardTextForOperation:()AXPrivCategory associatedObject:;
- (void)_accessibilityPostValueChangedNotificationWithChangeType:()AXPrivCategory insertedText:keyInputDelegate:;
- (void)_accessibilityReplaceCharactersAtCursor:()AXPrivCategory withString:;
- (void)_accessibilityScrollOpaqueElementIntoView:()AXPrivCategory previousScroller:;
- (void)_accessibilitySendPageScrollFailedIfNecessary;
- (void)_accessibilitySetAllowedGeometryOverlap:()AXPrivCategory;
- (void)_accessibilitySetAllowedPagingOverlap:()AXPrivCategory;
- (void)_accessibilitySetAnimationsInProgress:()AXPrivCategory;
- (void)_accessibilitySetAuditIssueDict:()AXPrivCategory;
- (void)_accessibilitySetCameraIrisOpen:()AXPrivCategory;
- (void)_accessibilitySetFKAShouldProcessChildren:()AXPrivCategory;
- (void)_accessibilitySetIncreaseLayoutBounds:()AXPrivCategory;
- (void)_accessibilitySetIsSortPriorityContainer:()AXPrivCategory;
- (void)_accessibilitySetIsSpeakThisElement:()AXPrivCategory;
- (void)_accessibilitySetIsTourGuideRunning:()AXPrivCategory;
- (void)_accessibilitySetObscuredScreenAllowedViews:()AXPrivCategory;
- (void)_accessibilitySetOpaqueElementScrollsContentIntoView:()AXPrivCategory;
- (void)_accessibilitySetRowRange:()AXPrivCategory;
- (void)_accessibilitySetScrollAcrossPageBoundaries:()AXPrivCategory;
- (void)_accessibilitySetScrollingEnabled:()AXPrivCategory;
- (void)_accessibilitySetSelectedTextRange:()AXPrivCategory;
- (void)_accessibilitySetShouldIncludeRowRangeInElementDescription:()AXPrivCategory;
- (void)_accessibilitySetSortPriority:()AXPrivCategory;
- (void)_accessibilitySetStoredChartDescriptor:()AXPrivCategory;
- (void)_accessibilitySetTextViewShouldBreakUpParagraphs:()AXPrivCategory;
- (void)_accessibilitySetValue:()AXPrivCategory;
- (void)_accessibilitySetVoiceOverRTLOverride:()AXPrivCategory;
- (void)_accessibilityShowKeyboard;
- (void)_accessibilityStatusBar;
- (void)_accessibilityUnregister;
- (void)_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:()AXPrivCategory;
- (void)_addPublicRotorsToArray:()AXPrivCategory forElement:;
- (void)_fkaMoveDown;
- (void)_fkaMoveLeft;
- (void)_fkaMoveRight;
- (void)_fkaMoveUp;
- (void)_iosAccessibilitySetValue:()AXPrivCategory forAttribute:;
- (void)_setAccessibilityGuideElementHeaderText:()AXPrivCategory;
- (void)_setAccessibilityIsMainWindow:()AXPrivCategory;
- (void)_setAccessibilityIsNotFirstElement:()AXPrivCategory;
- (void)_setAccessibilityLinkedUIElements:()AXPrivCategory;
- (void)_setAccessibilityPhotoDescription:()AXPrivCategory;
- (void)_setAccessibilityServesAsFirstElement:()AXPrivCategory;
- (void)_setAccessibilityShouldUseViewHierarchyForFindingScrollParent:()AXPrivCategory;
- (void)_setAccessibilityWindowVisible:()AXPrivCategory;
- (void)accessibilityDecreaseTrackingDetail;
- (void)accessibilityEnumerateAncestorsUsingBlock:()AXPrivCategory;
- (void)accessibilityEnumerateContainerElementsUsingBlock:()AXPrivCategory;
- (void)accessibilityEnumerateContainerElementsWithOptions:()AXPrivCategory usingBlock:;
- (void)accessibilityIncreaseTrackingDetail;
- (void)accessibilityPostNotification:()AXPrivCategory withObject:afterDelay:;
- (void)setAccessibilityCustomContent:()AXPrivCategory;
- (void)setAccessibilitySize:()AXPrivCategory;
- (void)setIsAccessibilityScrollAncestor:()AXPrivCategory;
@end

@implementation NSObject(AXPrivCategory)

- (uint64_t)_accessibilitySetContextDrawingAnnotations:()AXPrivCategory
{
  return [a1 _accessibilitySetValue:a3 forKey:@"AXContextDrawingAnnotations" storageMode:0];
}

- (id)_accessibilityViewAncestorIsKindOf:()AXPrivCategory
{
  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = a1;
    if (v4)
    {
      do
      {
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v5 = [v4 superview];

        id v4 = (id)v5;
      }
      while (v5);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_accessibilityUnregister
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    _UIAccessibilityCompleteUnregistration(a1);
    _UIAXCleanupRotorCache(a1);
  }
  else
  {
    AXPerformBlockAsynchronouslyOnMainThread();
  }
}

- (void)_accessibilitySetAnimationsInProgress:()AXPrivCategory
{
  char v3 = a3;
  if ((a3 & 1) != 0 || _AXAnimationsInProgressCount >= 1)
  {
    if (a3)
    {
      atomic_fetch_add_explicit(&_AXAnimationsInProgressCount, 1u, memory_order_relaxed);
    }
    else if (atomic_fetch_add_explicit(&_AXAnimationsInProgressCount, 0xFFFFFFFF, memory_order_relaxed) == 1 {
           && _AXAnimationsCompletedShouldNotify == 1)
    }
    {
      _AXAnimationsCompletedShouldNotify = 0;
      UIAccessibilityPostNotification(0xFA2u, &unk_1EF171D40);
    }
  }
  id v4 = AXLogUIA();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(AXPrivCategory) _accessibilitySetAnimationsInProgress:](v3, v4);
  }
}

- (id)_accessibilityWindow
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = a1;
  }
  else
  {
    char v3 = [a1 _accessibilityParentView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
    }
    else
    {
      id v4 = [v3 window];
    }
    id v2 = v4;
    if (v3 == a1 && !v4)
    {
      uint64_t v5 = [a1 accessibilityContainer];
      if (v5)
      {
        do
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          uint64_t v6 = [v5 accessibilityContainer];

          uint64_t v5 = (void *)v6;
        }
        while (v6);
      }
      v7 = [v5 _accessibilityParentView];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = v7;
      }
      else
      {
        id v8 = [v7 window];
      }
      id v2 = v8;
    }
  }

  return v2;
}

- (id)_accessibilityAncestorIsKindOf:()AXPrivCategory
{
  if (a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__NSObject_AXPrivCategory___accessibilityAncestorIsKindOf___block_invoke;
    v6[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v6[4] = a3;
    id v4 = [a1 _accessibilityFindAncestor:v6 startWithSelf:0];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_accessibilityFindAncestor:()AXPrivCategory startWithSelf:findTopmostAncestor:
{
  id v8 = a3;
  if (a4)
  {
    id v9 = a1;
  }
  else
  {
    id v9 = [a1 accessibilityContainer];
  }
  v10 = v9;
  if (v9)
  {
    v11 = 0;
    do
    {
      if (v8[2](v8, v10))
      {
        id v12 = v10;

        v11 = v12;
        if (!a5) {
          break;
        }
      }
      id v12 = [v10 accessibilityContainer];

      v10 = v12;
    }
    while (v12);
  }
  else
  {
    id v12 = 0;
    v11 = 0;
  }

  return v11;
}

- (uint64_t)_accessibilityFindAncestor:()AXPrivCategory startWithSelf:
{
  return [a1 _accessibilityFindAncestor:a3 startWithSelf:a4 findTopmostAncestor:0];
}

- (id)_accessibilityParentView
{
  objc_opt_class();
  id v2 = a1;
  do
  {
    if (objc_opt_isKindOfClass()) {
      break;
    }
    uint64_t v3 = [v2 accessibilityContainer];

    id v2 = (id)v3;
  }
  while (v3);

  return v2;
}

- (uint64_t)_accessibilityContextDrawingAnnotations
{
  return [a1 _accessibilityValueForKey:@"AXContextDrawingAnnotations"];
}

- (void)_accessibilitySetIsSpeakThisElement:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilityRawSetIsSpeakThisElement:v2];
}

- (uint64_t)_accessibilityRawSetIsSpeakThisElement:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)accessibilityHitTest:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilitySecondaryActivate
{
  return 0;
}

- (uint64_t)accessibilityStartStopToggle
{
  return 0;
}

- (uint64_t)_accessibilityHitTestReverseOrder
{
  return 0;
}

- (uint64_t)_accessibilityFuzzyHitTestElements
{
  return 0;
}

- (uint64_t)_accessibilityHitTestShouldFallbackToNearestChild
{
  return [a1 _accessibilityBoolValueForKey:@"UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild"];
}

- (uint64_t)_accessibilitySetShouldHitTestFallBackToNearestChild:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild"];
}

- (id)_accessibilityHitTest:()AXPrivCategory withEvent:
{
  id v8 = a5;
  if (([a1 _accessibilityBoolValueForKey:@"AXInHitTestOverride"] & 1) != 0
    || !__60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke())
  {
    id v9 = objc_msgSend(a1, "_accessibilityBaseHitTest:withEvent:", v8, a2, a3);
  }
  else
  {
    [a1 _accessibilitySetBoolValue:1 forKey:@"AXInHitTestOverride"];
    id v9 = objc_msgSend(a1, "accessibilityHitTest:withEvent:", v8, a2, a3);
    [a1 _accessibilitySetBoolValue:0 forKey:@"AXInHitTestOverride"];
  }

  return v9;
}

- (uint64_t)_axAdditionalElementHitTestingInProgress
{
  return MEMORY[0x1F4106398](a1, &__NSObject___axAdditionalElementHitTestingInProgress);
}

- (uint64_t)_axSetAdditionalElementHitTestingInProgress:()AXPrivCategory
{
  return MEMORY[0x1F41063D0](a1, &__NSObject___axAdditionalElementHitTestingInProgress);
}

- (id)_accessibilityHitTestAdditionalElements:()AXPrivCategory event:
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([a1 _axAdditionalElementHitTestingInProgress])
  {
    id v9 = 0;
    goto LABEL_23;
  }
  [a1 _axSetAdditionalElementHitTestingInProgress:1];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v10 = [a1 _accessibilityAdditionalElements];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (!v11) {
    goto LABEL_19;
  }
  uint64_t v12 = v11;
  v44 = a1;
  id v9 = 0;
  uint64_t v13 = *(void *)v46;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v46 != v13) {
        objc_enumerationMutation(v10);
      }
      v15 = objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "_accessibilityHitTest:withEvent:", v8, a2, a3);
      v16 = v15;
      if (v15)
      {
        if (v9)
        {
          [v15 accessibilityFrame];
          [v9 accessibilityFrame];
          v17 = [MEMORY[0x1E4F42D90] mainScreen];
          UIRoundToScreenScale();
          double v19 = v18;
          v20 = [MEMORY[0x1E4F42D90] mainScreen];
          UIRoundToScreenScale();
          double v22 = v19 * v21;

          v23 = [MEMORY[0x1E4F42D90] mainScreen];
          UIRoundToScreenScale();
          double v25 = v24;
          v26 = [MEMORY[0x1E4F42D90] mainScreen];
          UIRoundToScreenScale();
          double v28 = v25 * v27;

          if (v22 < v28)
          {
            id v29 = v16;

            id v9 = v29;
          }
        }
        else
        {
          id v9 = v15;
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v45 objects:v49 count:16];
  }
  while (v12);

  if (!v9)
  {
    a1 = v44;
    goto LABEL_22;
  }
  a1 = v44;
  v30 = objc_msgSend(v44, "_accessibilityHitTest:withEvent:", v8, a2, a3);
  v10 = v30;
  if (v30)
  {
    [v30 accessibilityFrame];
    [v9 accessibilityFrame];
    v31 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    double v33 = v32;
    v34 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    double v36 = v33 * v35;

    v37 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    double v39 = v38;
    v40 = [MEMORY[0x1E4F42D90] mainScreen];
    UIRoundToScreenScale();
    double v42 = v39 * v41;

    if (v36 < v42)
    {

LABEL_19:
      id v9 = 0;
    }
  }

LABEL_22:
  [a1 _axSetAdditionalElementHitTestingInProgress:0];
LABEL_23:

  return v9;
}

- (id)_accessibilityHitTestSupplementaryViews:()AXPrivCategory event:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = [a1 _accessibilitySupplementaryHeaderViews];
  v10 = [a1 _accessibilitySupplementaryFooterViews];
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  if ([v9 count]) {
    [v11 addObjectsFromArray:v9];
  }
  if ([v10 count]) {
    [v11 addObjectsFromArray:v10];
  }
  uint64_t v12 = [a1 _accessibilityParentView];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        double v20 = a3;
        double v21 = a2;
        if (isKindOfClass) {
          objc_msgSend(v18, "convertPoint:fromView:", v12, a2, a3, (void)v25);
        }
        uint64_t v22 = objc_msgSend(v18, "_accessibilityHitTest:withEvent:", v8, v21, v20, (void)v25);
        if (v22)
        {
          v23 = (void *)v22;
          goto LABEL_17;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }
  v23 = 0;
LABEL_17:

  return v23;
}

- (id)_accessibilityHitTestSupplementaryViews:()AXPrivCategory point:withEvent:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (![v10 count])
  {
    id v37 = 0;
    goto LABEL_38;
  }
  uint64_t v12 = [a1 _accessibilityParentView];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (!v14)
  {
    id v37 = 0;
    goto LABEL_37;
  }
  uint64_t v15 = v14;
  id v39 = v10;
  v40 = a1;
  uint64_t v16 = *(void *)v48;
  id v41 = v13;
  double v42 = v12;
  while (2)
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v48 != v16) {
        objc_enumerationMutation(v13);
      }
      double v18 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
      double v20 = a3;
      double v21 = a2;
      if (isKindOfClass) {
        objc_msgSend(v18, "convertPoint:fromView:", v12, a2, a3);
      }
      uint64_t v22 = objc_msgSend(v18, "_accessibilityHitTest:withEvent:", v11, v21, v20, v39);
      v23 = v22;
      if (v22 && ([v22 isAccessibilityElement] & 1) != 0) {
        goto LABEL_35;
      }

      if ((isKindOfClass & [a1 _accessibilityHitTestShouldFallbackToNearestChild]) == 1
        && ([v11 _accessibilityAutomationHitTest] & 1) == 0)
      {
        objc_msgSend(v18, "convertPoint:fromView:", v12, a2, a3);
        if (objc_msgSend(v18, "pointInside:withEvent:", v11))
        {
          UIAccessibilityPointForPoint(v12, a2, a3);
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          double v24 = [v18 _accessibleSubviews:1];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            long long v27 = 0;
            uint64_t v28 = *(void *)v44;
            double v29 = 1.79769313e308;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v44 != v28) {
                  objc_enumerationMutation(v24);
                }
                v31 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                [v31 accessibilityActivationPoint];
                AX_CGPointGetDistanceToPoint();
                if (v32 < v29)
                {
                  double v33 = v32;
                  id v34 = v31;

                  long long v27 = v34;
                  double v29 = v33;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
            }
            while (v26);
          }
          else
          {
            long long v27 = 0;
          }

          id v35 = v27;
          id v13 = v41;
          uint64_t v12 = v42;
          a1 = v40;
          if (v35)
          {
            v23 = v35;
            if ([v35 isAccessibilityElement])
            {
            }
            else
            {
              uint64_t v36 = [v23 accessibilityElementAtIndex:0];

              if (!v36) {
                continue;
              }
              v23 = (void *)v36;
            }
LABEL_35:
            id v37 = v23;

            goto LABEL_36;
          }
        }
      }
    }
    uint64_t v15 = [v13 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v15) {
      continue;
    }
    break;
  }
  id v37 = 0;
LABEL_36:
  id v10 = v39;
LABEL_37:

LABEL_38:

  return v37;
}

- (uint64_t)_accessibilityAllowOutOfBoundsHitTestAtPoint:()AXPrivCategory withEvent:
{
  id v4 = [a3 _accessibilityHitTestOptions];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[UIAccessibilityHitTestOptions defaultOptions];
  }
  v7 = v6;

  id v8 = [v7 outOfBoundsHitTestElements];
  uint64_t v9 = [v8 containsObject:a1];

  return v9;
}

- (id)_accessibilityBaseHitTest:()AXPrivCategory withEvent:
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = AXLogUIA();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v133.x = a2;
    v133.y = a3;
    NSStringFromCGPoint(v133);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v128 = a1;
    __int16 v129 = 2112;
    id v130 = v10;
    _os_log_impl(&dword_19F2DB000, v9, OS_LOG_TYPE_INFO, "In base hit test for %@ with point %@", buf, 0x16u);
  }
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    if ([a1 _accessibilityIsFrameOutOfBounds])
    {
      id v12 = 0;
      goto LABEL_142;
    }
    int v13 = objc_msgSend(a1, "pointInside:withEvent:", v8, a2, a3);
  }
  else
  {
    int v13 = 0;
  }
  [a1 accessibilityFrame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  uint64_t v22 = [a1 _accessibilityParentView];
  objc_msgSend(v22, "convertPoint:toView:", 0, a2, a3);
  double v24 = v23;
  double v26 = v25;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v27 = v22;
  }
  else
  {
    id v27 = [v22 window];
  }
  objc_msgSend(v27, "convertPoint:toWindow:", 0, v24, v26);
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  if ((isKindOfClass | v13))
  {
    if (v13) {
      goto LABEL_19;
    }
  }
  else
  {
    double v32 = [a1 accessibilityPath];
    if (v32)
    {
      id v33 = v32;
      id v34 = (const CGPath *)[v33 CGPath];
      v134.x = v29;
      v134.y = v31;
      BOOL v35 = CGPathContainsPoint(v34, 0, v134, 0);

      if (v35) {
        goto LABEL_19;
      }
    }
    else
    {
      v139.origin.x = v15;
      v139.origin.y = v17;
      v139.size.width = v19;
      v139.size.height = v21;
      v136.x = v29;
      v136.y = v31;
      if (CGRectContainsPoint(v139, v136)) {
        goto LABEL_19;
      }
    }
  }
  if (!objc_msgSend(a1, "_accessibilityAllowOutOfBoundsHitTestAtPoint:withEvent:", v8, a2, a3))
  {
    id v12 = 0;
    goto LABEL_141;
  }
LABEL_19:
  if (_AXSAutomationEnabled()) {
    int v36 = [v8 _accessibilityAutomationHitTest];
  }
  else {
    int v36 = 0;
  }
  id v37 = [v8 _accessibilityHitTestOptions];
  double v38 = v37;
  if (v37)
  {
    id v39 = v37;
  }
  else
  {
    id v39 = +[UIAccessibilityHitTestOptions defaultOptions];
  }
  if ((v36 & 1) == 0)
  {
    v40 = [v39 leafNodePredicate];
    int v41 = ((uint64_t (**)(void, void *))v40)[2](v40, a1);

    if (v41)
    {
      id v12 = a1;
      goto LABEL_140;
    }
  }
  double v42 = [a1 _accessibilitySupplementaryHeaderViews];
  long long v43 = objc_msgSend(a1, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v42, v8, a2, a3);

  if (v43)
  {
    id v44 = v43;
    id v12 = v44;
    goto LABEL_139;
  }
  int v100 = v36;
  if (v36
    && ([a1 automationElements],
        id v45 = (id)objc_claimAutoreleasedReturnValue(),
        v45,
        v45)
    || ([a1 _accessibilityFuzzyHitTestElements], (id v45 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || ([a1 _accessibilityElements], (id v45 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v46 = [v45 count];
  }
  else
  {
    uint64_t v46 = [a1 accessibilityElementCount];
  }
  uint64_t v47 = v46;
  if (!v46)
  {
    if ([v39 shouldHitTestUserTestingChildren])
    {
      long long v48 = [a1 automationElements];

      uint64_t v47 = [v48 count];
      id v45 = v48;
    }
    else
    {
      uint64_t v47 = 0;
    }
  }
  if ([a1 _accessibilityHitTestShouldFallbackToNearestChild]) {
    int v104 = [v8 _accessibilityAutomationHitTest] ^ 1;
  }
  else {
    int v104 = 0;
  }
  id v108 = v45;
  uint64_t v109 = v47;
  v103 = v39;
  if ((![v8 _accessibilityAutomationHitTest]
     || ([a1 _accessibilityAutomationHitTestReverseOrder] & 1) == 0)
    && ![a1 _accessibilityHitTestReverseOrder])
  {
    if (v47 > 0)
    {
      double v95 = v19;
      double v96 = v17;
      double v97 = v15;
      id v98 = v27;
      v99 = v22;
      uint64_t v49 = 0;
      int v107 = 0;
      uint64_t v106 = 1;
      goto LABEL_50;
    }
LABEL_106:
    id v50 = 0;
    goto LABEL_109;
  }
  if (v47 <= 0) {
    goto LABEL_106;
  }
  double v95 = v19;
  double v96 = v17;
  double v97 = v15;
  id v98 = v27;
  v99 = v22;
  uint64_t v49 = v47 - 1;
  uint64_t v106 = -1;
  int v107 = 1;
LABEL_50:
  id v50 = 0;
  v51 = 0;
  double v52 = 1.79769313e308;
  id v101 = v8;
  v105 = a1;
  while (1)
  {
    if (v45) {
      [v45 objectAtIndex:v49];
    }
    else {
    id v53 = [a1 accessibilityElementAtIndex:v49];
    }

    if (!v53) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v53 alpha], v54 != 0.0)
      || ([v53 _accessibilityOverridesInvisibility] & 1) != 0)
    {
      v55 = [v53 accessibilityPath];
      v110 = v55;
      if (!v55) {
        goto LABEL_62;
      }
      v56 = (const CGPath *)[v55 CGPath];
      v135.x = v29;
      v135.y = v31;
      if (CGPathContainsPoint(v56, 0, v135, 0))
      {
        BOOL v57 = 1;
        goto LABEL_67;
      }
      if (![v8 _accessibilityAutomationHitTest])
      {
LABEL_65:
        BOOL v57 = 0;
      }
      else
      {
LABEL_62:
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          [v53 frame];
          if (CGRectIsEmpty(v140)) {
            goto LABEL_65;
          }
          objc_msgSend(a1, "convertPoint:toView:", v53, a2, a3);
          v83 = objc_msgSend(v53, "_accessibilityHitTest:withEvent:", v8);
          BOOL v57 = v83 != 0;
        }
        else
        {
          [v53 accessibilityFrame];
          v137.x = v29;
          v137.y = v31;
          BOOL v57 = CGRectContainsPoint(v141, v137);
        }
      }
LABEL_67:
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke;
      aBlock[3] = &unk_1E59B8EE0;
      aBlock[4] = a1;
      id v58 = v53;
      id v123 = v58;
      CGFloat v124 = v29;
      CGFloat v125 = v31;
      v59 = _Block_copy(aBlock);
      v117[0] = MEMORY[0x1E4F143A8];
      v117[1] = 3221225472;
      v117[2] = __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke_2;
      v117[3] = &unk_1E59B8F08;
      CGFloat v120 = a2;
      CGFloat v121 = a3;
      id v60 = v59;
      id v119 = v60;
      id v61 = v8;
      id v118 = v61;
      v62 = (void (**)(void *, id))_Block_copy(v117);
      if (v57)
      {
        v63 = [v103 leafNodePredicate];
        char v64 = ((uint64_t (**)(void, id))v63)[2](v63, v58);

        if (v64)
        {
          (*((void (**)(id, id, CGFloat, CGFloat))v60 + 2))(v60, v58, a2, a3);
          v65 = objc_msgSend(v58, "_accessibilityHitTestSupplementaryViews:event:", v61);
          if ([v65 isAccessibilityElement]) {
            v66 = v65;
          }
          else {
            v66 = v58;
          }
          id v67 = v66;

          if (v100)
          {
            v68 = v62[2](v62, v58);
            if ([v68 isAccessibilityElement])
            {
              id v69 = v68;

              id v67 = v69;
            }
          }
        }
        else
        {
          v62[2](v62, v58);
          id v67 = (id)objc_claimAutoreleasedReturnValue();
          v65 = v51;
        }

        if (v67)
        {
          int v70 = 0;
          goto LABEL_97;
        }
      }
      else
      {
        id v67 = v51;
      }
      if (v104)
      {
        v71 = [MEMORY[0x1E4F1CA48] array];
        if ([v58 isAccessibilityElement])
        {
          [v71 addObject:v58];
        }
        else if ([v58 _accessibilityHasOrderedChildren])
        {
          v115[0] = MEMORY[0x1E4F143A8];
          v115[1] = 3221225472;
          v115[2] = __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke_3;
          v115[3] = &unk_1E59B8F30;
          id v116 = v71;
          [v58 accessibilityEnumerateContainerElementsUsingBlock:v115];
        }
        id v102 = v67;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v111 = 0u;
        long long v112 = 0u;
        id v72 = v71;
        uint64_t v73 = [v72 countByEnumeratingWithState:&v111 objects:v126 count:16];
        if (v73)
        {
          uint64_t v74 = v73;
          uint64_t v75 = *(void *)v112;
          do
          {
            for (uint64_t i = 0; i != v74; ++i)
            {
              if (*(void *)v112 != v75) {
                objc_enumerationMutation(v72);
              }
              v77 = *(void **)(*((void *)&v111 + 1) + 8 * i);
              [v77 accessibilityActivationPoint];
              AX_CGPointGetDistanceToPoint();
              if (v78 < v52)
              {
                double v79 = v78;
                id v80 = v77;

                id v50 = v80;
                double v52 = v79;
              }
            }
            uint64_t v74 = [v72 countByEnumeratingWithState:&v111 objects:v126 count:16];
          }
          while (v74);
        }

        int v70 = 1;
        id v8 = v101;
        id v67 = v102;
      }
      else
      {
        int v70 = 1;
      }
LABEL_97:

      v51 = v67;
      a1 = v105;
      id v45 = v108;
      if (!v70) {
        goto LABEL_108;
      }
      goto LABEL_98;
    }

    id v67 = v51;
LABEL_98:
    BOOL v81 = __OFADD__(v49, v106);
    v49 += v106;
    BOOL v82 = v49 < 0 == v81;
    if (!v107) {
      BOOL v82 = v49 < v109;
    }
    if (!v82) {
      goto LABEL_108;
    }
  }
  id v67 = v51;
LABEL_108:
  id v27 = v98;
  uint64_t v22 = v99;
  CGFloat v17 = v96;
  CGFloat v15 = v97;
  CGFloat v19 = v95;
  if (v67) {
    goto LABEL_134;
  }
LABEL_109:
  v84 = [a1 _accessibilitySupplementaryFooterViews];
  objc_msgSend(a1, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v84, v8, a2, a3);
  id v67 = (id)objc_claimAutoreleasedReturnValue();

  if (v67) {
    int v85 = 0;
  }
  else {
    int v85 = v104;
  }
  if (v85 == 1 && v50)
  {
    id v50 = v50;
    id v67 = v50;
    goto LABEL_134;
  }
  if (v67 || v109 < 1)
  {
    if (!v67) {
      goto LABEL_124;
    }
    goto LABEL_134;
  }
  v142.origin.x = v15;
  v142.origin.y = v17;
  v142.size.width = v19;
  v142.size.height = v21;
  v138.x = v29;
  v138.y = v31;
  if (CGRectContainsPoint(v142, v138))
  {
    v86 = [v103 fallbackPredicate];
    char v87 = ((uint64_t (**)(void, void *))v86)[2](v86, a1);

    id v67 = 0;
    if (v87) {
      goto LABEL_138;
    }
  }
  else
  {
    id v67 = 0;
  }
LABEL_124:
  if ([a1 _accessibilityIsRemoteElement])
  {
    int v88 = [a1 _accessibilityShouldHitTestRemoteElementProcess];
    v89 = AXLogUIA();
    BOOL v90 = os_log_type_enabled(v89, OS_LOG_TYPE_INFO);
    if (v88)
    {
      if (v90)
      {
        *(_DWORD *)buf = 138412290;
        id v128 = 0;
        _os_log_impl(&dword_19F2DB000, v89, OS_LOG_TYPE_INFO, "Will attempt to hit test remote process %@", buf, 0xCu);
      }
      goto LABEL_137;
    }
    if (v90)
    {
      *(_DWORD *)buf = 138412290;
      id v128 = 0;
      _os_log_impl(&dword_19F2DB000, v89, OS_LOG_TYPE_INFO, "Not returning remote element for hit-testing %@", buf, 0xCu);
    }

    id v45 = v108;
  }
  if (!v100
    || ([a1 isAccessibilityElement] & 1) == 0
    && ([v103 leafNodePredicate],
        v91 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
        char v92 = ((uint64_t (**)(void, void *))v91)[2](v91, a1),
        v91,
        (v92 & 1) == 0))
  {
LABEL_134:
    v89 = AXLogUIA();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      UIAXMassageElementDescription(v67);
      id v93 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      id v128 = v93;
      _os_log_impl(&dword_19F2DB000, v89, OS_LOG_TYPE_INFO, "Base hit test returning %@", buf, 0xCu);
    }
    a1 = v67;
LABEL_137:

    id v45 = v108;
  }
LABEL_138:
  id v12 = a1;

  id v44 = v67;
  id v39 = v103;
LABEL_139:

LABEL_140:
LABEL_141:

LABEL_142:

  return v12;
}

- (uint64_t)_accessibilitySelfFoundByHitTesting
{
  [a1 accessibilityFrame];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v15);
  id v8 = [a1 safeValueForKey:@"window"];
  EventForSceneReferencePoint = (void *)UIAccessibilityCreateEventForSceneReferencePoint(0, MidX, MidY);
  id v10 = objc_msgSend(v8, "_accessibilityHitTest:withEvent:", EventForSceneReferencePoint, MidX, MidY);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v10)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (objc_opt_respondsToSelector()) {
        [v10 performSelector:sel_realTableViewCell];
      }
      else {
      uint64_t v11 = [v10 accessibilityContainer];
      }

      id v10 = (void *)v11;
    }
    while (v11);
  }
  if (v10 == a1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = [v10 _accessibilityIsDescendantOfElement:a1];
  }

  return v12;
}

- (uint64_t)_accessibilityEncodedHierarchyData
{
  return [a1 _accessibilityValueForKey:@"_accessibilityEncodedHierarchyData"];
}

- (uint64_t)_setAccessibilityEncodedHierarchyData:()AXPrivCategory
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"_accessibilityEncodedHierarchyData"];
}

- (uint64_t)_accessibilityWindowVisible
{
  v1 = [a1 accessibilityUserDefinedWindowVisible];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_setAccessibilityWindowVisible:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"_AX_WindowVisible"];
}

- (uint64_t)_accessibilityIsMainWindow
{
  v1 = [a1 accessibilityUserDefinedIsMainWindow];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)_accessibilityCanBeConsideredAsMainWindow
{
  return [a1 _accessibilityIsIsolatedWindow] ^ 1;
}

- (void)_setAccessibilityIsMainWindow:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"_AX_WindowIsMain"];
}

- (uint64_t)_accessibilityTextInputElement
{
  return 0;
}

- (uint64_t)_accessibilityTextInputElementRange
{
  return 0;
}

- (uint64_t)_accessibilityTextInputElementRangeAsNSRange
{
  id v2 = [a1 _accessibilityTextInputElementRange];
  if (v2)
  {
    uint64_t v3 = [a1 _accessibilityTextInputElement];
    uint64_t v4 = [v3 _accessibilityRawRangeForUITextRange:v2];
  }
  else
  {
    uint64_t v4 = 0x7FFFFFFFLL;
  }

  return v4;
}

- (uint64_t)_accessibilityTextRangeFromNSRange:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityRawRangeForUITextRange:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityIgnoresStatusBarFrame
{
  return 0;
}

- (uint64_t)_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren
{
  return 0;
}

- (uint64_t)_accessibilityRemoteElementShouldHitTestHostProcess
{
  uint64_t v1 = [a1 _accessibilityGetBlockForAttribute:5009];
  id v2 = (void *)v1;
  if (v1) {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityShouldHitTestRemoteElementProcess
{
  return 0;
}

- (uint64_t)accessibilityScrollUpPage
{
  return 0;
}

- (uint64_t)accessibilityScrollDownPage
{
  return 0;
}

- (uint64_t)accessibilityScrollRightPage
{
  return 0;
}

- (uint64_t)accessibilityScrollLeftPage
{
  return 0;
}

- (uint64_t)_accessibilityPageCount
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityPageIndex
{
  return 0x7FFFFFFFLL;
}

- (id)_accessibilityUserDefinedScrollingEnabled
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityUserDefinedScrollingEnabled);
}

- (uint64_t)_accessibilitySetUserDefinedScrollingEnabled:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilitySetScrollingEnabled:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetUserDefinedScrollingEnabled:v2];
}

- (uint64_t)_accessibilityScrollingEnabled
{
  uint64_t v1 = [a1 _accessibilityUserDefinedScrollingEnabled];
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (uint64_t)_accessibilityIsScrollAncestor
{
  return 0;
}

- (uint64_t)_accessibilityScrollToFrame:()AXPrivCategory forView:
{
  return 0;
}

- (uint64_t)accessibilityScrollLeftPageSupported
{
  return 1;
}

- (uint64_t)accessibilityScrollRightPageSupported
{
  return 1;
}

- (uint64_t)accessibilityScrollDownPageSupported
{
  return 1;
}

- (uint64_t)accessibilityScrollUpPageSupported
{
  return 1;
}

- (uint64_t)accessibilityScrollToTopSupported
{
  return 1;
}

- (void)_setAccessibilityShouldUseViewHierarchyForFindingScrollParent:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"_accessibilityShouldUseViewHierarchyForFindingScrollParent"];
}

- (uint64_t)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  uint64_t v1 = [a1 _accessibilityValueForKey:@"_accessibilityShouldUseViewHierarchyForFindingScrollParent"];
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityIsWebDocumentView
{
  return 0;
}

- (uint64_t)_accessibilitySupportsPressedState
{
  return 0;
}

- (BOOL)_accessibilityIsPressed
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v2 = [a1 safeValueForKey:@"_browserAccessibilityStoredValuePressedState"];

  if (!v2) {
    return 0;
  }
  if ([a1 safeIntegerForKey:@"browserAccessibilityPressedState"] == 2) {
    return 1;
  }
  return [a1 safeIntegerForKey:@"browserAccessibilityPressedState"] == 3;
}

- (uint64_t)accessibilityLinkRelationshipType
{
  return 0;
}

- (uint64_t)_accessibilityExpandedStatus
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [a1 safeIntegerForKey:@"accessibilityExpandedStatus"];
}

- (uint64_t)_accessibilityExpandedStatusTogglesOnActivate
{
  return 1;
}

- (uint64_t)_accessibilityRepresentsInfiniteCollection
{
  return 0;
}

- (id)_accessibilityFirstResponderForKeyWindow
{
  id v2 = [MEMORY[0x1E4F43058] _applicationKeyWindow];
  uint64_t v3 = [a1 _accessibilityFirstResponderForWindow:v2];

  return v3;
}

- (uint64_t)_accessibilityFirstResponderForWindow:()AXPrivCategory
{
  return [a3 safeValueForKey:@"firstResponder"];
}

- (id)_accessibilityResponderChainForWindow:()AXPrivCategory
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = [v3 firstResponder];
  if (v5)
  {
    id v6 = (void *)v5;
    do
    {
      [v4 addObject:v6];
      uint64_t v7 = [v6 nextResponder];

      id v6 = (void *)v7;
    }
    while (v7);
  }

  return v4;
}

- (id)_accessibilityResponderChainForKeyWindow
{
  id v2 = [MEMORY[0x1E4F43058] _applicationKeyWindow];
  id v3 = [a1 _accessibilityResponderChainForWindow:v2];

  return v3;
}

- (uint64_t)_accessibilityTextFieldText
{
  return 0;
}

- (uint64_t)_accessibilityIterateScrollParentsUsingBlock:()AXPrivCategory
{
  return [a1 _accessibilityIterateScrollParentsUsingBlock:a3 includeSelf:1];
}

- (void)_accessibilityIterateScrollParentsUsingBlock:()AXPrivCategory includeSelf:
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [a1 _accessibilityShouldUseViewHierarchyForFindingScrollParent];
    id v8 = a1;
    uint64_t v9 = v8;
    if (a4) {
      goto LABEL_9;
    }
    if (v7)
    {
      uint64_t v9 = [v8 superview];
      int v7 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    id v10 = a1;
    if (a4)
    {
      uint64_t v9 = v10;
      int v7 = 0;
      goto LABEL_9;
    }
  }
  uint64_t v9 = [a1 _accessibilityParentForFindingScrollParent];
  int v7 = 0;
LABEL_8:

  if (v9 == a1)
  {
    _AXAssert();
    goto LABEL_19;
  }
LABEL_9:
  char v13 = 0;
  if (v9)
  {
    while (1)
    {
      v6[2](v6, v9, &v13);
      id v11 = v9;
      uint64_t v12 = v11;
      if (v7) {
        [v11 superview];
      }
      else {
      uint64_t v9 = [v11 _accessibilityParentForFindingScrollParent];
      }

      if (v12 == v9) {
        break;
      }

      if (!v9 || v13) {
        goto LABEL_18;
      }
    }
    _AXAssert();

    uint64_t v9 = v12;
  }
LABEL_18:
  a1 = v9;
LABEL_19:
}

- (double)__accessibilityVisibleScrollArea:()AXPrivCategory
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x3010000000;
  id v10 = "";
  long long v11 = xmmword_19F349090;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__NSObject_AXPrivCategory____accessibilityVisibleScrollArea___block_invoke;
  v5[3] = &unk_1E59B8F58;
  char v6 = a3;
  v5[4] = &v7;
  [a1 _accessibilityIterateScrollParentsUsingBlock:v5];
  double v3 = v8[4];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (uint64_t)_accessibilityScrollAncestor
{
  return [a1 _accessibilityScrollAncestorForSelector:0];
}

- (void)setIsAccessibilityScrollAncestor:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"_AX_IsScrollAncestor"];
}

- (uint64_t)_accessibilityShouldSpeakScrollStatusOnEntry
{
  if (!_accessibilityShouldSpeakScrollStatusOnEntry_BaseNSObjectMethod)
  {
    id v2 = (objc_class *)objc_opt_class();
    _accessibilityShouldSpeakScrollStatusOnEntry_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel__accessibilityShouldSpeakScrollStatusOnEntry);
  }
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__NSObject_AXPrivCategory___accessibilityShouldSpeakScrollStatusOnEntry__block_invoke;
  v5[3] = &unk_1E59B8F80;
  v5[4] = &v6;
  void v5[5] = sel__accessibilityShouldSpeakScrollStatusOnEntry;
  [a1 _accessibilityIterateScrollParentsUsingBlock:v5 includeSelf:0];
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)_accessibilityElementVisibilityAffectsLayout
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__2;
  CGRect v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__NSObject_AXPrivCategory___accessibilityScrollStatus__block_invoke;
  v9[3] = &unk_1E59B8FA8;
  v9[4] = &v10;
  [a1 _accessibilityIterateScrollParentsUsingBlock:v9 includeSelf:0];
  id v2 = (void *)v11[5];
  if (!v2)
  {
    uint64_t v3 = [a1 _accessibilityScrollAncestor];
    uint64_t v4 = v3;
    if (v3 != a1)
    {
      uint64_t v5 = [v3 _accessibilityScrollStatus];
      uint64_t v6 = (void *)v11[5];
      v11[5] = v5;
    }
    id v2 = (void *)v11[5];
  }
  id v7 = v2;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (uint64_t)_accessibilityScrollAncestorForSelector:()AXPrivCategory
{
  return [a1 _accessibilityScrollAncestorForSelector:a3 alwaysAllowRefreshAction:0];
}

- (double)_accessibilityVisibleItemDenominator
{
  return 3.0;
}

- (uint64_t)_accessibilityUpdatesSwitchMenu
{
  return 0;
}

- (id)_accessibilityScrollAncestorForSelector:()AXPrivCategory alwaysAllowRefreshAction:
{
  uint64_t v22 = 0;
  double v23 = (id *)&v22;
  uint64_t v24 = 0x3032000000;
  double v25 = __Block_byref_object_copy__2;
  double v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  if (aSelector)
  {
    id v7 = NSStringFromSelector(aSelector);
    uint64_t v8 = [v7 stringByAppendingString:@"Supported"];

    char v9 = [a1 _accessibilityScrollAncestor];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong(v23 + 5, v9);
    }
    if (v9)
    {
      while (1)
      {
        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = [v9 safeValueForKey:v8];
          char v11 = [v10 BOOLValue];

          if ((v11 & 1) != 0 || a4 && sel_accessibilityScrollUpPage == aSelector) {
            break;
          }
        }
        uint64_t v12 = [v9 accessibilityContainer];
        uint64_t v13 = [v12 _accessibilityScrollAncestor];

        char v9 = (void *)v13;
        if (!v13) {
          goto LABEL_13;
        }
      }
      id v14 = v23[5];
      v23[5] = v9;
      id v15 = v9;
    }
  }
  else
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __93__NSObject_AXPrivCategory___accessibilityScrollAncestorForSelector_alwaysAllowRefreshAction___block_invoke;
    v18[3] = &unk_1E59B8FD0;
    double v20 = &v22;
    uint64_t v21 = 0;
    CGFloat v19 = 0;
    [a1 _accessibilityIterateScrollParentsUsingBlock:v18];
    uint64_t v8 = v19;
  }
LABEL_13:

  id v16 = v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

- (uint64_t)_accessibilityIterateParentsForTestBlock:()AXPrivCategory
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__NSObject_AXPrivCategory___accessibilityIterateParentsForTestBlock___block_invoke;
  v8[3] = &unk_1E59B8FF8;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  [a1 _accessibilityIterateScrollParentsUsingBlock:v8];
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)_accessibilityIsEscapable
{
  if (!_accessibilityIsEscapable_BaseNSObjectMethod)
  {
    id v2 = (objc_class *)objc_opt_class();
    _accessibilityIsEscapable_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityPerformEscape);
    uint64_t v3 = (objc_class *)objc_opt_class();
    _accessibilityIsEscapable_BaseCanPerformMethod = (uint64_t)class_getInstanceMethod(v3, sel__accessibilityCanPerformEscapeAction);
  }
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  char v14 = __Block_byref_object_copy__2;
  id v15 = __Block_byref_object_dispose__2;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__NSObject_AXPrivCategory___accessibilityIsEscapable__block_invoke;
  v10[3] = &unk_1E59B9020;
  v10[4] = &v11;
  v10[5] = &v17;
  v10[6] = sel__accessibilityCanPerformEscapeAction;
  v10[7] = sel_accessibilityPerformEscape;
  int v4 = [a1 _accessibilityIterateParentsForTestBlock:v10];
  if ((v4 & 1) != 0 || *((unsigned char *)v18 + 24))
  {
    uint64_t v5 = v4 & ~_switchControlNegatesPerformEscapeAnswer((void *)v12[5]);
  }
  else
  {
    id v7 = (id *)MEMORY[0x1E4F43630];
    uint64_t v8 = (objc_class *)objc_opt_class();
    if (class_getInstanceMethod(v8, sel__accessibilityCanPerformEscapeAction) == (Method)_accessibilityIsEscapable_BaseCanPerformMethod)
    {
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v5 = class_getInstanceMethod(v9, sel_accessibilityPerformEscape) != (Method)_accessibilityIsEscapable_BaseNSObjectMethod;
    }
    else
    {
      uint64_t v5 = [*v7 _accessibilityCanPerformEscapeAction];
    }
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v5;
}

- (uint64_t)_accessibilitySetAdditionalImportantScannerMenuItems:()AXPrivCategory
{
  return [a1 _accessibilitySetValue:a3 forKey:@"_promoteSwitchControlMenuItemsKey" storageMode:0];
}

- (uint64_t)_accessibilityTapReplacementGestures
{
  return 0;
}

- (uint64_t)_accessibilityIsScrollable
{
  id v2 = [a1 _accessibilityValueForKey:@"AXIsScrollable"];

  if (v2)
  {
    return [a1 _accessibilityBoolValueForKey:@"AXIsScrollable"];
  }
  else
  {
    int v4 = [a1 _accessibilityIterateParentsForTestBlock:&__block_literal_global_387];
    if (v4)
    {
      BOOL v5 = 0;
    }
    else
    {
      uint64_t v6 = [a1 _accessibilityScrollAncestor];
      BOOL v5 = v6 != 0;
    }
    uint64_t v7 = v4 | v5;
    [a1 _accessibilitySetBoolValue:v7 forKey:@"AXIsScrollable"];
    return v7;
  }
}

- (id)_axCachedHasTabBarAncestor
{
  return objc_getAssociatedObject(a1, &__NSObject___axCachedHasTabBarAncestor);
}

- (uint64_t)_axSetCachedHasTabBarAncestor:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)_accessibilityAdditionalElementOrderedLast
{
  return MEMORY[0x1F4106398](a1, &__NSObject___accessibilityAdditionalElementOrderedLast);
}

- (uint64_t)_accessibilitySetAdditionalElementOrderedLast:()AXPrivCategory
{
  return MEMORY[0x1F41063D0](a1, &__NSObject___accessibilityAdditionalElementOrderedLast);
}

- (uint64_t)_accessibilityIsInTabBar
{
  id v2 = [a1 _axCachedHasTabBarAncestor];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
  }
  else
  {
    BOOL v5 = [a1 _accessibilityTabBarAncestor];
    uint64_t v4 = v5 != 0;

    uint64_t v6 = [NSNumber numberWithBool:v4];
    [a1 _axSetCachedHasTabBarAncestor:v6];
  }
  return v4;
}

- (uint64_t)_accessibilityDidMoveToTabBar
{
  return [a1 _axSetCachedHasTabBarAncestor:0];
}

- (uint64_t)_accessibililtyLabelForTabBarButton:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityTabBarAncestor
{
  return [a1 _accessibilityFindAncestor:&__block_literal_global_391 startWithSelf:0];
}

- (uint64_t)_accessibilityCanScrollInAtLeastOneDirection
{
  if (([a1 _accessibilityCanPerformAction:2006] & 1) != 0
    || ([a1 _accessibilityCanPerformAction:2007] & 1) != 0
    || ([a1 _accessibilityCanPerformAction:2009] & 1) != 0)
  {
    return 1;
  }

  return [a1 _accessibilityCanPerformAction:2008];
}

- (double)_accessibilityContentOffset
{
  return *MEMORY[0x1E4F1DAD8];
}

- (uint64_t)_accessibilityShowContextMenuWithTargetPointValue:()AXPrivCategory
{
  id v4 = a3;
  BOOL v5 = [a1 _accessibilityParentView];
  uint64_t v6 = [v5 _accessibilityShowContextMenuForElement:a1 targetPointValue:v4];

  return v6;
}

- (uint64_t)_accessibilityScrollToVisibleForNextElementRetrieval:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityViewControllerShouldPreventScrollToVisibleForElement:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityBaseScrollToVisible
{
  id v2 = AXLogScrollToVisible();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(AXPrivCategory) _accessibilityBaseScrollToVisible]();
  }

  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke;
  v5[3] = &unk_1E59B9048;
  v5[4] = a1;
  void v5[5] = &v6;
  [a1 _accessibilityIterateScrollParentsUsingBlock:v5];
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)_accessibilityShouldAttemptScrollToFrameOnParentView
{
  return 1;
}

- (uint64_t)_accessibilitySavePhotoLabel:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_animateScrollViewWithScrollAmount:()AXPrivCategory point:
{
  if (a2 == 0.0) {
    return 1;
  }
  if (__AXRuntimeApplicationElement())
  {
    id v4 = (void (*)(void))__AXRuntimeApplicationElement();
    BOOL v5 = v4();
    uint64_t v6 = (const void *)_AXCreateAXUIElementWithElement();
  }
  else
  {
    uint64_t v6 = (const void *)_AXCreateAXUIElementWithElement();
  }
  uint64_t v8 = 0;
  [a1 _accessibilityDisplayId];
  _AXUIElementCopyElementAtPositionWithParams();
  if (v6) {
    CFRelease(v6);
  }
  return 0;
}

- (BOOL)_accessibilityAdjustScrollOffset:()AXPrivCategory
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v34[0] = 0;
  objc_opt_class();
  uint64_t v6 = [a1 _accessibilityScrollAncestor];
  uint64_t v7 = __UIAccessibilityCastAsClass();

  [v7 contentOffset];
  double v9 = v8;
  double v11 = v10;
  [v7 frame];
  double v13 = v12;
  double v15 = v14;
  id v16 = AXMediaLogMLElement();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v40.CGFloat x = v9;
    v40.CGFloat y = v11;
    uint64_t v17 = NSStringFromCGPoint(v40);
    v41.CGFloat x = a2;
    v41.CGFloat y = a3;
    double v18 = NSStringFromCGPoint(v41);
    *(_DWORD *)id v34 = 138412802;
    *(void *)&v34[4] = v7;
    __int16 v35 = 2112;
    int v36 = v17;
    __int16 v37 = 2112;
    double v38 = v18;
    _os_log_impl(&dword_19F2DB000, v16, OS_LOG_TYPE_DEFAULT, "Scrolling with %@ from %@ + %@", v34, 0x20u);
  }
  double v19 = a3 + v11;
  double v20 = a2 + v9;
  [v7 contentSize];
  double v22 = v21 - v15;
  if (v21 - v15 >= v19) {
    double v22 = v19;
  }
  double v23 = fmax(v22, 0.0);
  objc_msgSend(v7, "contentSize", *(void *)v34);
  double v25 = v24 - v13;
  if (v25 >= v20) {
    double v25 = v20;
  }
  double v26 = fmax(v25, 0.0);
  id v27 = AXMediaLogMLElement();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v42.CGFloat x = v26;
    v42.CGFloat y = v23;
    double v28 = NSStringFromCGPoint(v42);
    [v7 contentSize];
    CGFloat v29 = NSStringFromCGSize(v43);
    *(_DWORD *)id v34 = 138412546;
    *(void *)&v34[4] = v28;
    __int16 v35 = 2112;
    int v36 = v29;
    _os_log_impl(&dword_19F2DB000, v27, OS_LOG_TYPE_DEFAULT, "Will apply %@ with size :%@", v34, 0x16u);
  }
  objc_msgSend(v7, "accessibilityApplyScrollContent:sendScrollStatus:animateWithDuration:", 0, v26, v23, 0.1);
  [v7 contentOffset];
  BOOL v32 = v23 != v31 || v26 != v30;

  return v32;
}

- (uint64_t)_accessibilityScrollToPoint:()AXPrivCategory
{
  double v10 = [a1 _accessibilityScrollAncestor];
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = a2 >= 0.0 && a2 <= 1.0;
    if (v5 && a3 >= 0.0 && a3 <= 1.0)
    {
      [v10 contentSize];
      objc_msgSend(v10, "_accessibilityScrollToFrame:forView:", v10, a2 * v6, a3 * v7, 1.0, 1.0);
      double v8 = [v10 _accessibilityScrollStatus];
      UIAccessibilityPostNotification(*MEMORY[0x1E4F43468], v8);
    }
    else
    {
      NSLog(&cfstr_ScrollToPointO.isa, v10);
    }
  }

  return MEMORY[0x1F41817F8]();
}

- (double)_accessibilityScrollRectToVisible:()AXPrivCategory
{
  uint64_t v9 = 0;
  double v10 = (double *)&v9;
  uint64_t v11 = 0x3010000000;
  double v12 = "";
  long long v13 = *MEMORY[0x1E4F1DAD8];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x4010000000;
  v8[3] = "";
  *(double *)&void v8[4] = a2;
  *(double *)&v8[5] = a3;
  *(double *)&v8[6] = a4;
  *(double *)&v8[7] = a5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__NSObject_AXPrivCategory___accessibilityScrollRectToVisible___block_invoke;
  v7[3] = &unk_1E59B9098;
  v7[4] = v8;
  v7[5] = &v9;
  [a1 _accessibilityIterateScrollParentsUsingBlock:v7 includeSelf:1];
  double v5 = v10[4];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (uint64_t)_accessibilityHandlePublicScroll:()AXPrivCategory
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__NSObject_AXPrivCategory___accessibilityHandlePublicScroll___block_invoke;
  v5[3] = &unk_1E59B90C0;
  void v5[5] = &v6;
  void v5[6] = a3;
  v5[4] = a1;
  [a1 _accessibilityIterateScrollParentsUsingBlock:v5];
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_accessibilitySendPageScrollFailedIfNecessary
{
  uint64_t v2 = [a1 _accessibilityRemoteParent];
  if (!v2
    || (v3 = (void *)v2, char v4 = [a1 _accessibilityShouldScrollRemoteParent],
                         v3,
                         (v4 & 1) == 0))
  {
    UIAccessibilityNotifications v5 = *MEMORY[0x1E4F43468];
    uint64_t v6 = (void *)*MEMORY[0x1E4F48C80];
    UIAccessibilityPostNotification(v5, v6);
  }
}

- (uint64_t)_accessibilityTryScrollWithSelector:()AXPrivCategory shouldSendScrollFailed:
{
  char v14 = 0;
  double v7 = objc_msgSend(a1, "_accessibilityScrollAncestorForSelector:");
  uint64_t v8 = v7 != 0;
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_4;
    }
    char v9 = (void *)MEMORY[0x1E4F1CA18];
    double v10 = [(id)objc_opt_class() instanceMethodSignatureForSelector:a3];
    uint64_t v11 = [v9 invocationWithMethodSignature:v10];

    [v11 setSelector:a3];
    [v11 setTarget:v7];
    [v11 invoke];
    [v11 getReturnValue:&v14];

    if (!v14)
    {
LABEL_4:
      double v12 = [v7 accessibilityContainer];
      uint64_t v8 = [v12 _accessibilityTryScrollWithSelector:a3 shouldSendScrollFailed:a4];
    }
  }
  else if (a4)
  {
    [a1 _accessibilitySendPageScrollFailedIfNecessary];
  }

  return v8;
}

- (uint64_t)_accessibilityScrollPageInDirection:()AXPrivCategory shouldSendScrollFailed:
{
  if (objc_msgSend(a1, "_accessibilityHandlePublicScroll:")) {
    return 1;
  }
  uint64_t v8 = [a1 _accessibilityScrollSelectorForDirection:a3];

  return [a1 _accessibilityTryScrollWithSelector:v8 shouldSendScrollFailed:a4];
}

- (char)_accessibilityScrollSelectorForDirection:()AXPrivCategory
{
  switch(a3)
  {
    case 1:
      result = sel_accessibilityScrollRightPage;
      break;
    case 2:
      result = sel_accessibilityScrollLeftPage;
      break;
    case 3:
      result = sel_accessibilityScrollUpPage;
      break;
    case 4:
      result = sel_accessibilityScrollDownPage;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (uint64_t)_accessibilityScrollLeftPage:()AXPrivCategory
{
  return [a1 _accessibilityScrollPageInDirection:2 shouldSendScrollFailed:a3];
}

- (uint64_t)_accessibilityScrollRightPage:()AXPrivCategory
{
  return [a1 _accessibilityScrollPageInDirection:1 shouldSendScrollFailed:a3];
}

- (uint64_t)_accessibilityScrollNextPage
{
  return [a1 _accessibilityHandlePublicScroll:5];
}

- (uint64_t)_accessibilityScrollPreviousPage
{
  return [a1 _accessibilityHandlePublicScroll:6];
}

- (uint64_t)_accessibilityScrollUpPage:()AXPrivCategory
{
  return [a1 _accessibilityScrollPageInDirection:3 shouldSendScrollFailed:a3];
}

- (uint64_t)_accessibilityScrollDownPage:()AXPrivCategory
{
  return [a1 _accessibilityScrollPageInDirection:4 shouldSendScrollFailed:a3];
}

- (id)_accessibilityScrollParent
{
  uint64_t v4 = 0;
  UIAccessibilityNotifications v5 = &v4;
  uint64_t v6 = 0x3032000000;
  double v7 = __Block_byref_object_copy__2;
  uint64_t v8 = __Block_byref_object_dispose__2;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__NSObject_AXPrivCategory___accessibilityScrollParent__block_invoke;
  v3[3] = &unk_1E59B8FA8;
  v3[4] = &v4;
  [a1 _accessibilityIterateScrollParentsUsingBlock:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (double)_accessibilityZoomScale
{
  return 0.0;
}

- (double)_accessibilityFontSize
{
  return 0.0;
}

- (double)_accessibilityViewAlpha
{
  return 0.0;
}

- (BOOL)_accessibilityFrameSupportsMediaAnalysis
{
  [a1 _axScreenBoundsForBoundsCheck];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  [a1 _axFrameForBoundsCheck:0];
  CGFloat width = v21.size.width;
  double height = v21.size.height;
  double v12 = v21.size.width / 3.0;
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  double MaxX = CGRectGetMaxX(v21);
  v22.origin.CGFloat x = v3;
  v22.origin.CGFloat y = v5;
  v22.size.CGFloat width = v7;
  v22.size.double height = v9;
  CGFloat v14 = CGRectGetMaxX(v22);
  BOOL result = 0;
  if (MaxX - v14 <= v12)
  {
    v23.origin.CGFloat y = y;
    v23.origin.CGFloat x = x;
    v23.size.CGFloat width = width;
    v23.size.double height = height;
    double MinX = CGRectGetMinX(v23);
    v24.origin.CGFloat x = v3;
    v24.origin.CGFloat y = v5;
    v24.size.CGFloat width = v7;
    v24.size.double height = v9;
    if (MinX - CGRectGetMinX(v24) < -v12) {
      return 0;
    }
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.double height = height;
    double MaxY = CGRectGetMaxY(v25);
    v26.origin.CGFloat x = v3;
    v26.origin.CGFloat y = v5;
    v26.size.CGFloat width = v7;
    v26.size.double height = v9;
    if (MaxY - CGRectGetMaxY(v26) <= height / 3.0)
    {
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.double height = height;
      double MinY = CGRectGetMinY(v27);
      v28.origin.CGFloat x = v3;
      v28.origin.CGFloat y = v5;
      v28.size.CGFloat width = v7;
      v28.size.double height = v9;
      return MinY - CGRectGetMinY(v28) >= -(height / 3.0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_accessibilityUserDefinedMediaAnalysisOptions
{
  return [a1 _accessibilityValueForKey:@"AXUserDefinedMediaAnalysisOptionsKey"];
}

- (uint64_t)_accessibilitySetUserDefinedMediaAnalysisOptions:()AXPrivCategory
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"AXUserDefinedMediaAnalysisOptionsKey"];
}

- (uint64_t)_accessibilityMediaAnalysisOptions
{
  double v2 = [a1 _accessibilityUserDefinedMediaAnalysisOptions];
  CGFloat v3 = v2;
  if (v2)
  {
    unsigned int v4 = [v2 unsignedLongValue];
  }
  else if ([a1 _accessibilityIsGroupedParent])
  {
    unsigned int v4 = 0;
  }
  else
  {
    unsigned int v4 = 40959;
  }
  CGFloat v5 = [a1 _accessibilityBrailleMap];

  if (v5) {
    uint64_t v6 = v4 | 0x100000;
  }
  else {
    uint64_t v6 = v4;
  }

  return v6;
}

- (uint64_t)_accessibilityEffectiveMediaAnalysisOptions
{
  uint64_t v2 = [a1 _accessibilityMediaAnalysisOptions];
  if ((v2 & 0x8000) != 0)
  {
    if ([a1 _accessibilityFrameSupportsMediaAnalysis]) {
      return v2;
    }
    else {
      return v2 & 0xFFFF7FFF;
    }
  }
  return v2;
}

- (uint64_t)_accessibilityMediaAnalysisFrame
{
  return [a1 _accessibilityVisibleFrame:0];
}

- (uint64_t)_accessibilityElementHasImage
{
  return 0;
}

- (uint64_t)_accessibility2DBrailleCanvasElement
{
  return [a1 _accessibilityFindAncestor:&__block_literal_global_427 startWithSelf:1];
}

- (uint64_t)_accessibilityCanBeConsideredMediaAnalysisElement
{
  uint64_t v2 = [a1 accessibilityTraits];
  if ((*MEMORY[0x1E4F43508] & v2) == 0) {
    return 0;
  }
  [a1 accessibilityFrame];
  if (v4 < *MEMORY[0x1E4F47F18] || v3 < *MEMORY[0x1E4F47F10]) {
    return 0;
  }
  char v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) == 0) {
    return 1;
  }
  uint64_t result = [a1 _accessibilityViewIsVisible];
  if (result) {
    return 1;
  }
  return result;
}

- (id)_accessibilityMediaAnalysisElement
{
  uint64_t v2 = [a1 _accessibilityFindSubviewDescendant:&__block_literal_global_432_0];
  double v3 = v2;
  if (!v2) {
    uint64_t v2 = a1;
  }
  id v4 = v2;

  return v4;
}

- (uint64_t)_accessibilityPHAssetLocalIdentifier
{
  return 0;
}

- (uint64_t)_accessibilityIsPHAssetLocallyAvailable
{
  return 0;
}

- (uint64_t)_accessibilityPhotoLibraryURL
{
  return 0;
}

- (uint64_t)accessibilityContainerElements
{
  return 0;
}

- (uint64_t)_accessibilitySetUsesScrollParentForOrdering:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"AXUsesScrollParentForOrderingKey"];
}

- (uint64_t)_accessibilityUsesScrollParentForOrdering
{
  id v1 = [a1 _accessibilityValueForKey:@"AXUsesScrollParentForOrderingKey"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (BOOL)accessibilityShouldEnumerateContainerElementsArrayDirectly
{
  if (accessibilityShouldEnumerateContainerElementsArrayDirectly_onceToken != -1) {
    dispatch_once(&accessibilityShouldEnumerateContainerElementsArrayDirectly_onceToken, &__block_literal_global_437);
  }
  v0 = (objc_class *)objc_opt_class();
  id v1 = (objc_method *)accessibilityShouldEnumerateContainerElementsArrayDirectly_elementsBaseMethod;
  if (v1 == class_getInstanceMethod(v0, sel__accessibilityElements)) {
    return 0;
  }
  uint64_t v2 = (objc_method *)accessibilityShouldEnumerateContainerElementsArrayDirectly_elementsCountBaseMethod;
  if (v2 != class_getInstanceMethod(v0, sel_accessibilityElementCount)) {
    return 0;
  }
  Method v4 = (Method)accessibilityShouldEnumerateContainerElementsArrayDirectly_elementAtIndexBaseMethod;
  return v4 == class_getInstanceMethod(v0, sel_accessibilityElementAtIndex_);
}

- (BOOL)_accessibilityHasOrderedChildren
{
  return ([a1 isAccessibilityElement] & 1) == 0
      && [a1 accessibilityElementCount] != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)accessibilityEnumerateContainerElementsWithOptions:()AXPrivCategory usingBlock:
{
  CGFloat v5 = a4;
  v29[0] = 0;
  if ([a1 accessibilityShouldEnumerateContainerElementsArrayDirectly])
  {
    uint64_t v6 = [a1 _accessibilityElements];
    char v7 = (void *)[v6 copy];

    double v20 = v7;
    uint64_t v8 = [v7 count];
    if (v8)
    {
      unint64_t v9 = v8;
      uint64_t v10 = v8 - 1;
      unint64_t v11 = 1;
      do
      {
        if ((a3 & 2) != 0) {
          unint64_t v12 = v10;
        }
        else {
          unint64_t v12 = v11 - 1;
        }
        uint64_t v23 = 0;
        CGRect v24 = &v23;
        uint64_t v25 = 0x3032000000;
        CGRect v26 = __Block_byref_object_copy__2;
        CGRect v27 = __Block_byref_object_dispose__2;
        id v28 = 0;
        id v22 = v20;
        AXPerformSafeBlock();
        id v13 = (id)v24[5];

        _Block_object_dispose(&v23, 8);
        if (v13) {
          v5[2](v5, v13, v12, v29);
        }

        if (v11 >= v9) {
          break;
        }
        ++v11;
        --v10;
      }
      while (!v29[0]);
    }
  }
  else
  {
    uint64_t v14 = [a1 accessibilityElementCount];
    if (v14)
    {
      unint64_t v15 = v14;
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v16 = v14 - 1;
        unint64_t v17 = 1;
        do
        {
          if ((a3 & 2) != 0) {
            unint64_t v18 = v16;
          }
          else {
            unint64_t v18 = v17 - 1;
          }
          double v19 = [a1 accessibilityElementAtIndex:v18];
          if (v19) {
            v5[2](v5, v19, v18, v29);
          }

          if (v17 >= v15) {
            break;
          }
          ++v17;
          --v16;
        }
        while (!v29[0]);
      }
    }
  }
}

- (void)accessibilityEnumerateContainerElementsUsingBlock:()AXPrivCategory
{
  id v5 = a3;
  if ([a1 _accessibilityHitTestReverseOrder]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  [a1 accessibilityEnumerateContainerElementsWithOptions:v4 usingBlock:v5];
}

- (id)_accessibilityContainingParentForOrdering
{
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_axContainingParentForOrdering", a1);
  id v11 = 0;
  PossiblyNilObjectForKeCGFloat y = _AXServerCacheGetPossiblyNilObjectForKey(v2, &v11);
  id v4 = v11;
  if (!PossiblyNilObjectForKey)
  {
    id v5 = a1;

    if (v5)
    {
      id v4 = v5;
      while (1)
      {
        if ([v4 shouldGroupAccessibilityChildren])
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
        }
        id v6 = [v4 accessibilityContainer];
        if (!v6)
        {
          if ([v4 conformsToProtocol:&unk_1EF189E70])
          {
            char v7 = [v4 parentFocusEnvironment];
            id v8 = [v7 focusItemContainer];

            if (v8 == v4) {
              unint64_t v9 = 0;
            }
            else {
              unint64_t v9 = v8;
            }
            id v6 = v9;
          }
          else
          {
            id v6 = 0;
          }
        }

        id v4 = v6;
        if (!v6) {
          goto LABEL_14;
        }
      }
      _AXServerCacheInsertPossiblyNilObjectForKey(v2, v4);
    }
    else
    {
LABEL_14:
      _AXServerCacheInsertPossiblyNilObjectForKey(v2, 0);
      id v4 = 0;
    }
  }

  return v4;
}

- (id)_accessibilityContainerInDirection:()AXPrivCategory
{
  id v5 = +[UIAccessibilityElementTraversalOptions options];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__NSObject_AXPrivCategory___accessibilityContainerInDirection___block_invoke;
  aBlock[3] = &unk_1E59B8A80;
  aBlock[4] = a1;
  id v6 = _Block_copy(aBlock);
  id v7 = [a1 _accessibilityFindAncestor:v6 startWithSelf:0];
  if (!v7) {
    id v7 = a1;
  }
  [v5 setLeafNodePredicate:v6];
  if (a3) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  [v5 setDirection:v8];
  [v5 setIncludeAncestorsOfSelfInSiblingMatch:1];
  unint64_t v9 = [a1 _accessibilityOpaqueElementParent];
  if (v9
    && (LOBYTE(v15) = 0,
        objc_msgSend(v9, "_accessibilityMoveFocusToNextOpaqueElementForTechnology:direction:searchType:range:shouldScrollToVisible:honorsGroups:", *MEMORY[0x1E4F43460], objc_msgSend(v5, "direction"), 35, 0x7FFFFFFFLL, 0, 1, v15), (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v11 = v10;
    uint64_t v12 = [v10 _accessibilityTouchContainer];
  }
  else
  {
    id v11 = [v7 _accessibilityElementsInDirectionWithCount:1 options:v5];
    uint64_t v12 = [v11 firstObject];
  }
  id v13 = (void *)v12;

  return v13;
}

- (id)_accessibilityGuideElementInDirection:()AXPrivCategory
{
  id v5 = +[UIAccessibilityElementTraversalOptions options];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NSObject_AXPrivCategory___accessibilityGuideElementInDirection___block_invoke;
  aBlock[3] = &unk_1E59B8A80;
  aBlock[4] = a1;
  id v6 = _Block_copy(aBlock);
  [v5 setLeafNodePredicate:v6];
  if (a3) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [v5 setDirection:v7];
  [v5 setIncludeAncestorsOfSelfInSiblingMatch:1];
  uint64_t v8 = [a1 _accessibilityElementsInDirectionWithCount:1 options:v5];
  unint64_t v9 = [v8 firstObject];

  return v9;
}

- (id)_accessibilityElements
{
  uint64_t v2 = [a1 accessibilityContainerElements];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [a1 accessibilityElements];
  }
  id v5 = v4;
  [a1 _accessibilityUpdateContainerElementReferencesIfNeededForNewElements:v4];

  return v5;
}

- (id)_accessibilityLastElementsUpdatedWithContainerElementReferences
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityLastElementsUpdatedWithContainerElementReferences);
}

- (uint64_t)_accessibilitySetLastElementsUpdatedWithContainerElementReferences:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:()AXPrivCategory
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = [a1 _accessibilityLastElementsUpdatedWithContainerElementReferences];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * i) setAccessibilityContainer:0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        if (v15 == a1)
        {
          uint64_t v16 = AXLogAppAccessibility();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            CGRect v26 = a1;
            _os_log_error_impl(&dword_19F2DB000, v16, OS_LOG_TYPE_ERROR, "An object shouldn't return itself in accessibilityElements. Element: %@", buf, 0xCu);
          }
        }
        else
        {
          [v15 setAccessibilityContainer:a1];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v12);
  }

  [a1 _accessibilitySetLastElementsUpdatedWithContainerElementReferences:v10];
}

- (id)_accessibilitySwipeIsland
{
  id v1 = a1;
  if (v1)
  {
    while (1)
    {
      uint64_t v2 = [v1 _accessibilitySwipeIslandIdentifier];
      if (v2) {
        break;
      }
      uint64_t v3 = [v1 accessibilityContainer];

      id v1 = v3;
      if (!v3) {
        goto LABEL_7;
      }
    }
    uint64_t v3 = (void *)v2;
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_7:

  return v3;
}

- (uint64_t)_accessibilitySwipeIslandIdentifier
{
  return 0;
}

- (uint64_t)accessibilityChildrenContainerGroupingBehaviorHasOverridingParentDelegate
{
  return 0;
}

- (uint64_t)accessibilityParentDiscardsChildrenContainerGroupingBehavior
{
  return 0;
}

- (uint64_t)_accessibilitySelectedChildren
{
  return 0;
}

- (uint64_t)_accessibilityShouldPreventOpaqueScrolling
{
  return MEMORY[0x1F4106398](a1, &__NSObject___accessibilityShouldPreventOpaqueScrolling);
}

- (uint64_t)_accessibilitySetShouldPreventOpaqueScrolling:()AXPrivCategory
{
  return MEMORY[0x1F41063D0](a1, &__NSObject___accessibilityShouldPreventOpaqueScrolling);
}

- (uint64_t)__accessibilitySupportsActivateAction
{
  if (!__accessibilitySupportsActivateAction_BaseSupportsActivateAction)
  {
    uint64_t v2 = (objc_class *)objc_opt_class();
    __accessibilitySupportsActivateAction_BaseSupportsActivateAction = (uint64_t)class_getInstanceMethod(v2, sel__accessibilitySupportsActivateAction);
  }
  uint64_t v3 = [a1 _accessibilitySupportsActivateAction];
  id v4 = (objc_class *)objc_opt_class();
  if ((Method)__accessibilitySupportsActivateAction_BaseSupportsActivateAction == class_getInstanceMethod(v4, sel__accessibilitySupportsActivateAction))
  {
    if (!__accessibilitySupportsActivateAction_BaseActivateAction)
    {
      id v5 = (objc_class *)objc_opt_class();
      __accessibilitySupportsActivateAction_BaseActivateAction = (uint64_t)class_getInstanceMethod(v5, sel_accessibilityActivate);
      uint64_t v6 = (objc_class *)objc_opt_class();
      __accessibilitySupportsActivateAction_UIControlActivateAction = (uint64_t)class_getInstanceMethod(v6, sel_accessibilityActivate);
    }
    uint64_t v7 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v7, sel_accessibilityActivate);
    if (InstanceMethod == (Method)__accessibilitySupportsActivateAction_BaseActivateAction
      || __accessibilitySupportsActivateAction_UIControlActivateAction == (void)InstanceMethod)
    {
      return v3;
    }
    else
    {
      return 1;
    }
  }
  return v3;
}

- (uint64_t)_setAccessibilityHeadingLevel:()AXPrivCategory
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"AXHeadingLevel"];
}

- (id)_accessibilityHeadingLevel
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:27];
  uint64_t v3 = (void *)v2;
  if (!v2)
  {
    id v5 = [a1 _accessibilityValueForKey:@"AXHeadingLevel"];
    id v4 = v5;
    if (v5) {
      id v6 = v5;
    }

    if (!v4) {
      goto LABEL_8;
    }
LABEL_7:
    if (([v4 integerValue] & 0x8000000000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
  if (v4) {
    goto LABEL_7;
  }
LABEL_8:

  id v4 = &unk_1EF1718D8;
LABEL_9:

  return v4;
}

- (uint64_t)_accessibilitySupportsSecondaryActivateAction
{
  return 0;
}

- (uint64_t)_accessibilityCanPerformAction:()AXPrivCategory
{
  switch(a3)
  {
    case 2006:
      uint64_t v3 = sel_accessibilityScrollDownPage;
      goto LABEL_8;
    case 2007:
      uint64_t v3 = sel_accessibilityScrollUpPage;
      goto LABEL_8;
    case 2008:
      uint64_t v3 = sel_accessibilityScrollRightPage;
      goto LABEL_8;
    case 2009:
      uint64_t v3 = sel_accessibilityScrollLeftPage;
LABEL_8:
      id v4 = [a1 _accessibilityScrollAncestorForSelector:v3];
      uint64_t v5 = v4 != 0;
      goto LABEL_9;
    default:
      if (a3 != 2030) {
        return 1;
      }
      id v4 = [a1 _accessibilityScrollAncestor];
      uint64_t v5 = [v4 accessibilityScrollToTopSupported];
LABEL_9:

      return v5;
  }
}

- (uint64_t)accessibilityHeaderElements
{
  return 0;
}

- (id)_accessibilityRetrieveLinkedUIElementsFromContainerChain
{
  id v1 = a1;
  if (v1)
  {
    uint64_t v2 = v1;
    while (1)
    {
      uint64_t v3 = [v2 _accessibilityLinkedUIElements];
      if ([v3 count]) {
        break;
      }
      uint64_t v4 = [v2 accessibilityContainer];

      uint64_t v2 = (void *)v4;
      if (!v4) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_accessibilityLinkedUIElements
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:15];
  uint64_t v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else {
  uint64_t v4 = [a1 _accessibilityUserDefinedLinkedUIElements];
  }

  return v4;
}

- (void)_setAccessibilityLinkedUIElements:()AXPrivCategory
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    [v11 raise:v12, @"accessibilityLinkedUIElements must be an NSArray. Was actually: %@", v14 format];

LABEL_12:
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  uint64_t v5 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addPointer:*(void *)(*((void *)&v15 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

LABEL_13:
  objc_setAssociatedObject(a1, &AXLinkedUIElementsIdentifier, v5, (void *)0x301);
}

- (id)_accessibilityUserDefinedLinkedUIElements
{
  id v1 = objc_getAssociatedObject(a1, &AXLinkedUIElementsIdentifier);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v2 = [v1 allObjects];

    id v1 = (void *)v2;
  }

  return v1;
}

- (id)_accessibilityGuideElementHeaderText
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:16];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    id v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    id v4 = [a1 _accessibilityUserDefinedGuideElementHeaderText];
    if (![v4 length])
    {
      uint64_t v5 = [a1 _accessibilityRetieveHeaderElementText];

      id v4 = (void *)v5;
    }
  }

  return v4;
}

- (id)_accessibilityRetieveHeaderElementText
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v1 = [a1 _accessibilityRetrieveHeaderElements];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = 0;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0;
      uint64_t v7 = v4;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v1);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v6);
        uint64_t v9 = objc_msgSend(v8, "_iosAccessibilityAttributeValue:", 2001, v11, v12, v13);
        uint64_t v12 = [v8 _iosAccessibilityAttributeValue:2006];
        uint64_t v13 = @"__AXStringForVariablesSentinel";
        uint64_t v11 = v9;
        id v4 = __UIAXStringForVariables();

        ++v6;
        uint64_t v7 = v4;
      }
      while (v3 != v6);
      uint64_t v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, v9, v12, @"__AXStringForVariablesSentinel");
    }
    while (v3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_setAccessibilityGuideElementHeaderText:()AXPrivCategory
{
}

- (id)_accessibilityUserDefinedGuideElementHeaderText
{
  return objc_getAssociatedObject(a1, &AXGuildeElementHeaderTextIdentifier);
}

- (uint64_t)_accessibilityVerticalScrollBarElement
{
  return 0;
}

- (uint64_t)_accessibilityOrientation
{
  return 0;
}

- (uint64_t)_accessibilityIsScrollBarIndicator
{
  return 0;
}

- (uint64_t)_accessibilityHorizontalScrollBarElement
{
  return 0;
}

- (uint64_t)_accessibilitySupportsDirectioOrbManipulation
{
  return 1;
}

- (uint64_t)accessibilityPlaceholderValue
{
  return [a1 _accessibilityValueForKey:@"accessibilityPlaceholderValue"];
}

- (uint64_t)accessibilityLinkedElement
{
  return 0;
}

- (uint64_t)_accessibilitySupportGesturesAttributes
{
  return 0;
}

- (uint64_t)_accessibilityAlwaysOrderedFirst
{
  return 0;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  id v1 = [a1 _accessibilityGetBlockForAttribute:17];
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  id v1 = [a1 _accessibilityGetBlockForAttribute:25];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)_accessibilityElementShouldBeInvalid
{
  return 0;
}

- (uint64_t)axContainerTypeFromUIKitContainerType:()AXPrivCategory
{
  if ((a3 & 0xFFFFFFF0) != 0) {
    return 0;
  }
  else {
    return qword_19F3490B8[a3];
  }
}

- (uint64_t)beaxContainerTypeFromUIKitContainerType:()AXPrivCategory
{
  return a3 & 0x7FF | (((a3 >> 11) & 1) << 15);
}

- (id)_axAncestorTypes
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__2;
  uint64_t v12 = __Block_byref_object_dispose__2;
  id v13 = [a1 _accessibilityValueForKey:@"AXContainerAncestorTypeKey"];
  BOOL v2 = (void *)v9[5];
  if (!v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    id v4 = (void *)v9[5];
    void v9[5] = v3;

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__NSObject_AXPrivCategory___axAncestorTypes__block_invoke;
    v7[3] = &unk_1E59B9130;
    v7[4] = a1;
    v7[5] = &v8;
    [a1 accessibilityEnumerateAncestorsUsingBlock:v7];
    [a1 _accessibilitySetRetainedValue:v9[5] forKey:@"AXContainerAncestorTypeKey"];
    BOOL v2 = (void *)v9[5];
  }
  id v5 = v2;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_accessibilityAncestorForSiblingsWithType:()AXPrivCategory
{
  id v4 = [a1 _axAncestorTypes];
  id v5 = v4;
  if (a3)
  {
    uint64_t v6 = [NSNumber numberWithUnsignedLong:a3];
    uint64_t v7 = [v5 objectForKey:v6];
  }
  else
  {
    uint64_t v6 = [v4 objectEnumerator];
    uint64_t v8 = [v6 allObjects];
    uint64_t v7 = [v8 firstObject];
  }

  return v7;
}

- (BOOL)_accessibilitySiblingWithAncestor:()AXPrivCategory isFirst:isLast:sawAXElement:
{
  id v10 = a3;
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    if (a4) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 2;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __90__NSObject_AXPrivCategory___accessibilitySiblingWithAncestor_isFirst_isLast_sawAXElement___block_invoke;
    v15[3] = &unk_1E59B9158;
    v15[4] = a1;
    v15[5] = &v18;
    v15[6] = a6;
    char v16 = a4;
    char v17 = a5;
    [v10 accessibilityEnumerateContainerElementsWithOptions:v12 usingBlock:v15];
    BOOL v13 = *((unsigned char *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (uint64_t)_accessibilitySiblingWithAncestor:()AXPrivCategory isFirst:isLast:
{
  char v6 = 0;
  return [a1 _accessibilitySiblingWithAncestor:a3 isFirst:a4 isLast:a5 sawAXElement:&v6];
}

- (uint64_t)_accessibilityIsFirstSibling
{
  BOOL v2 = [a1 _accessibilityAncestorForSiblingsWithType:0];
  uint64_t v3 = [a1 _accessibilitySiblingWithAncestor:v2 isFirst:1 isLast:0];

  return v3;
}

- (uint64_t)_accessibilityIsLastSibling
{
  BOOL v2 = [a1 _accessibilityAncestorForSiblingsWithType:0];
  uint64_t v3 = [a1 _accessibilitySiblingWithAncestor:v2 isFirst:0 isLast:1];

  return v3;
}

- (uint64_t)_accessibilityIsFirstSiblingForType:()AXPrivCategory
{
  BOOL v2 = objc_msgSend(a1, "_accessibilityAncestorForSiblingsWithType:");
  uint64_t v3 = [a1 _accessibilitySiblingWithAncestor:v2 isFirst:1 isLast:0];

  return v3;
}

- (uint64_t)_accessibilityIsLastSiblingForType:()AXPrivCategory
{
  BOOL v2 = objc_msgSend(a1, "_accessibilityAncestorForSiblingsWithType:");
  uint64_t v3 = [a1 _accessibilitySiblingWithAncestor:v2 isFirst:0 isLast:1];

  return v3;
}

- (uint64_t)_accessibilityIsTitleElement
{
  return 0;
}

- (uint64_t)_accessibilityAlwaysSpeakTableHeaders
{
  return 0;
}

- (uint64_t)_accessibilityIsInAppSwitcher
{
  return 0;
}

- (uint64_t)_accessibilityIsInFolder
{
  return 0;
}

- (uint64_t)_accessibilityHasBadge
{
  return 0;
}

- (id)_accessibilityContainerTypes
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x3032000000;
  uint64_t v7 = __Block_byref_object_copy__2;
  uint64_t v8 = __Block_byref_object_dispose__2;
  id v9 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__NSObject_AXPrivCategory___accessibilityContainerTypes__block_invoke;
  v3[3] = &unk_1E59B9130;
  v3[4] = a1;
  void v3[5] = &v4;
  [a1 accessibilityEnumerateAncestorsUsingBlock:v3];
  id v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)_accessibilityLaunchableApps
{
  return 0;
}

- (uint64_t)_accessibilityAppSwitcherApps
{
  return 0;
}

- (uint64_t)_accessibilitySupportsMultipleCustomRotorTitles
{
  return 1;
}

- (uint64_t)_allowCustomActionHintSpeakOverride
{
  return 1;
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  uint64_t v1 = [a1 accessibilityTraits];
  return (*MEMORY[0x1E4F43528] & v1) == 0;
}

- (uint64_t)_acceessibilityUIKitIsUserInteractionDisabled
{
  return 0;
}

- (float)_accessibilityActivationDelay
{
  return 0.025;
}

- (uint64_t)accessibilitySecondaryLabel
{
  return 0;
}

- (uint64_t)accessibilityMathMLSource
{
  return 0;
}

- (uint64_t)_accessibilityShouldSpeakMathEquationTrait
{
  return 1;
}

- (uint64_t)_accessibilityShouldExpandMathEquation
{
  return 1;
}

- (uint64_t)_accessibilityIsMathTouchExplorationView
{
  return 0;
}

- (id)accessibilityMathEquation
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v2 = [a1 safeValueForKey:@"accessibilityMathExpression"];
    uint64_t v3 = [a1 _accessibilityConvertMathExpression:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_accessibilityConvertMathExpression:()AXPrivCategory
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [a1 _accessibilityProcessMathExpression:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_accessibilityProcessMathExpression:()AXPrivCategory
{
  id v4 = a3;
  id v5 = objc_opt_new();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"Number" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v6 = __UIAccessibilityCastAsClass();
LABEL_7:
    uint64_t v7 = v6;
    uint64_t v8 = [v6 content];
    [v5 setObject:v8 forKeyedSubscript:@"AXMContent"];

LABEL_8:
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"Identifier" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v6 = __UIAccessibilityCastAsClass();
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"Text" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v6 = __UIAccessibilityCastAsClass();
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"Operator" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    id v10 = __UIAccessibilityCastAsClass();
    uint64_t v7 = [v10 content];

    if ([v7 length] == 1) {
      uint64_t v11 = @"AXMUnichar";
    }
    else {
      uint64_t v11 = @"AXMContent";
    }
    [v5 setObject:v7 forKeyedSubscript:v11];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"Fenced" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v7 = __UIAccessibilityCastAsClass();
    uint64_t v12 = [v7 openString];
    [v5 setObject:v12 forKeyedSubscript:@"AXMOpenOperator"];

    BOOL v13 = [v7 closeString];
    [v5 setObject:v13 forKeyedSubscript:@"AXMCloseOperator"];

LABEL_28:
    long long v15 = [v7 expressions];
    char v16 = [a1 _processMathChildrenExpressions:v15];
    char v17 = @"AXMChildren";
LABEL_29:
    [v5 setObject:v16 forKeyedSubscript:v17];

LABEL_30:
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"Row" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v14 = __UIAccessibilityCastAsClass();
LABEL_27:
    uint64_t v7 = (void *)v14;
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"Table" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v14 = __UIAccessibilityCastAsClass();
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"TableCell" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v14 = __UIAccessibilityCastAsClass();
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"TableRow" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v14 = __UIAccessibilityCastAsClass();
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"UnderOver" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v7 = __UIAccessibilityCastAsClass();
    uint64_t v18 = [v7 baseExpression];
    uint64_t v19 = [a1 _accessibilityProcessMathExpression:v18];
    [v5 setObject:v19 forKeyedSubscript:@"AXMBaseObject"];

    uint64_t v20 = [v7 underExpression];
    char v21 = [a1 _accessibilityProcessMathExpression:v20];
    [v5 setObject:v21 forKeyedSubscript:@"AXMUnderObject"];

    long long v15 = [v7 overExpression];
    uint64_t v22 = [a1 _accessibilityProcessMathExpression:v15];
LABEL_37:
    char v16 = (void *)v22;
    char v17 = @"AXMOverObject";
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"Fraction" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v7 = __UIAccessibilityCastAsClass();
    long long v23 = [v7 numeratorExpression];
    long long v24 = [a1 _accessibilityProcessMathExpression:v23];
    [v5 setObject:v24 forKeyedSubscript:@"AXMNumeratorObject"];

    long long v15 = [v7 denimonatorExpression];
    char v16 = [a1 _accessibilityProcessMathExpression:v15];
    char v17 = @"AXMDenominatorObject";
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"SubSuperScript" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v7 = __UIAccessibilityCastAsClass();
    uint64_t v25 = [v7 baseExpression];
    CGRect v26 = [a1 _accessibilityProcessMathExpression:v25];
    [v5 setObject:v26 forKeyedSubscript:@"AXMBaseObject"];

    CGRect v27 = [v7 subscriptExpressions];
    id v28 = [a1 _processMathChildrenExpressions:v27];
    [v5 setObject:v28 forKeyedSubscript:@"AXMUnderObject"];

    long long v15 = [v7 superscriptExpressions];
    uint64_t v22 = [a1 _processMathChildrenExpressions:v15];
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"Multiscript" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v7 = __UIAccessibilityCastAsClass();
    uint64_t v29 = [v7 baseExpression];
    double v30 = [a1 _accessibilityProcessMathExpression:v29];
    [v5 setObject:v30 forKeyedSubscript:@"AXMBaseObject"];

    double v31 = [v7 prescriptExpressions];
    BOOL v32 = [a1 _processMathMultiscriptExpressions:v31];
    [v5 setObject:v32 forKeyedSubscript:@"AXMMultiscriptPrescripts"];

    long long v15 = [v7 postscriptExpressions];
    char v16 = [a1 _processMathMultiscriptExpressions:v15];
    char v17 = @"AXMMultiscriptPostscripts";
    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 setObject:@"RootOperation" forKeyedSubscript:@"AXMType"];
    objc_opt_class();
    uint64_t v7 = __UIAccessibilityCastAsClass();
    id v33 = [v7 radicandExpressions];
    long long v15 = [a1 _processMathChildrenExpressions:v33];

    id v34 = objc_opt_new();
    [v34 setObject:@"Row" forKeyedSubscript:@"AXMType"];
    [v34 setObject:v15 forKeyedSubscript:@"AXMChildren"];
    [v5 setObject:v34 forKeyedSubscript:@"AXMRadicandObject"];
    __int16 v35 = [v7 rootIndexExpression];
    int v36 = [a1 _accessibilityProcessMathExpression:v35];
    [v5 setObject:v36 forKeyedSubscript:@"AXMRootIndexObject"];

    goto LABEL_30;
  }
LABEL_9:

  return v5;
}

- (id)_processMathMultiscriptExpressions:()AXPrivCategory
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = objc_msgSend(a1, "_accessibilityProcessMathExpression:", v11, (void)v14);
          [v5 addObject:v12];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_processMathChildrenExpressions:()AXPrivCategory
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(a1, "_accessibilityProcessMathExpression:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)_accessibilityBundleIdentifier
{
  return [(id)*MEMORY[0x1E4F43630] _accessibilityBundleIdentifier];
}

- (uint64_t)_accessibilityRuntimeElementTransactionSummary
{
  return [MEMORY[0x1E4F48908] transactionSummary];
}

- (uint64_t)_accessibilityLastHitTestNearBorder
{
  return 0;
}

- (uint64_t)accessibilityFlowToElements
{
  return 0;
}

- (uint64_t)accessibilityErrorMessageElements
{
  return 0;
}

- (uint64_t)accessibilityBlockquoteLevel
{
  return 0;
}

- (uint64_t)_accessibilityOpaqueElementProvider
{
  return 0;
}

- (uint64_t)_accessibilityOverridesInstructionsHint
{
  return 0;
}

- (uint64_t)_accessibilityViewController
{
  return 0;
}

- (id)_accessibilityCurrentStatus
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v2 = [a1 safeStringForKey:@"browserAccessibilityCurrentStatus"];
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (uint64_t)_accessibilityBannerIsSticky
{
  return 0;
}

- (uint64_t)_accessibilityCanDisplayMultipleControllers
{
  return 0;
}

- (uint64_t)accessibilityARIARowIndex
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)accessibilityARIAColumnIndex
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)accessibilityRowCount
{
  uint64_t v1 = [a1 _accessibilityGetBlockForAttribute:5001];
  BOOL v2 = (void *)v1;
  if (v1)
  {
    uint64_t v3 = (*(void (**)(uint64_t))(v1 + 16))(v1);
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)accessibilityColumnCount
{
  uint64_t v1 = [a1 _accessibilityGetBlockForAttribute:5000];
  BOOL v2 = (void *)v1;
  if (v1)
  {
    uint64_t v3 = (*(void (**)(uint64_t))(v1 + 16))(v1);
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)accessibilityARIARowCount
{
  return 0;
}

- (uint64_t)accessibilityARIAColumnCount
{
  return 0;
}

- (id)_accessibilityInternalTextLinks
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v2 = 1;
  }
  else
  {
    objc_opt_class();
    int v2 = objc_opt_isKindOfClass() & 1;
  }
  objc_opt_class();
  if (v2 | objc_opt_isKindOfClass() & 1)
  {
    uint64_t v3 = [a1 safeValueForKey:@"attributedText"];
    if ([v3 length])
    {
      uint64_t v4 = [a1 _accessibilityValueForKey:@"AXLinks"];
      if (v4)
      {
        id v5 = v4;
      }
      else
      {
        id v28 = [MEMORY[0x1E4F1CA48] array];
        objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:");
        unint64_t v30 = 0;
        uint64_t v31 = 0;
        unint64_t v29 = [v3 length];
        unint64_t v6 = 0;
        uint64_t v7 = 0;
        uint64_t v8 = *MEMORY[0x1E4F42530];
        while (1)
        {
          uint64_t v9 = [v3 attributesAtIndex:v6 effectiveRange:&v30];
          id v10 = v9;
          if (v30 == 0x7FFFFFFFFFFFFFFFLL) {
            break;
          }
          uint64_t v11 = [v9 objectForKey:v8];
          if (v11)
          {
            if (v7
              && (uint64_t v12 = [(UIAccessibilityLinkSubelement *)v7 range], v12 + v13 == v30)
              && ([(UIAccessibilityLinkSubelement *)v7 url],
                  long long v14 = objc_claimAutoreleasedReturnValue(),
                  int v15 = [v14 isEqual:v11],
                  v14,
                  v15))
            {
              uint64_t v16 = [(UIAccessibilityLinkSubelement *)v7 range];
              unint64_t v17 = v31 + v30;
              uint64_t v18 = v17 - [(UIAccessibilityLinkSubelement *)v7 range];
              uint64_t v19 = v7;
              -[UIAccessibilityLinkSubelement setRange:](v19, "setRange:", v16, v18);
              uint64_t v20 = [v3 string];
              uint64_t v21 = [(UIAccessibilityLinkSubelement *)v19 range];
              long long v23 = objc_msgSend(v20, "substringWithRange:", v21, v22);
              [(UIAccessibilityLinkSubelement *)v19 setAccessibilityLabel:v23];
            }
            else
            {
              uint64_t v19 = [[UIAccessibilityLinkSubelement alloc] initWithAccessibilityContainer:a1];
              -[UIAccessibilityLinkSubelement setRange:](v19, "setRange:", v30, v31);
              long long v24 = [v3 string];
              uint64_t v25 = objc_msgSend(v24, "substringWithRange:", v30, v31);
              [(UIAccessibilityLinkSubelement *)v19 setAccessibilityLabel:v25];

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(UIAccessibilityLinkSubelement *)v19 setUrl:v11];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  CGRect v26 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
                  [(UIAccessibilityLinkSubelement *)v19 setUrl:v26];
                }
              }
              [v28 addObject:v19];
            }

            uint64_t v7 = v19;
          }
          v30 += v31;
          uint64_t v31 = 0;

          unint64_t v6 = v30;
          if (v30 == 0x7FFFFFFFFFFFFFFFLL || v30 >= v29) {
            goto LABEL_27;
          }
        }

LABEL_27:
        id v5 = v28;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_accessibilityInternalTextLinkCustomRotors
{
  v12[1] = *MEMORY[0x1E4F143B8];
  int v2 = [a1 _accessibilityInternalTextLinks];
  if ([v2 count])
  {
    uint64_t v3 = [a1 _accessibilityValueForKey:@"LinkRotor"];
    if (!v3)
    {
      objc_initWeak(&location, a1);
      id v4 = objc_alloc(MEMORY[0x1E4F426C8]);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __70__NSObject_AXPrivCategory___accessibilityInternalTextLinkCustomRotors__block_invoke;
      v8[3] = &unk_1E59B9180;
      objc_copyWeak(&v10, &location);
      id v9 = v2;
      uint64_t v3 = (void *)[v4 initWithSystemType:1 itemSearchBlock:v8];
      id v5 = [a1 _accessibilityInternalTextLinks];
      objc_msgSend(v3, "setLinkCount:", objc_msgSend(v5, "count"));

      [a1 _accessibilitySetRetainedValue:v3 forKey:@"LinkRotor"];
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    v12[0] = v3;
    unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)_accessibilityActiveKeyboard
{
  int v2 = AXUIKeyboardWindow();
  uint64_t v3 = [MEMORY[0x1E4F42B08] activeKeyboard];
  id v4 = v3;
  if (v2)
  {
    id v5 = [v3 window];

    if (v5 != v2)
    {
      _UIApplicationIsExtension();
LABEL_8:
      id v9 = NSClassFromString(&cfstr_Uiremoteview.isa);
      id v10 = NSClassFromString(&cfstr_Uiremotekeyboa.isa);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__NSObject_AXPrivCategory___accessibilityActiveKeyboard__block_invoke_2;
      v16[3] = &unk_1E59B91A8;
      id v17 = v9;
      id v18 = v10;
      id v11 = v10;
      id v12 = v9;
      uint64_t v13 = [v2 _accessibilityFindDescendant:v16];
      long long v14 = v13;
      if (v13 == a1)
      {
        id v8 = 0;
      }
      else
      {
        id v8 = [v13 _accessibilityActiveKeyboard];
      }

      goto LABEL_12;
    }
    id v8 = v4;
  }
  else
  {
    if (!_UIApplicationIsExtension())
    {
      int v2 = [(id)*MEMORY[0x1E4F43630] _accessibilityMainWindow];
      goto LABEL_8;
    }
    unint64_t v6 = NSClassFromString(&cfstr_Uiinputview.isa);
    int v2 = [(id)*MEMORY[0x1E4F43630] _accessibilityWindows];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__NSObject_AXPrivCategory___accessibilityActiveKeyboard__block_invoke;
    v19[3] = &unk_1E59B8A80;
    id v20 = v6;
    id v7 = v6;
    id v8 = [v2 _accessibilityFindSubviewDescendant:v19];
  }
LABEL_12:

  return v8;
}

- (id)_accessibilityAccessibleDescendants
{
  int v2 = +[UIAccessibilityElementTraversalOptions options];
  [v2 setLeafNodePredicate:&__block_literal_global_720];
  uint64_t v3 = [a1 _accessibilityLeafDescendantsWithOptions:v2];

  return v3;
}

- (id)_accessibilityWatchAutoSpeakElements
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = +[UIAccessibilityElementTraversalOptions options];
  [v2 setLeafNodePredicate:&__block_literal_global_722];
  uint64_t v3 = [a1 _accessibilityParentView];
  id v4 = [v3 window];

  id v5 = [v4 _accessibilityLeafDescendantsWithOptions:v2];
  unint64_t v6 = AXLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl(&dword_19F2DB000, v6, OS_LOG_TYPE_INFO, "total auto speak elements: %@", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (id)_accessibilityStringForLabelKeyValues:()AXPrivCategory
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 componentsSeparatedByString:@","];
  id v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "stringByTrimmingCharactersInSet:", v5, (void)v16);
        uint64_t v13 = [a1 safeValueForKey:v12];
        [v6 axSafelyAddObject:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  long long v14 = UIAXLabelForElements();

  return v14;
}

- (id)_accessibilityAccessibleAncestor
{
  uint64_t v1 = [a1 accessibilityContainer];
  if (v1)
  {
    do
    {
      if ([v1 isAccessibilityElement]) {
        break;
      }
      uint64_t v2 = [v1 accessibilityContainer];

      uint64_t v1 = (void *)v2;
    }
    while (v2);
  }

  return v1;
}

- (uint64_t)_accessibilityIsSoftwareKeyboardMimic
{
  return 0;
}

- (uint64_t)_accessibilitySoftwareMimicKeyboard
{
  return [a1 _accessibilityFindAncestor:&__block_literal_global_729 startWithSelf:1];
}

- (uint64_t)_accessibilityIsDictating
{
  return 0;
}

- (id)_accessibilityPrivateCustomActionsElement
{
  return objc_getAssociatedObject(a1, &__NSObjectAccessibility___accessibilityPrivateCustomActionsElement);
}

- (uint64_t)_accessibilitySetPrivateCustomActionsElement:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)_privateAccessibilityCustomActions
{
  return 0;
}

- (uint64_t)_accessibilityPerformLegacyCustomAction:()AXPrivCategory
{
  uint64_t v4 = [a3 actionIndex];

  return [a1 accessibilityPerformCustomAction:v4];
}

- (id)_retrieveCustomActionsForElement:()AXPrivCategory
{
  objc_msgSend(a1, "_accessibilitySetPrivateCustomActionsElement:");
  uint64_t v2 = [a1 _privateAccessibilityCustomActions];
  [a1 _accessibilitySetPrivateCustomActionsElement:0];
  uint64_t v3 = [a1 accessibilityCustomActions];
  uint64_t v4 = [v3 count];
  id v5 = [v3 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [MEMORY[0x1E4F1CA48] array];
    if (v4)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v9 = [v3 objectAtIndexedSubscript:i];
        if ([v9 length])
        {
          uint64_t v10 = [[UIAccessibilityLegacyCustomAction alloc] initWithName:v9 target:a1 selector:sel__accessibilityPerformLegacyCustomAction_];
          [(UIAccessibilityLegacyCustomAction *)v10 setActionIndex:i];
          [v7 addObject:v10];
        }
      }
    }
  }
  else
  {
    id v7 = v3;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C978], "axArrayWithPossiblyNilArrays:", 2, v2, v7);

  return v11;
}

- (id)_accessibilityCustomActions
{
  v23[1] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__2;
  uint64_t v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__NSObject_AXPrivCategory___accessibilityCustomActions__block_invoke;
  aBlock[3] = &unk_1E59B91D0;
  aBlock[4] = &v17;
  uint64_t v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    do
    {
      unint64_t v6 = [v5 _retrieveCustomActionsForElement:v4];
      v2[2](v2, v6);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [MEMORY[0x1E4F42FF8] viewControllerForView:v5];
        uint64_t v8 = [v7 _retrieveCustomActionsForElement:v4];

        v2[2](v2, v8);
      }
      else
      {
        uint64_t v8 = v6;
      }
      int v9 = [v4 _accessibilityShouldIncludeParentCustomActions];

      if (!v9) {
        break;
      }
      uint64_t v10 = [v5 accessibilityContainer];

      id v5 = (void *)v10;
    }
    while (v10);
  }
  uint64_t v11 = [v4 _accessibilityAddToDragSessionCustomAction];
  id v12 = (void *)v11;
  if (v11)
  {
    v23[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    v2[2](v2, v13);
  }
  [(id)v18[5] sortUsingComparator:&__block_literal_global_736];
  id v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v14;
}

- (uint64_t)_accessibilityRespondsToUserInteraction
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
    while (([v3 _accessibilityRespondsToUserInteractionForElement:v2] & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v4 = [MEMORY[0x1E4F42FF8] viewControllerForView:v3];
        char v5 = [v4 _accessibilityRespondsToUserInteractionForElement:v2];

        if (v5) {
          break;
        }
      }
      uint64_t v6 = [v3 accessibilityContainer];

      id v3 = (void *)v6;
      if (!v6) {
        goto LABEL_10;
      }
    }
    LODWORD(v6) = 1;
LABEL_10:
  }
  else
  {
    LODWORD(v6) = 0;
  }
  id v7 = [v2 _accessibilityAddToDragSessionCustomAction];
  if (v7) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v6;
  }

  return v8;
}

- (BOOL)_accessibilityRespondsToUserInteractionForElement:()AXPrivCategory
{
  id v1 = objc_msgSend(a1, "_retrieveCustomActionsForElement:");
  BOOL v2 = [v1 count] != 0;

  return v2;
}

- (uint64_t)_accessibilityRemoveTrait:()AXPrivCategory
{
  uint64_t v4 = [a1 accessibilityTraits] & ~a3;

  return [a1 setAccessibilityTraits:v4];
}

- (uint64_t)_accessibilityAddTrait:()AXPrivCategory
{
  uint64_t v4 = [a1 accessibilityTraits] | a3;

  return [a1 setAccessibilityTraits:v4];
}

- (BOOL)_accessibilityIsTouchContainer
{
  uint64_t v2 = [a1 accessibilityTraits];
  return (UIAccessibilityTraitTouchContainer & ~v2) == 0
      || [a1 accessibilityContainerType] == 4
      || [a1 accessibilityContainerType] == 14;
}

- (uint64_t)_accessibilityUserDefinedIsGuideElement
{
  return MEMORY[0x1F4106398](a1, &__NSObject___accessibilityUserDefinedIsGuideElement);
}

- (uint64_t)_accessibilitySetUserDefinedIsGuideElement:()AXPrivCategory
{
  return MEMORY[0x1F41063D0](a1, &__NSObject___accessibilityUserDefinedIsGuideElement);
}

- (uint64_t)_accessibilityIsGuideElement
{
  if ([a1 _accessibilityUserDefinedIsGuideElement]) {
    return 1;
  }
  id v3 = [a1 accessibilityContainer];
  if (v3)
  {
    do
    {
      if ([v3 accessibilityContainerType] == 3) {
        break;
      }
      uint64_t v4 = [v3 accessibilityContainer];

      id v3 = (void *)v4;
    }
    while (v4);
  }
  if ([v3 accessibilityContainerType] == 3)
  {
    char v5 = [v3 _accessibilityFindElementInDirection:1 searchType:0 allowOutOfBoundsChild:1];
    BOOL v2 = v5 == a1;
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (BOOL)_accessibilityIsMap
{
  uint64_t v1 = [a1 accessibilityTraits];
  return (UIAccessibilityTraitMap & ~v1) == 0;
}

- (uint64_t)_accessibilityTouchContainer
{
  return [a1 _accessibilityTouchContainerStartingWithSelf:1];
}

- (uint64_t)_accessibilityWindowSections
{
  return 0;
}

- (id)_accessibilityTouchContainerStartingWithSelf:()AXPrivCategory
{
  id v4 = a1;
  char v5 = v4;
  if ((a3 & 1) == 0)
  {
    uint64_t v6 = [v4 accessibilityContainer];

    char v5 = (void *)v6;
  }
  if (v5)
  {
    do
    {
      if ([v5 _accessibilityIsTouchContainer]) {
        break;
      }
      uint64_t v7 = [v5 accessibilityContainer];

      char v5 = (void *)v7;
    }
    while (v7);
  }

  return v5;
}

- (uint64_t)accessibilitySupportsTextSelection
{
  return 0;
}

- (uint64_t)_accessibilityTouchContainerShouldOutputBraille
{
  return 0;
}

- (id)_accessibilityImageData
{
  uint64_t v1 = [a1 _accessibilityValueForKey:@"AXAssetName"];
  if (v1)
  {
    BOOL v2 = [MEMORY[0x1E4F42A80] imageNamed:v1];
  }
  else
  {
    BOOL v2 = 0;
  }

  return v2;
}

- (uint64_t)_accessibilityVisiblePointHonorsScreenBounds
{
  return 0;
}

- (uint64_t)_accessibilityHitTestShouldUseWindowBounds
{
  return 0;
}

- (double)accessibilityVisibleContentRect
{
  uint64_t v1 = [a1 _accessibilityVisibleFrameClippingAncestor];
  BOOL v2 = v1;
  if (v1)
  {
    [v1 accessibilityFrame];
    double v4 = v3;
  }
  else
  {
    char v5 = [MEMORY[0x1E4F42D90] mainScreen];
    [v5 bounds];
    double v4 = v6;
  }
  return v4;
}

- (uint64_t)_accessibilityVisiblePoint
{
  BOOL v2 = AXDoesRequestingClientDeserveAutomation() != 0;

  return [a1 _accessibilityVisiblePointHitTestingAnyElement:v2];
}

- (uint64_t)_accessibilityElementIsBeingHitTested
{
  return [a1 _accessibilityBoolValueForKey:@"AXPerformingVisiblePointHitTest"];
}

- (uint64_t)_accessibilityMarkElementForVisiblePointHitTest:()AXPrivCategory
{
  _AXUIElementSetElementBeingHitTested();

  return [a1 _accessibilitySetBoolValue:a3 forKey:@"AXPerformingVisiblePointHitTest"];
}

- (double)_accessibilityVisiblePointHitTestingAnyElement:()AXPrivCategory
{
  v124[12] = *MEMORY[0x1E4F143B8];
  if (!__AXRuntimeApplicationElement())
  {
    if (a1) {
      goto LABEL_3;
    }
LABEL_10:
    [a1 accessibilityFrame];
    CGFloat x = v132.origin.x;
    CGFloat y = v132.origin.y;
    CGFloat width = v132.size.width;
    CGFloat height = v132.size.height;
    double MidX = CGRectGetMidX(v132);
    v133.origin.CGFloat x = x;
    v133.origin.CGFloat y = y;
    v133.size.CGFloat width = width;
    v133.size.CGFloat height = height;
    CGRectGetMidY(v133);
    return MidX;
  }
  char v5 = (void (*)(void))__AXRuntimeApplicationElement();
  double v6 = v5();

  if (v6 == a1) {
    goto LABEL_10;
  }
LABEL_3:
  if (_UIAXObjectIsCompletelyBehindKeyboard(a1)) {
    return -1.0;
  }
  [a1 _accessibilityMarkElementForVisiblePointHitTest:1];
  uint64_t v7 = [a1 _accessibilityUserTestingProxyView];
  [v7 _accessibilityMarkElementForVisiblePointHitTest:1];

  int v8 = [a1 _accessibilityContextId];
  [a1 _accessibilityDisplayId];
  [a1 accessibilityFrame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v14 = v13;
  double v16 = v15;
  CFTypeRef cf = (CFTypeRef)_AXRetrieveExistingAXUIElementWithElement();
  if (!cf)
  {
    long long v23 = AXLogUIA();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v119 = a1;
      _os_log_impl(&dword_19F2DB000, v23, OS_LOG_TYPE_INFO, "Element has been removed as an ax element skipping: %@", buf, 0xCu);
    }

    return -1.0;
  }
  v131.origin.CGFloat x = v10;
  v131.origin.CGFloat y = v12;
  v131.size.CGFloat width = v14;
  v131.size.CGFloat height = v16;
  if (CGRectIsEmpty(v131))
  {
    uint64_t v17 = AXLogUIA();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v119 = a1;
      _os_log_impl(&dword_19F2DB000, v17, OS_LOG_TYPE_INFO, "Element has empty frame, skipping: %@", buf, 0xCu);
    }

    CFRelease(cf);
    return -1.0;
  }
  if (__AXRuntimeApplicationElement())
  {
    uint64_t v25 = (void (*)(void))__AXRuntimeApplicationElement();
    CGRect v26 = v25();
    uint64_t v105 = _AXCreateAXUIElementWithElement();
  }
  else
  {
    uint64_t v105 = _AXCreateAXUIElementWithElement();
  }
  CFTypeRef cf2 = 0;
  [a1 accessibilityVisibleContentRect];
  double v103 = v134.size.width;
  double v104 = v134.origin.x;
  CGFloat v101 = v134.size.height;
  CGFloat v102 = v134.origin.y;
  v155.origin.CGFloat x = v10;
  v155.origin.CGFloat y = v12;
  v155.size.CGFloat width = v14;
  v155.size.CGFloat height = v16;
  CGRectIntersection(v134, v155);
  int v107 = (void *)MEMORY[0x1E4F1CAA0];
  CGRect v27 = (void *)MEMORY[0x1E4F29238];
  [a1 _accessibilityStartingPointForIsVisible];
  objc_msgSend(v27, "valueWithPoint:");
  id obja = (id)objc_claimAutoreleasedReturnValue();
  v124[0] = obja;
  id v28 = (void *)MEMORY[0x1E4F29238];
  [a1 accessibilityActivationPoint];
  id v108 = objc_msgSend(v28, "valueWithPoint:");
  v124[1] = v108;
  unint64_t v29 = (void *)MEMORY[0x1E4F29238];
  AX_CGRectGetCenter();
  v99 = objc_msgSend(v29, "valueWithPoint:");
  v124[2] = v99;
  unint64_t v30 = (void *)MEMORY[0x1E4F29238];
  AX_CGRectGetCenter();
  id v98 = objc_msgSend(v30, "valueWithPoint:");
  v124[3] = v98;
  uint64_t v31 = (void *)MEMORY[0x1E4F29238];
  v135.origin.CGFloat x = v10;
  v135.origin.CGFloat y = v12;
  v135.size.CGFloat width = v14;
  v135.size.CGFloat height = v16;
  CGFloat v32 = CGRectGetMinX(v135) + v14 * 0.100000001;
  v136.origin.CGFloat x = v10;
  v136.origin.CGFloat y = v12;
  v136.size.CGFloat width = v14;
  v136.size.CGFloat height = v16;
  double v97 = objc_msgSend(v31, "valueWithPoint:", v32, CGRectGetMinY(v136) + v16 * 0.100000001);
  v124[4] = v97;
  id v33 = (void *)MEMORY[0x1E4F29238];
  v137.origin.CGFloat x = v10;
  v137.origin.CGFloat y = v12;
  v137.size.CGFloat width = v14;
  v137.size.CGFloat height = v16;
  CGFloat v34 = CGRectGetMinX(v137) + v14 * 0.100000001;
  v138.origin.CGFloat x = v10;
  v138.origin.CGFloat y = v12;
  v138.size.CGFloat width = v14;
  v138.size.CGFloat height = v16;
  double v96 = objc_msgSend(v33, "valueWithPoint:", v34, CGRectGetMaxY(v138) - v16 * 0.100000001);
  v124[5] = v96;
  __int16 v35 = (void *)MEMORY[0x1E4F29238];
  v139.origin.CGFloat x = v10;
  v139.origin.CGFloat y = v12;
  v139.size.CGFloat width = v14;
  v139.size.CGFloat height = v16;
  CGFloat v36 = CGRectGetMaxX(v139) - v14 * 0.100000001;
  v140.origin.CGFloat x = v10;
  v140.origin.CGFloat y = v12;
  v140.size.CGFloat width = v14;
  v140.size.CGFloat height = v16;
  double v95 = objc_msgSend(v35, "valueWithPoint:", v36, CGRectGetMinY(v140) + v16 * 0.100000001);
  v124[6] = v95;
  __int16 v37 = (void *)MEMORY[0x1E4F29238];
  v141.origin.CGFloat x = v10;
  v141.origin.CGFloat y = v12;
  v141.size.CGFloat width = v14;
  v141.size.CGFloat height = v16;
  CGFloat v38 = CGRectGetMaxX(v141) - (v14 + 0.100000001);
  v142.origin.CGFloat x = v10;
  v142.origin.CGFloat y = v12;
  v142.size.CGFloat width = v14;
  v142.size.CGFloat height = v16;
  uint64_t v39 = objc_msgSend(v37, "valueWithPoint:", v38, CGRectGetMaxY(v142) - v16 * 0.100000001);
  v124[7] = v39;
  CGPoint v40 = (void *)MEMORY[0x1E4F29238];
  v143.origin.CGFloat x = v10;
  v143.origin.CGFloat y = v12;
  v143.size.CGFloat width = v14;
  v143.size.CGFloat height = v16;
  CGFloat v41 = CGRectGetMinX(v143) + 1.0;
  v144.origin.CGFloat x = v10;
  v144.origin.CGFloat y = v12;
  v144.size.CGFloat width = v14;
  v144.size.CGFloat height = v16;
  CGPoint v42 = objc_msgSend(v40, "valueWithPoint:", v41, CGRectGetMinY(v144) + 1.0);
  v124[8] = v42;
  CGSize v43 = (void *)MEMORY[0x1E4F29238];
  v145.origin.CGFloat x = v10;
  v145.origin.CGFloat y = v12;
  v145.size.CGFloat width = v14;
  v145.size.CGFloat height = v16;
  CGFloat v44 = CGRectGetMinX(v145) + 1.0;
  v146.origin.CGFloat x = v10;
  v146.origin.CGFloat y = v12;
  v146.size.CGFloat width = v14;
  v146.size.CGFloat height = v16;
  id v45 = objc_msgSend(v43, "valueWithPoint:", v44, CGRectGetMaxY(v146) + -1.0);
  v124[9] = v45;
  uint64_t v46 = (void *)MEMORY[0x1E4F29238];
  v147.origin.CGFloat x = v10;
  v147.origin.CGFloat y = v12;
  v147.size.CGFloat width = v14;
  v147.size.CGFloat height = v16;
  CGFloat v47 = CGRectGetMaxX(v147) + -1.0;
  v148.origin.CGFloat x = v10;
  v148.origin.CGFloat y = v12;
  v148.size.CGFloat width = v14;
  v148.size.CGFloat height = v16;
  long long v48 = objc_msgSend(v46, "valueWithPoint:", v47, CGRectGetMinY(v148) + 1.0);
  v124[10] = v48;
  uint64_t v49 = (void *)MEMORY[0x1E4F29238];
  v149.origin.CGFloat x = v10;
  v149.origin.CGFloat y = v12;
  v149.size.CGFloat width = v14;
  v149.size.CGFloat height = v16;
  CGFloat v50 = CGRectGetMaxX(v149) + -1.0;
  v150.origin.CGFloat x = v10;
  v150.origin.CGFloat y = v12;
  v150.size.CGFloat width = v14;
  v150.size.CGFloat height = v16;
  v51 = objc_msgSend(v49, "valueWithPoint:", v50, CGRectGetMaxY(v150) + -1.0);
  v124[11] = v51;
  double v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:12];
  id v53 = [v107 orderedSetWithArray:v52];

  if (_AXSAutomationEnabled())
  {
    double v54 = AXLogUIA();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v55 = UIAXMassageElementDescription(a1);
      v56 = [a1 accessibilityContainer];
      BOOL v57 = [a1 _accessibilityWindow];
      *(_DWORD *)buf = 138478339;
      id v119 = v55;
      __int16 v120 = 2112;
      CGFloat v121 = v56;
      __int16 v122 = 2112;
      id v123 = v57;
      _os_log_impl(&dword_19F2DB000, v54, OS_LOG_TYPE_INFO, "Performing visible point test: %{private}@, parent: %@, window: %@", buf, 0x20u);
    }
  }
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  obuint64_t j = v53;
  uint64_t v58 = [obj countByEnumeratingWithState:&v112 objects:v117 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    int v60 = a3;
    uint64_t v61 = *(void *)v113;
    double v62 = *MEMORY[0x1E4F1DAD8];
    double v63 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v64 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v109 = *MEMORY[0x1E4F1DB30];
    int v100 = v60;
    v65 = (const void *)v105;
    while (2)
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v113 != v61) {
          objc_enumerationMutation(obj);
        }
        id v67 = *(void **)(*((void *)&v112 + 1) + 8 * i);
        [v67 pointValue];
        if (v62 != v68 || v63 != v69)
        {
          CGFloat v71 = v69;
          if (v68 < 5.0) {
            double v68 = 5.0;
          }
          if (v68 >= v103 + v104 + -5.0) {
            double MidX = v103 + v104 + -5.0;
          }
          else {
            double MidX = v68;
          }
          objc_msgSend(a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", MidX, v69, v109, v64);
          CGFloat v73 = v72;
          CGFloat v75 = v74;
          if (v8)
          {
            AXConvertPointFromHostedCoordinates();
            CGFloat v73 = v76;
            CGFloat v75 = v77;
          }
          if (_AXSAutomationEnabled()) {
            _AXSMossdeepEnabled();
          }
          double v78 = AXLogUIA();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            double v79 = UIAXMassageElementDescription(a1);
            v125.CGFloat x = v73;
            v125.CGFloat y = v75;
            id v80 = NSStringFromPoint(v125);
            [v67 pointValue];
            BOOL v81 = NSStringFromPoint(v126);
            *(_DWORD *)buf = 138412802;
            id v119 = v79;
            __int16 v120 = 2112;
            CGFloat v121 = v80;
            __int16 v122 = 2112;
            id v123 = v81;
            _os_log_impl(&dword_19F2DB000, v78, OS_LOG_TYPE_INFO, "Trying pt[%@]: %@ (original: %@)", buf, 0x20u);

            v65 = (const void *)v105;
          }

          if ([a1 _accessibilityVisiblePointHonorsScreenBounds])
          {
            v151.size.CGFloat width = v103;
            v151.origin.CGFloat x = v104;
            v151.size.CGFloat height = v101;
            v151.origin.CGFloat y = v102;
            v129.CGFloat x = MidX;
            v129.CGFloat y = v71;
            if (!CGRectContainsPoint(v151, v129))
            {
              BOOL v82 = AXLogUIA();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
              {
                v152.size.CGFloat width = v103;
                v152.origin.CGFloat x = v104;
                v152.size.CGFloat height = v101;
                v152.origin.CGFloat y = v102;
                v83 = NSStringFromRect(v152);
                v127.CGFloat x = MidX;
                v127.CGFloat y = v71;
                v84 = NSStringFromPoint(v127);
                *(_DWORD *)buf = 138412546;
                id v119 = v83;
                __int16 v120 = 2112;
                CGFloat v121 = v84;
                _os_log_impl(&dword_19F2DB000, v82, OS_LOG_TYPE_INFO, "skipping point check not within screen bounds: %@ %@", buf, 0x16u);

                v65 = (const void *)v105;
              }
            }
          }
          _AXUIElementCopyElementAtPositionWithParams();
          if (cf2)
          {
            if (CFEqual(cf, cf2))
            {
              v89 = AXLogUIA();
              if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19F2DB000, v89, OS_LOG_TYPE_INFO, "Element matched start element", buf, 2u);
              }

              if (cf2)
              {
                CFRelease(cf2);
                CFTypeRef cf2 = 0;
              }
              goto LABEL_77;
            }
            int v85 = _UIAXElementForAXUIElementRef();
            v86 = AXLogUIA();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v119 = v85;
              _os_log_impl(&dword_19F2DB000, v86, OS_LOG_TYPE_INFO, "Hit testing found: %@", buf, 0xCu);
            }

            if ([v85 _accessibilityIsDescendantOfElement:a1])
            {
              BOOL v90 = AXLogUIA();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v119 = a1;
                _os_log_impl(&dword_19F2DB000, v90, OS_LOG_TYPE_INFO, "Is descendant of desired element: %@", buf, 0xCu);
              }

              if (cf2)
              {
                CFRelease(cf2);
                CFTypeRef cf2 = 0;
              }
              goto LABEL_76;
            }
            if (v100)
            {
              char v87 = [a1 _accessibilityUserTestingVisibleAncestor];
              int v88 = AXLogUIA();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v119 = v87;
                _os_log_impl(&dword_19F2DB000, v88, OS_LOG_TYPE_INFO, "Checking visible ancestor %@", buf, 0xCu);
              }

              if (v87 && [v85 _accessibilityIsDescendantOfElement:v87])
              {
                if (cf2)
                {
                  CFRelease(cf2);
                  CFTypeRef cf2 = 0;
                }

LABEL_76:
                goto LABEL_77;
              }
            }
            if (cf2)
            {
              CFRelease(cf2);
              CFTypeRef cf2 = 0;
            }
          }
        }
      }
      uint64_t v59 = [obj countByEnumeratingWithState:&v112 objects:v117 count:16];
      if (v59) {
        continue;
      }
      break;
    }
    CGFloat v71 = -1.0;
    double MidX = -1.0;
  }
  else
  {
    CGFloat v71 = -1.0;
    double MidX = -1.0;
    v65 = (const void *)v105;
  }
LABEL_77:

  [a1 _accessibilityMarkElementForVisiblePointHitTest:0];
  v91 = [a1 _accessibilityUserTestingProxyView];
  [v91 _accessibilityMarkElementForVisiblePointHitTest:0];

  if (MidX >= 0.0)
  {
    if ([a1 _accessibilityVisiblePointHonorsScreenBounds])
    {
      v153.size.CGFloat width = v103;
      v153.origin.CGFloat x = v104;
      v153.size.CGFloat height = v101;
      v153.origin.CGFloat y = v102;
      v130.CGFloat x = MidX;
      v130.CGFloat y = v71;
      if (!CGRectContainsPoint(v153, v130))
      {
        char v92 = AXLogUIA();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
        {
          v154.size.CGFloat width = v103;
          v154.origin.CGFloat x = v104;
          v154.size.CGFloat height = v101;
          v154.origin.CGFloat y = v102;
          id v93 = NSStringFromRect(v154);
          v128.CGFloat x = MidX;
          v128.CGFloat y = v71;
          v94 = NSStringFromPoint(v128);
          *(_DWORD *)buf = 138412546;
          id v119 = v93;
          __int16 v120 = 2112;
          CGFloat v121 = v94;
          _os_log_impl(&dword_19F2DB000, v92, OS_LOG_TYPE_INFO, "visible point not within screen bounds: %@ %@", buf, 0x16u);
        }
        double MidX = -1.0;
      }
    }
  }
  CFRelease(cf);
  if (v65) {
    CFRelease(v65);
  }

  return MidX;
}

- (uint64_t)_accessibilityIsVisibleByCompleteHitTest
{
  return [a1 _accessibilityIsVisibleByCompleteHitTest:1];
}

- (BOOL)_accessibilityIsVisibleByCompleteHitTest:()AXPrivCategory
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((void *)*MEMORY[0x1E4F43630] == a1) {
    return [a1 applicationState] == 0;
  }
  if (a3 && (_UIAXObjectIsCompletelyBehindKeyboard(a1) & 1) != 0) {
    return 0;
  }
  char v5 = AXLogUIA();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    double v6 = UIAXMassageElementDescription(a1);
    int v15 = 138477827;
    double v16 = v6;
    _os_log_impl(&dword_19F2DB000, v5, OS_LOG_TYPE_INFO, "Checking visibility for %{private}@", (uint8_t *)&v15, 0xCu);
  }
  [a1 _accessibilityVisiblePoint];
  double v8 = v7;
  double v10 = v9;
  double v11 = AXLogUIA();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v20.CGFloat x = v8;
    v20.CGFloat y = v10;
    CGFloat v12 = NSStringFromPoint(v20);
    double v13 = UIAXMassageElementDescription(a1);
    int v15 = 138412546;
    double v16 = v12;
    __int16 v17 = 2112;
    long long v18 = v13;
    _os_log_impl(&dword_19F2DB000, v11, OS_LOG_TYPE_INFO, "Received visible point %@ for %@{private}", (uint8_t *)&v15, 0x16u);
  }
  BOOL v14 = v8 != -1.0;
  if (v10 != -1.0) {
    BOOL v14 = 1;
  }
  return v8 > 0.0 && v14;
}

- (uint64_t)_accessibilityIsStarkElement
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v4 = [a1 window];
      if (!v4) {
        return 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        return 0;
      }
      double v4 = [a1 _accessibilityParentView];
    }
    BOOL v2 = v4;
    uint64_t v3 = [v4 _accessibilityIsStarkElement];
    goto LABEL_9;
  }
  BOOL v2 = [a1 screen];
  uint64_t v3 = [v2 _isCarScreen];
LABEL_9:
  uint64_t v5 = v3;

  return v5;
}

- (uint64_t)_accessibilityServesAsFirstElement
{
  uint64_t v1 = [a1 accessibilityUserDefinedServesAsFirstElement];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_setAccessibilityServesAsFirstElement:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"_AX_ServesAsFirstElement"];
}

- (uint64_t)_accessibilityIsNotFirstElement
{
  uint64_t v1 = [a1 accessibilityUserDefinedNotFirstElement];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_setAccessibilityIsNotFirstElement:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"_AX_NotFirstElement"];
}

- (id)_accessibilityFirstElementForFocusHonoringGroups:()AXPrivCategory
{
  if (a3)
  {
    double v4 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups];
    uint64_t v5 = [a1 _accessibilityFirstElementForFocusWithOptions:v4];
  }
  else
  {
    uint64_t v5 = [a1 _accessibilityFirstElementForFocus];
  }

  return v5;
}

- (id)_accessibilityFirstElementForFocus
{
  if (__62__NSObject_AXPrivCategory___accessibilityFirstElementForFocus__block_invoke())
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v3 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
    id v2 = [a1 _accessibilityFirstElementForFocusWithOptions:v3];
  }

  return v2;
}

- (id)_accessibilityFirstElementForFocusWithOptions:()AXPrivCategory
{
  if (__74__NSObject_AXPrivCategory___accessibilityFirstElementForFocusWithOptions___block_invoke())
  {
    id v2 = [a1 _accessibilityFirstOpaqueElement];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (uint64_t)_accessibilityFirstElement
{
  return 0;
}

- (id)_accessibilityFirstDescendant
{
  id v2 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  uint64_t v3 = [a1 _accessibilityLeafDescendantsWithCount:1 options:v2];
  double v4 = [v3 firstObject];

  return v4;
}

- (id)_accessibilityFirstWebElement
{
  id v2 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  uint64_t v3 = [v2 leafNodePredicate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__NSObject_AXPrivCategory___accessibilityFirstWebElement__block_invoke;
  v8[3] = &unk_1E59B9218;
  id v9 = v3;
  id v4 = v3;
  [v2 setLeafNodePredicate:v8];
  uint64_t v5 = [a1 _accessibilityLeafDescendantsWithCount:1 options:v2];
  double v6 = [v5 firstObject];

  return v6;
}

- (id)_accessibilityFirstContainedElementForTechnology:()AXPrivCategory honoringGroups:shouldAlwaysScroll:
{
  id v8 = a3;
  if ([a1 isAccessibilityOpaqueElementProvider])
  {
    id v9 = [a1 _accessibilityFocusAbsoluteFirstLastOpaqueElement:1 technology:v8 honorsGroups:a4 shouldAlwaysScroll:a5];
  }
  else
  {
    double v10 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
    if (a4)
    {
      double v11 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups];

      CGFloat v12 = [v11 leafNodePredicate];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      long long v18 = __111__NSObject_AXPrivCategory___accessibilityFirstContainedElementForTechnology_honoringGroups_shouldAlwaysScroll___block_invoke;
      uint64_t v19 = &unk_1E59B9240;
      NSPoint v20 = a1;
      id v21 = v12;
      id v13 = v12;
      [v11 setLeafNodePredicate:&v16];

      double v10 = v11;
    }
    BOOL v14 = objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 1, v10, v16, v17, v18, v19, v20);
    id v9 = [v14 firstObject];
  }

  return v9;
}

- (id)_accessibilityFirstElementsForSpeakThis
{
  if (_accessibilityFirstElementsForSpeakThis_onceToken != -1) {
    dispatch_once(&_accessibilityFirstElementsForSpeakThis_onceToken, &__block_literal_global_759);
  }
  id v2 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v2, sel__accessibilitySpeakThisElementsAndStrings) == (Method)_accessibilityFirstElementsForSpeakThis_speakThisElementsBaseMethod)
  {
    uint64_t v5 = +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions];
    id v4 = [a1 _accessibilityLeafDescendantsWithCount:5 options:v5];
  }
  else
  {
    uint64_t v3 = [a1 _accessibilitySpeakThisElementsAndStrings];
    id v4 = (void *)[v3 mutableCopy];

    [v4 addObject:@"SpeakThis-LegacyMethodWasUsed"];
  }

  return v4;
}

- (id)_accessibilitySpeakThisLeafDescendants
{
  id v2 = +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions];
  uint64_t v3 = [a1 _accessibilityLeafDescendantsWithOptions:v2];

  return v3;
}

- (id)_accessibilityNextElementsForSpeakThis
{
  if (_accessibilityNextElementsForSpeakThis_onceToken != -1) {
    dispatch_once(&_accessibilityNextElementsForSpeakThis_onceToken, &__block_literal_global_766);
  }
  id v2 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v2, sel__accessibilitySpeakThisElementsAndStrings);
  id v4 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v5 = [v4 _accessibilitySpeakThisViewController];

  double v6 = (objc_class *)objc_opt_class();
  Method v7 = class_getInstanceMethod(v6, sel__accessibilitySpeakThisElementsAndStrings);
  if (InstanceMethod == (Method)_accessibilityNextElementsForSpeakThis_speakThisElementsBaseMethod
    && (!v5 || v7 == (Method)_accessibilityNextElementsForSpeakThis_speakThisElementsVCBaseMethod))
  {
    double v10 = +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions];
    id v8 = [a1 _accessibilityElementsInDirectionWithCount:5 options:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_accessibilityPerformPublicCustomRotorSearch:()AXPrivCategory searchDirection:currentItem:
{
  id v7 = a5;
  id v8 = [(id)RotorCache objectForKey:a3];
  id v9 = v8;
  if (v8
    && ([v8 itemSearchBlock], double v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F426D8]);
    [v11 setCurrentItem:v7];
    [v11 setSearchDirection:a4];
    CGFloat v12 = [v9 itemSearchBlock];
    id v13 = ((void (**)(void, id))v12)[2](v12, v11);
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (__CFString)_accessibilityRotorTypeStringForCustomRotor:()AXPrivCategory
{
  if (a3 < 0x13) {
    return (__CFString *)qword_1E59B9758[a3];
  }
  if (UIAccessibilityCustomSystemRotorTypePlainText == a3) {
    return @"AXCustomSystemRotorTypePlainText";
  }
  if (UIAccessibilityCustomSystemRotorTypeColorChange == a3) {
    return @"AXCustomSystemRotorTypeColorChange";
  }
  if (UIAccessibilityCustomSystemRotorTypeFontChange == a3) {
    return @"AXCustomSystemRotorTypeFontChange";
  }
  if (UIAccessibilityCustomSystemRotorTypeStyleChange == a3) {
    return @"AXCustomSystemRotorTypeStyleChange";
  }
  if (UIAccessibilityCustomSystemRotorTypeNonVisitedLink == a3) {
    return @"AXCustomSystemRotorTypeNonVisitedLink";
  }
  if (UIAccessibilityCustomSystemRotorTypeSearchField == a3) {
    return @"AXCustomSystemRotorTypeSearchField";
  }
  if (UIAccessibilityCustomSystemRotorTypeButton == a3) {
    return @"AXCustomSystemRotorTypeButton";
  }
  if (UIAccessibilityCustomSystemRotorTypeStaticText == a3) {
    return @"AXCustomSystemRotorTypeStaticText";
  }
  if (UIAccessibilityCustomSystemRotorTypeBlockquote == a3) {
    return @"AXCustomSystemRotorTypeBlockquote";
  }
  if (UIAccessibilityCustomSystemRotorTypeSameHeading == a3) {
    return @"AXCustomSystemRotorTypeSameHeading";
  }
  if (UIAccessibilityCustomSystemRotorTypeFrame == a3) {
    return @"AXCustomSystemRotorTypeFrame";
  }
  if (UIAccessibilityCustomSystemRotorTypeSameBlockquote == a3) {
    return @"AXCustomSystemRotorTypeSameBlockquote";
  }
  if (UIAccessibilityCustomSystemRotorTypeControlElement == a3) {
    return @"AXCustomSystemRotorTypeControlElement";
  }
  if (UIAccessibilityCustomSystemRotorTypeArticle == a3) {
    return @"AXCustomSystemRotorTypeArticle";
  }
  return 0;
}

- (uint64_t)_accessibilityCustomRotorTypeForString:()AXPrivCategory
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeLink"])
  {
    uint64_t v4 = 1;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeading"])
  {
    uint64_t v4 = 3;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel1"])
  {
    uint64_t v4 = 4;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel2"])
  {
    uint64_t v4 = 5;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel3"])
  {
    uint64_t v4 = 6;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel4"])
  {
    uint64_t v4 = 7;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel5"])
  {
    uint64_t v4 = 8;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeHeadingLevel6"])
  {
    uint64_t v4 = 9;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeBoldText"])
  {
    uint64_t v4 = 10;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeItalicText"])
  {
    uint64_t v4 = 11;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeUnderlineText"])
  {
    uint64_t v4 = 12;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeMisspelledWord"])
  {
    uint64_t v4 = 13;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeImage"])
  {
    uint64_t v4 = 14;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeTextField"])
  {
    uint64_t v4 = 15;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeTable"])
  {
    uint64_t v4 = 16;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeList"])
  {
    uint64_t v4 = 17;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeLandmark"])
  {
    uint64_t v4 = 18;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypePlainText"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypePlainText;
LABEL_61:
    uint64_t v4 = *v5;
    goto LABEL_62;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeColorChange"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeColorChange;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeFontChange"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeFontChange;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeStyleChange"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeStyleChange;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeControlElement"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeControlElement;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeNonVisitedLink"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeNonVisitedLink;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeSearchField"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeSearchField;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeButton"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeButton;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeStaticText"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeStaticText;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeBlockquote"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeBlockquote;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeSameHeading"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeSameHeading;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeFrame"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeFrame;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeSameBlockquote"])
  {
    uint64_t v5 = &UIAccessibilityCustomSystemRotorTypeSameBlockquote;
    goto LABEL_61;
  }
  if ([v3 isEqualToString:@"AXCustomSystemRotorTypeArticle"]) {
    uint64_t v4 = UIAccessibilityCustomSystemRotorTypeArticle;
  }
  else {
    uint64_t v4 = 0;
  }
LABEL_62:

  return v4;
}

- (id)_accessibilityPublicCustomRotorIdForSystemType:()AXPrivCategory
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1, "_accessibilityCustomRotorTypeForString:");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend((id)RotorCache, "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v9 = [v8 targetElement];
        if ([a1 _accessibilityIsDescendantOfElement:v9])
        {
          uint64_t v10 = [v8 systemRotorType];

          if (v10 == v2)
          {
            id v11 = [v8 uuid];
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  id v11 = 0;
LABEL_13:

  return v11;
}

- (id)accessibilityHeaderElementsForColumn:()AXPrivCategory
{
  uint64_t v4 = [a1 _accessibilityGetBlockForAttribute:5004];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_accessibilityHeaderElementsForColumn:()AXPrivCategory
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__NSObject_AXPrivCategory___accessibilityHeaderElementsForColumn___block_invoke;
  v5[3] = &unk_1E59B8F80;
  v5[4] = &v6;
  void v5[5] = a3;
  [a1 accessibilityEnumerateAncestorsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)accessibilityHeaderElementsForRow:()AXPrivCategory
{
  uint64_t v4 = [a1 _accessibilityGetBlockForAttribute:5005];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_accessibilityHeaderElementsForRow:()AXPrivCategory
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  uint64_t v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__NSObject_AXPrivCategory___accessibilityHeaderElementsForRow___block_invoke;
  v5[3] = &unk_1E59B8F80;
  v5[4] = &v6;
  void v5[5] = a3;
  [a1 accessibilityEnumerateAncestorsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (uint64_t)_accessibilityPublicCustomRotorVisibleInTouchRotor:()AXPrivCategory
{
  v0 = objc_msgSend((id)RotorCache, "objectForKey:");
  uint64_t v1 = [v0 visibleInTouchRotor];

  return v1;
}

- (id)_accessibilityPublicCustomRotorName:()AXPrivCategory
{
  uint64_t v2 = objc_msgSend((id)RotorCache, "objectForKey:");
  id v3 = [v2 _accessibilityAXAttributedName];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "_accessibilityRotorTypeStringForCustomRotor:", objc_msgSend(v2, "systemRotorType"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;

  return v6;
}

- (uint64_t)_accessibilityPublicCustomRotorLinkCount:()AXPrivCategory
{
  v0 = objc_msgSend((id)RotorCache, "objectForKey:");
  uint64_t v1 = [v0 linkCount];

  return v1;
}

- (void)_addPublicRotorsToArray:()AXPrivCategory forElement:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 view];
  }
  else
  {
    id v7 = v6;
  }
  uint64_t v8 = v7;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v21 = v6;
  id v9 = [v6 accessibilityCustomRotors];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v15 = [v14 uuid];

        if (v15)
        {
          long long v16 = [v14 uuid];
          char v17 = [v5 containsObject:v16];

          if (v17) {
            continue;
          }
          uint64_t v18 = (void *)RotorCache;
          uint64_t v19 = [v14 uuid];
          [v18 setObject:v14 forKey:v19];

          [v14 setTargetElement:v8];
          NSPoint v20 = [v14 uuid];
          [v5 addObject:v20];
        }
        else
        {
          NSPoint v20 = AXLogAppAccessibility();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            CGRect v27 = v14;
            _os_log_error_impl(&dword_19F2DB000, v20, OS_LOG_TYPE_ERROR, "UIAccessibilityCustomRotor: no UUID? %@", buf, 0xCu);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v11);
  }
}

- (id)_accessibilityPublicCustomRotors
{
  if (_accessibilityPublicCustomRotors_onceToken != -1) {
    dispatch_once(&_accessibilityPublicCustomRotors_onceToken, &__block_literal_global_866);
  }
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = a1;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    do
    {
      [v4 _addPublicRotorsToArray:v2 forElement:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = [MEMORY[0x1E4F42FF8] viewControllerForView:v5];
        [v4 _addPublicRotorsToArray:v2 forElement:v6];
      }
      uint64_t v7 = [v5 _accessibilityContainerForAccumulatingCustomRotorItems];

      id v5 = (void *)v7;
    }
    while (v7);
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F43630];
  id v9 = [(id)*MEMORY[0x1E4F43630] delegate];
  [v4 _addPublicRotorsToArray:v2 forElement:v9];

  [v4 _addPublicRotorsToArray:v2 forElement:*v8];

  return v2;
}

- (id)_accessibilityCustomActionNamesAndIdentifiers
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 _accessibilityCustomActions];
  if ([v1 count])
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    CGFloat v41 = v1;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (!v3) {
      goto LABEL_30;
    }
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v46;
    while (1)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
        uint64_t v8 = [v7 _accessibilityAXAttributedName];
        uint64_t v9 = [v8 length];

        if (!v9)
        {
          long long v15 = AXLogCommon();
          if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            goto LABEL_25;
          }
          *(_DWORD *)buf = 138543362;
          double v52 = a1;
          id v33 = v15;
          CGFloat v34 = "UIAccessibilityCustomAction must have a name. Object: %{public}@";
          goto LABEL_18;
        }
        if ([v7 selector]
          || ([v7 actionHandler],
              uint64_t v10 = objc_claimAutoreleasedReturnValue(),
              v10,
              v10))
        {
          uint64_t v11 = (void *)MEMORY[0x1E4F1CA60];
          v49[0] = @"CustomActionName";
          uint64_t v12 = [v7 _accessibilityAXAttributedName];
          v49[1] = @"CustomActionIdentifier";
          v50[0] = v12;
          long long v13 = [v7 _accessibilityCustomActionIdentifier];
          v50[1] = v13;
          long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
          long long v15 = [v11 dictionaryWithDictionary:v14];

          long long v16 = [v7 image];

          if (v16)
          {
            char v17 = [v7 image];
            uint64_t v18 = UIImagePNGRepresentation(v17);
            [v15 setObject:v18 forKeyedSubscript:@"CustomActionImage"];

            uint64_t v19 = NSNumber;
            NSPoint v20 = [v7 image];
            id v21 = objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "imageOrientation"));
            [v15 setObject:v21 forKeyedSubscript:@"CustomActionImageOrientation"];
          }
          long long v22 = (void *)MEMORY[0x1E4F29238];
          [v7 activationPoint];
          v44[0] = v23;
          v44[1] = v24;
          long long v25 = [v22 valueWithBytes:v44 objCType:"{CGPoint=dd}"];
          [v15 setObject:v25 forKeyedSubscript:@"CustomActionActivationPoint"];

          CGRect v26 = [v7 _shortName];

          if (v26)
          {
            CGRect v27 = [v7 _shortName];
            [v15 setObject:v27 forKeyedSubscript:@"CustomActionShortName"];
          }
          id v28 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "ignoreWhenVoiceOverTouches"));
          [v15 setObject:v28 forKeyedSubscript:@"CustomActionIgnoreWhenVoiceOverTouches"];

          uint64_t v29 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "shouldPersistActionMenu"));
          [v15 setObject:v29 forKeyedSubscript:@"CustomActionShouldPersistActionMenu"];

          unint64_t v30 = [v7 category];
          uint64_t v31 = [v30 length];

          if (v31)
          {
            uint64_t v32 = [v7 category];
            goto LABEL_21;
          }
          __int16 v35 = [v7 localizedActionRotorCategory];

          if (v35)
          {
            uint64_t v32 = [v7 localizedActionRotorCategory];
LABEL_21:
            CGFloat v36 = (void *)v32;
            [v15 setObject:v32 forKeyedSubscript:@"CustomActionCategoryName"];
          }
          __int16 v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "sortPriority"));
          [v15 setObject:v37 forKeyedSubscript:@"CustomActionSortPriority"];

          CGFloat v38 = [v7 accessibilityLanguage];
          if (v38) {
            [v15 setObject:v38 forKeyedSubscript:@"CustomActionLanguage"];
          }
          [v43 addObject:v15];

          goto LABEL_25;
        }
        long long v15 = AXLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543362;
          double v52 = a1;
          id v33 = v15;
          CGFloat v34 = "UIAccessibilityCustomAction must have a selector or handler. Object: %{public}@";
LABEL_18:
          _os_log_fault_impl(&dword_19F2DB000, v33, OS_LOG_TYPE_FAULT, v34, buf, 0xCu);
        }
LABEL_25:

        ++v6;
      }
      while (v4 != v6);
      uint64_t v39 = [v2 countByEnumeratingWithState:&v45 objects:v53 count:16];
      uint64_t v4 = v39;
      if (!v39)
      {
LABEL_30:

        uint64_t v1 = v41;
        goto LABEL_32;
      }
    }
  }
  id v43 = 0;
LABEL_32:

  return v43;
}

- (uint64_t)_accessibilityFirstVisibleItem
{
  return 0;
}

- (id)_accessibilityVisibleItemInList
{
  uint64_t v1 = [a1 _accessibilityScrollAncestor];
  id v2 = [v1 _accessibilityFirstVisibleItem];

  return v2;
}

- (uint64_t)_setAccessibilityUpdatesOnActivationAfterDelay:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"UIAccessibilityStorageKeyUpdatesOnActivationAfterDelay"];
}

- (double)_accessibilityDelayBeforeUpdatingOnActivation
{
  int v1 = [a1 _accessibilityUpdatesOnActivationAfterDelay];
  double result = 0.0;
  if (v1)
  {
    BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
    double result = 0.1;
    if (IsVoiceOverRunning) {
      return 0.5;
    }
  }
  return result;
}

- (uint64_t)_accessibilityUpdatesOnActivationAfterDelay
{
  id v2 = [a1 _accessibilityValueForKey:@"UIAccessibilityStorageKeyUpdatesOnActivationAfterDelay"];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
  }
  else
  {
    uint64_t v5 = [a1 accessibilityTraits];
    uint64_t v4 = (*MEMORY[0x1E4F43568] & v5) != 0
      && (uint64_t v6 = [a1 accessibilityTraits], (*MEMORY[0x1E4F48DE8] & v6) != 0)
      || ((*MEMORY[0x1E4F434E0] | *MEMORY[0x1E4F43570]) & v5) != 0;
  }

  return v4;
}

- (uint64_t)_accessibilityUseElementAtPositionAfterActivation
{
  return 0;
}

- (uint64_t)_accessibilityIsStrongPasswordField
{
  return 0;
}

- (id)_accessibilityEquivalenceTag
{
  id v2 = [a1 accessibilityLabel];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 string];

    id v2 = (void *)v3;
  }
  uint64_t v4 = [a1 accessibilityValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 string];

    uint64_t v4 = (void *)v5;
  }
  uint64_t v6 = [a1 accessibilityTraits];
  uint64_t v7 = [NSString stringWithFormat:@"%@%@%lu", v2, v4, v6 & ~(*MEMORY[0x1E4F48DB0] | *MEMORY[0x1E4F48CC0] | *MEMORY[0x1E4F48C70] | *MEMORY[0x1E4F48DA8])];

  return v7;
}

- (id)_accessibilityRoleDescription
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityRoleDescription);
}

- (uint64_t)_accessibilitySetRoleDescription:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)__accessibilityRoleDescription
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([a1 safeStringForKey:@"browserAccessibilityRoleDescription"],
        id v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    uint64_t v3 = [a1 safeStringForKey:@"browserAccessibilityRoleDescription"];
  }
  else
  {
    uint64_t v3 = [a1 _accessibilityRoleDescription];
  }

  return v3;
}

- (id)_accessibilityRawIsSpeakThisElement
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityRawIsSpeakThisElement);
}

- (uint64_t)_accessibilityIsSpeakThisElement
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 _accessibilityRawIsSpeakThisElement];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
    uint64_t v5 = AXLogSpeakScreen();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[NSObject(AXPrivCategory) _accessibilityIsSpeakThisElement]();
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = [a1 accessibilityTraits];
    uint64_t v4 = ((UIAccessibilityTraitBookContent | *MEMORY[0x1E4F43550] | *MEMORY[0x1E4F434F8]) & v6) != 0
      || ((*MEMORY[0x1E4F434E0] | *MEMORY[0x1E4F434F0] | *MEMORY[0x1E4F43508] | *MEMORY[0x1E4F43538] | UIAccessibilityTraitStatusBarElement | UIAccessibilityTraitTableIndex | *MEMORY[0x1E4F43568]) & v6) == 0;
    uint64_t v5 = _AXTraitsAsString();
    uint64_t v7 = AXLogSpeakScreen();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138543874;
      uint64_t v10 = a1;
      __int16 v11 = 2114;
      uint64_t v12 = v5;
      __int16 v13 = 1024;
      int v14 = v4;
      _os_log_debug_impl(&dword_19F2DB000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ had traits %{public}@, so was speak this element: %i", (uint8_t *)&v9, 0x1Cu);
    }

    goto LABEL_12;
  }
  uint64_t v4 = [a1 onClientSide];
LABEL_13:

  return v4;
}

- (id)_accessibilitySpeakThisStringValue
{
  uint64_t v2 = [a1 accessibilityTraits];
  uint64_t v3 = v2;
  if ((*MEMORY[0x1E4F48DE8] & v2) != 0)
  {
    if (((*MEMORY[0x1E4F43500] | *MEMORY[0x1E4F43568]) & v2) != 0)
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [a1 _accessibilityAXAttributedValue];
    }
  }
  else
  {
    uint64_t v5 = [a1 _accessibilityAXAttributedValue];
    uint64_t v4 = v5;
    if ((*MEMORY[0x1E4F43568] & v3) == 0) {
      goto LABEL_13;
    }
    if ([v5 isEqualToString:@"0"])
    {
      uint64_t v6 = @"toggle.off";
    }
    else if ([v4 isEqualToString:@"1"])
    {
      uint64_t v6 = @"toggle.on";
    }
    else
    {
      if (![v4 isEqualToString:@"2"]) {
        goto LABEL_13;
      }
      uint64_t v6 = @"toggle.mixed";
    }
    uint64_t v7 = UIKitAccessibilityLocalizedString(v6);

    uint64_t v4 = (void *)v7;
  }
LABEL_13:

  return v4;
}

- (id)_accessibilitySpeakThisString
{
  uint64_t v2 = [a1 _iosAccessibilityAttributeValue:2301];
  int v3 = [v2 BOOLValue];

  if (v3)
  {
    uint64_t v4 = [a1 _iosAccessibilityAttributeValue:2302];
  }
  else
  {
    uint64_t v5 = [a1 _accessibilityAXAttributedLabel];
    uint64_t v7 = [a1 _accessibilitySpeakThisStringValue];
    uint64_t v4 = __UIAXStringForVariables();
  }

  return v4;
}

- (uint64_t)_accessibilityShouldAvoidAnnouncing
{
  return 0;
}

- (uint64_t)_accessibilityDirectTouchOptionsAttribute
{
  uint64_t v2 = [a1 accessibilityDirectTouchOptions];
  uint64_t v3 = v2 | [a1 _accessibilityShouldAvoidAnnouncing];
  uint64_t v4 = NSNumber;

  return [v4 numberWithUnsignedInteger:v3];
}

- (id)_accessibilityProcessedLabelAttribute
{
  uint64_t v2 = [a1 _accessibilityAXAttributedLabel];
  uint64_t v3 = [a1 accessibilitySpeechHint];
  if ([v3 count])
  {
    uint64_t v4 = [a1 _accessibilityAXAttributedValue];
    uint64_t v5 = [v4 length];

    if (!v5)
    {
      uint64_t v6 = [a1 _accessibilityString:v2 withSpeechHint:v3];

      uint64_t v2 = (void *)v6;
    }
  }
  uint64_t v7 = [a1 _accessibilityPostProcessValueForAutomation:v2];

  return v7;
}

- (id)_accessibilityPostProcessValueForAutomation:()AXPrivCategory
{
  id v3 = a3;
  int v4 = AXDoesRequestingClientDeserveAutomation();
  if (v3 && v4)
  {
    uint64_t v5 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\x{fffc}|\\x{2060}", &stru_1EF1680E8, 1024, 0, objc_msgSend(v3, "length"));

    id v3 = (id)v5;
  }

  return v3;
}

- (uint64_t)_accessibilitySpeakThisIgnoresAccessibilityElementStatus
{
  return 0;
}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:()AXPrivCategory
{
  if (_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken != -1) {
    dispatch_once(&_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken, &__block_literal_global_939);
  }
  int v4 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v4, a3);
  if (sel_accessibilityLabel == a3)
  {
    uint64_t v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityLabelBaseMethod;
  }
  else if (sel_accessibilityValue == a3)
  {
    uint64_t v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod;
  }
  else if (sel_accessibilityHint == a3)
  {
    uint64_t v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityHintBaseMethod;
  }
  else if (sel_accessibilityUserInputLabels == a3)
  {
    uint64_t v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityUserInputLabelsBaseMethod;
  }
  else if (sel_accessibilityAttributedLabel == a3)
  {
    uint64_t v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedLabelBaseMethod;
  }
  else if (sel_accessibilityAttributedValue == a3)
  {
    uint64_t v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod;
  }
  else if (sel_accessibilityAttributedHint == a3)
  {
    uint64_t v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedHintBaseMethod;
  }
  else
  {
    if (sel_accessibilityAttributedUserInputLabels != a3)
    {
      sel_getName(a3);
      _AXAssert();
      return 0;
    }
    uint64_t v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedUserInputLabelsBaseMethod;
  }
  return InstanceMethod != (Method)v7;
}

- (uint64_t)_accessibilityPotentiallyAttributedSelectorForNonAttributedSelector:()AXPrivCategory attributedSelector:
{
  int v7 = objc_msgSend(a1, "_accessibilityOverridesPotentiallyAttributedAPISelector:");
  if (v7 ^ 1 | [a1 _accessibilityOverridesPotentiallyAttributedAPISelector:a4]) {
    return a4;
  }
  else {
    return a3;
  }
}

- (uint64_t)impOrNullForSelector:()AXPrivCategory
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [a1 methodForSelector:a3];
}

- (uint64_t)_accessibilityAlwaysYes
{
  return 1;
}

- (uint64_t)_accessibilityAlwaysNo
{
  return 0;
}

+ (void)_accessibilityUndoAttributedDecisionCaching:()AXPrivCategory
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if ((objc_class *)objc_opt_class() == a1)
  {
    sel_getName(a2);
    _AXAssert();
  }
  if ((objc_class *)objc_opt_class() != a1)
  {
    uint64_t v4 = 0;
    v11[0] = sel__accessibilityPrefersNonAttributedLabel;
    v11[1] = sel__accessibilityPrefersNonAttributedValue;
    v11[2] = sel__accessibilityPrefersNonAttributedHint;
    do
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = (const char *)v11[v4];
      Method InstanceMethod = class_getInstanceMethod(v5, v6);
      Implementation = method_getImplementation(InstanceMethod);
      TypeEncoding = method_getTypeEncoding(InstanceMethod);
      class_replaceMethod(a1, v6, Implementation, TypeEncoding);
      ++v4;
    }
    while (v4 != 3);
    uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 removeObserver:objc_opt_class() name:*MEMORY[0x1E4FB8FA8] object:0];
  }
}

- (BOOL)_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:()AXPrivCategory nonAttributedSelector:attributedSelector:
{
  if (_accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__onceToken != -1) {
    dispatch_once(&_accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__onceToken, &__block_literal_global_970);
  }
  uint64_t v9 = [a1 _accessibilityPotentiallyAttributedSelectorForNonAttributedSelector:a4 attributedSelector:a5];
  if (objc_opt_class() != _accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__NSObjectClass)
  {
    uint64_t v10 = &selRef__accessibilityAlwaysYes;
    if (v9 != a4) {
      uint64_t v10 = &selRef__accessibilityAlwaysNo;
    }
    Method InstanceMethod = class_getInstanceMethod((Class)_accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__NSObjectClass, *v10);
    uint64_t v12 = (objc_class *)objc_opt_class();
    Implementation = method_getImplementation(InstanceMethod);
    TypeEncoding = method_getTypeEncoding(InstanceMethod);
    class_replaceMethod(v12, a3, Implementation, TypeEncoding);
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = *MEMORY[0x1E4FB8FA8];
    [v15 removeObserver:v16 name:*MEMORY[0x1E4FB8FA8] object:0];

    uint64_t v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:objc_opt_class() selector:sel__accessibilityUndoAttributedDecisionCaching_ name:v17 object:0];
  }
  return v9 == a4;
}

- (uint64_t)_accessibilityPrefersNonAttributedLabel
{
  return [a1 _accessibilityPrefersNonAttributedAttributeWithOverrideSelector:a2 nonAttributedSelector:sel_accessibilityLabel attributedSelector:sel_accessibilityAttributedLabel];
}

- (uint64_t)_accessibilityPrefersNonAttributedValue
{
  return [a1 _accessibilityPrefersNonAttributedAttributeWithOverrideSelector:a2 nonAttributedSelector:sel_accessibilityValue attributedSelector:sel_accessibilityAttributedValue];
}

- (uint64_t)_accessibilityPrefersNonAttributedHint
{
  return [a1 _accessibilityPrefersNonAttributedAttributeWithOverrideSelector:a2 nonAttributedSelector:sel_accessibilityHint attributedSelector:sel_accessibilityAttributedHint];
}

- (uint64_t)_accessibilityWarmPrefersNonAttributedLabelValueHintCache
{
  [a1 _accessibilityPrefersNonAttributedAttributeWithOverrideSelector:sel__accessibilityPrefersNonAttributedLabel nonAttributedSelector:sel_accessibilityLabel attributedSelector:sel_accessibilityAttributedLabel];
  [a1 _accessibilityPrefersNonAttributedAttributeWithOverrideSelector:sel__accessibilityPrefersNonAttributedValue nonAttributedSelector:sel_accessibilityValue attributedSelector:sel_accessibilityAttributedValue];

  return [a1 _accessibilityPrefersNonAttributedAttributeWithOverrideSelector:sel__accessibilityPrefersNonAttributedHint nonAttributedSelector:sel_accessibilityHint attributedSelector:sel_accessibilityAttributedHint];
}

+ (uint64_t)_accessibilityClearProcessedClasses:()AXPrivCategory
{
  return [(id)processedClasses removeAllObjects];
}

- (id)_accessibilityPotentiallyAttributedValueForNonAttributedSelector:()AXPrivCategory attributedSelector:
{
  if (_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__onceToken != -1) {
    dispatch_once(&_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__onceToken, &__block_literal_global_978);
  }
  if (([(id)processedClasses containsObject:objc_opt_class()] & 1) == 0)
  {
    [a1 _accessibilityWarmPrefersNonAttributedLabelValueHintCache];
    [(id)processedClasses addObject:objc_opt_class()];
  }
  if ((const char *)_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityLabelSEL == a3)
  {
    int v8 = [a1 _accessibilityPrefersNonAttributedLabel];
  }
  else if ((const char *)_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityValueSEL == a3)
  {
    int v8 = [a1 _accessibilityPrefersNonAttributedValue];
  }
  else
  {
    if ((const char *)_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityHintSEL != a3)
    {
      BOOL v7 = [a1 _accessibilityPotentiallyAttributedSelectorForNonAttributedSelector:a3 attributedSelector:a4] == (void)a3;
      goto LABEL_13;
    }
    int v8 = [a1 _accessibilityPrefersNonAttributedHint];
  }
  BOOL v7 = v8;
LABEL_13:
  if (v7) {
    [a1 a3];
  }
  else {
  uint64_t v9 = [a1 a4];
  }
  if (!v9)
  {
    if (v7) {
      [a1 a4];
    }
    else {
    uint64_t v9 = [a1 a3];
    }
  }

  return v9;
}

- (id)_accessibilityAXAttributedLabel
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:34];
  id v3 = (void *)v2;
  if (v2)
  {
    uint64_t v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v4];
LABEL_5:
    BOOL v7 = (void *)v5;
    goto LABEL_6;
  }
  uint64_t v6 = [a1 _accessibilityGetBlockForAttribute:1];
  uint64_t v4 = (void *)v6;
  if (v6)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v6 + 16))(v6);
    goto LABEL_5;
  }
  uint64_t v9 = [a1 _accessibilityPotentiallyAttributedValueForNonAttributedSelector:sel_accessibilityLabel attributedSelector:sel_accessibilityAttributedLabel];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v9];
  }
  else
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        _AXAssert();
      }
    }
    id v10 = v9;
  }
  BOOL v7 = v10;

LABEL_6:

  return v7;
}

- (id)_accessibilityAXAttributedValue
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:39];
  id v3 = (void *)v2;
  if (v2)
  {
    uint64_t v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v4];
LABEL_7:
      BOOL v7 = (void *)v5;
      goto LABEL_15;
    }
  }
  uint64_t v6 = [a1 _accessibilityGetBlockForAttribute:3];
  uint64_t v4 = (void *)v6;
  if (v6)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v6 + 16))(v6);
    goto LABEL_7;
  }
  int v8 = [a1 _accessibilityPotentiallyAttributedValueForNonAttributedSelector:sel_accessibilityValue attributedSelector:sel_accessibilityAttributedValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = (id)[objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v8];
  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        _AXAssert();
      }
    }
    id v9 = v8;
  }
  BOOL v7 = v9;

LABEL_15:

  return v7;
}

- (id)_accessibilityAXAttributedHint
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:35];
  id v3 = (void *)v2;
  if (v2)
  {
    uint64_t v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v4];
LABEL_5:
    BOOL v7 = (void *)v5;
    goto LABEL_6;
  }
  uint64_t v6 = [a1 _accessibilityGetBlockForAttribute:2];
  uint64_t v4 = (void *)v6;
  if (v6)
  {
    uint64_t v5 = (*(void (**)(uint64_t))(v6 + 16))(v6);
    goto LABEL_5;
  }
  id v9 = [a1 _accessibilityPotentiallyAttributedValueForNonAttributedSelector:sel_accessibilityHint attributedSelector:sel_accessibilityAttributedHint];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = (id)[objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v9];
  }
  else
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        _AXAssert();
      }
    }
    id v10 = v9;
  }
  BOOL v7 = v10;

LABEL_6:

  return v7;
}

- (id)_accessibilityAXAttributedUserInputLabels
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:38];
  id v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = objc_msgSend(v4, "ax_mappedArrayUsingBlock:", &__block_literal_global_987);
    goto LABEL_3;
  }
  uint64_t v5 = [a1 _accessibilityPotentiallyAttributedValueForNonAttributedSelector:sel_accessibilityUserInputLabels attributedSelector:sel_accessibilityAttributedUserInputLabels];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v5;
    BOOL v7 = [v4 firstObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v5 = objc_msgSend(v4, "ax_mappedArrayUsingBlock:", &__block_literal_global_989);
      id v9 = v4;
    }
    else
    {
      uint64_t v5 = v4;
      if (![v4 count]) {
        goto LABEL_3;
      }
      id v10 = [v4 firstObject];
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();

      uint64_t v5 = v4;
      if (v11) {
        goto LABEL_3;
      }
      id v9 = [v4 firstObject];
      objc_opt_class();
      _AXAssert();
      uint64_t v5 = v4;
    }

LABEL_3:
    goto LABEL_4;
  }
  if (v5)
  {
    objc_opt_class();
    _AXAssert();
  }
LABEL_4:

  return v5;
}

- (id)_accessibilityAXAttributedUserInputLabelsIncludingFallbacks
{
  uint64_t v2 = [a1 _accessibilityAXAttributedUserInputLabels];
  if (![v2 count])
  {
    id v3 = [a1 _accessibilityAXAttributedLabel];
    uint64_t v4 = UIAXArrayForString();

    uint64_t v2 = (void *)v4;
  }
  if (![v2 count])
  {
    uint64_t v5 = [a1 accessibilityTraits];
    if ((UIAccessibilityTraitBackButton & v5) != 0)
    {
      uint64_t v6 = UIAccessibilityBundle();
      BOOL v7 = v6;
      int v8 = @"USER_INPUT_BACK_BUTTON";
    }
    else if ((*MEMORY[0x1E4F434F0] & v5) != 0)
    {
      uint64_t v6 = UIAccessibilityBundle();
      BOOL v7 = v6;
      int v8 = @"USER_INPUT_BUTTON";
    }
    else if ((*MEMORY[0x1E4F43508] & v5) != 0)
    {
      uint64_t v6 = UIAccessibilityBundle();
      BOOL v7 = v6;
      int v8 = @"USER_INPUT_IMAGE";
    }
    else if ((*MEMORY[0x1E4F434E0] & v5) != 0)
    {
      uint64_t v6 = UIAccessibilityBundle();
      BOOL v7 = v6;
      int v8 = @"USER_INPUT_ADJUSTABLE";
    }
    else
    {
      if ((*MEMORY[0x1E4F43538] & v5) == 0)
      {
        if ((UIAccessibilityTraitTextEntry & v5) == 0)
        {
          id v9 = 0;
          goto LABEL_16;
        }
        id v9 = [a1 accessibilityValue];
        if ([v9 length])
        {
LABEL_16:
          uint64_t v10 = UIAXArrayForString();

          uint64_t v2 = (void *)v10;
          goto LABEL_17;
        }
        BOOL v7 = UIAccessibilityBundle();
        uint64_t v12 = [v7 localizedStringForKey:@"USER_INPUT_TEXT" value:&stru_1EF1680E8 table:@"Localized"];

        id v9 = (void *)v12;
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v6 = UIAccessibilityBundle();
      BOOL v7 = v6;
      int v8 = @"USER_INPUT_SEARCH";
    }
    id v9 = [v6 localizedStringForKey:v8 value:&stru_1EF1680E8 table:@"Localized"];
    goto LABEL_15;
  }
LABEL_17:

  return v2;
}

- (uint64_t)accessibilitySemanticGroupChildrentCount
{
  uint64_t result = [a1 accessibilityElementCount];
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = [a1 accessibilityElements];
    uint64_t v4 = [v3 count];

    return v4;
  }
  return result;
}

- (uint64_t)_accessibilityIncludeRoleInGroupNavigationOnly
{
  return 0;
}

- (uint64_t)_accessibilityIncludeRoleDescription
{
  return 0;
}

- (uint64_t)_accessibilityForegroundTextColorAttribute
{
  return 0;
}

- (uint64_t)_accessibilityBackgroundTextColorAttribute
{
  return 0;
}

- (uint64_t)_accessibilityIsGroupedParent
{
  uint64_t v2 = [a1 accessibilityContainerType];
  if (!v2) {
    return 0;
  }
  if ((v2 & 0xFFFFFFFFFFFFFFF7) != 4) {
    return 1;
  }
  id v3 = [a1 accessibilityLabel];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [a1 _accessibilityRoleDescription];
    BOOL v4 = [v5 length] != 0;
  }
  return v4;
}

- (uint64_t)_accessibilitySetElementHelp:()AXPrivCategory
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"AXElementHelp"];
}

- (uint64_t)_accessibilityElementHelp
{
  return [a1 _accessibilityValueForKey:@"AXElementHelp"];
}

- (uint64_t)_axNavigationalGroupParentOfChild:()AXPrivCategory
{
  return [a3 _accessibilityGroupedParent];
}

- (id)_accessibilityGroupedParent
{
  if (AXDoesRequestingClientDeserveAutomation()) {
    [a1 _accessibilityUserTestingParent];
  }
  else {
  id v2 = [a1 _accessibilityFindAncestor:&__block_literal_global_1018 startWithSelf:0];
  }
  id v3 = v2;
  if (v2)
  {
    BOOL v4 = [v2 _accessibilityGroupedParent];

    if (v4)
    {
      do
      {
        if (([v4 accessibilityIsWindow] & 1) == 0)
        {
          id v5 = v4;

          id v3 = v5;
        }
        uint64_t v6 = [v4 _accessibilityGroupedParent];

        BOOL v4 = (void *)v6;
      }
      while (v6);
    }
  }

  return v3;
}

- (id)_accessibilityChildrenForContinuityDisplay
{
  id v2 = +[UIAccessibilityElementTraversalOptions defaultContinuityDisplayOptions];
  id v3 = [a1 _accessibilityLeafDescendantsWithCount:0 options:v2];
  if ([v3 count] == 1)
  {
    BOOL v4 = [v3 firstObject];

    if (v4 == a1)
    {
      uint64_t v5 = [MEMORY[0x1E4F1C978] array];

      id v3 = (void *)v5;
    }
  }
  uint64_t v6 = AXLogElementTraversal();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(AXPrivCategory) _accessibilityChildrenForContinuityDisplay]();
  }

  return v3;
}

- (id)_accessibilityProcessChildrenForParameter:()AXPrivCategory
{
  id v4 = a3;
  if (AXDoesRequestingClientDeserveAutomation())
  {
    uint64_t v5 = [a1 automationElements];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F48898]];
      int v7 = [v6 BOOLValue];
    }
    else
    {
      int v7 = 0;
    }
    int v8 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
    if (v7)
    {
      id v9 = [a1 _accessibilityGroupedParent];
      uint64_t v10 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups];

      char v11 = [v10 leafNodePredicate];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __70__NSObject_AXPrivCategory___accessibilityProcessChildrenForParameter___block_invoke;
      v16[3] = &unk_1E59B9288;
      id v17 = v9;
      id v18 = v11;
      void v16[4] = a1;
      id v12 = v9;
      id v13 = v11;
      [v10 setLeafNodePredicate:v16];

      int v8 = v10;
    }
    uint64_t v5 = [a1 _accessibilityLeafDescendantsWithCount:0 options:v8];
    int v14 = AXLogElementTraversal();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[NSObject(AXPrivCategory) _accessibilityProcessChildrenForParameter:]();
    }
  }

  return v5;
}

- (id)_accessibilityProcessElementsInDirection:()AXPrivCategory forParameter:
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v7 = [v6 unsignedIntegerValue];
    int v8 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v6 objectForKey:*MEMORY[0x1E4F48890]];
      unint64_t v7 = [v9 unsignedIntegerValue];

      uint64_t v10 = [v6 objectForKey:*MEMORY[0x1E4F48898]];
      int v8 = [v10 BOOLValue];

      char v11 = [v6 objectForKey:*MEMORY[0x1E4F488A8]];
      id v12 = v11;
      if (v11) {
        objc_msgSend(a1, "_accessibilitySetVoiceOverRTLOverride:", objc_msgSend(v11, "integerValue"));
      }
    }
    else
    {
      int v8 = 0;
      unint64_t v7 = 0;
    }
  }
  if (v7 >= 0x3E8) {
    uint64_t v13 = 1000;
  }
  else {
    uint64_t v13 = v7;
  }
  uint64_t v14 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  uint64_t v15 = (void *)v14;
  if (v8)
  {
    uint64_t v16 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups];

    uint64_t v17 = [a1 _accessibilityGroupedParent];
    id v18 = (void *)v17;
    if (v17)
    {
      v33[0] = v17;
      uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
      [v16 setAllowedElementsForTraversal:v19];
    }
  }
  else
  {
    uint64_t v16 = (void *)v14;
  }
  if (AXRequestingClient() == 11)
  {
    uint64_t v20 = +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions];

    uint64_t v16 = (void *)v20;
  }
  if (a3 == 92502) {
    [v16 setDirection:2];
  }
  id v21 = [a1 _accessibilityElementsInDirectionWithCount:v13 options:v16];
  long long v22 = AXLogElementTraversal();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = @"next";
    int v25 = 138413059;
    if (a3 == 92502) {
      uint64_t v24 = @"previous";
    }
    CGRect v26 = v24;
    __int16 v27 = 2113;
    id v28 = a1;
    __int16 v29 = 1024;
    int v30 = v13;
    __int16 v31 = 2113;
    uint64_t v32 = v21;
    _os_log_debug_impl(&dword_19F2DB000, v22, OS_LOG_TYPE_DEBUG, "*** Returning %@ elements for %{private}@ with count %u: %{private}@", (uint8_t *)&v25, 0x26u);
  }

  return v21;
}

- (id)_iosAccessibilityAttributeValue:()AXPrivCategory forParameter:
{
  v336[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  unint64_t v7 = v6;
  if (a3 <= 95000)
  {
    if (a3 > 92699)
    {
      switch(a3)
      {
        case 94000:
          [a1 accessibilityBoundsForTextMarkers:v6];
          goto LABEL_228;
        case 94001:
          id v18 = [a1 accessibilityArrayOfTextForTextMarkers:v6];
          uint64_t v178 = [v18 count];
          if (v178 >= 1)
          {
            uint64_t v179 = v178;
            for (uint64_t i = 0; i != v179; ++i)
            {
              v181 = [v18 objectAtIndex:i];
              if (([v181 isAccessibilityElement] & 1) != 0
                || (NSClassFromString(&cfstr_Webaccessibili.isa), (objc_opt_isKindOfClass() & 1) != 0))
              {
                v182 = (const void *)_AXCreateAXUIElementWithElement();
                [v18 replaceObjectAtIndex:i withObject:v182];
                CFRelease(v182);
              }
            }
          }
          goto LABEL_232;
        case 94002:
          uint64_t v17 = [a1 _accessibilityLineStartMarker:v6];
          break;
        case 94003:
          uint64_t v17 = [a1 _accessibilityLineEndMarker:v6];
          break;
        case 94004:
          uint64_t v17 = [a1 _accessibilityNextMarker:v6];
          break;
        case 94005:
          uint64_t v17 = [a1 _accessibilityPreviousMarker:v6];
          break;
        case 94006:
          uint64_t v76 = [a1 _accessibilityObjectForTextMarker:v6];
          goto LABEL_185;
        case 94007:
          [v6 CGPointValue];
          uint64_t v17 = objc_msgSend(a1, "_accessibilityMarkerForPoint:", UIAccessibilitySceneReferencePointToScreenPoint(v183, v184));
          break;
        case 94008:
          uint64_t v17 = [a1 accessibilityStringForTextMarkers:v6];
          break;
        case 94009:
          uint64_t v63 = objc_msgSend(a1, "_accessibilityLineRangeForPosition:", objc_msgSend(v6, "unsignedIntegerValue"));
          goto LABEL_230;
        case 94010:
          objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
          id EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
          long long v326 = 0u;
          long long v327 = 0u;
          long long v328 = 0u;
          long long v329 = 0u;
          id v185 = v7;
          uint64_t v186 = [v185 countByEnumeratingWithState:&v326 objects:v333 count:16];
          if (v186)
          {
            uint64_t v187 = v186;
            uint64_t v188 = *(void *)v327;
            do
            {
              for (uint64_t j = 0; j != v187; ++j)
              {
                if (*(void *)v327 != v188) {
                  objc_enumerationMutation(v185);
                }
                v190 = (void *)MEMORY[0x1E4F29238];
                [*(id *)(*((void *)&v326 + 1) + 8 * j) CGPointValue];
                v193 = objc_msgSend(v190, "valueWithCGPoint:", UIAccessibilitySceneReferencePointToScreenPoint(v191, v192));
                [EventForSceneReferencePoint addObject:v193];
              }
              uint64_t v187 = [v185 countByEnumeratingWithState:&v326 objects:v333 count:16];
            }
            while (v187);
          }

          uint64_t v30 = [a1 _accessibilityMarkersForPoints:EventForSceneReferencePoint];
          goto LABEL_256;
        case 94011:
          uint64_t v17 = [a1 _accessibilityMarkerLineEndsForMarkers:v6];
          break;
        case 94012:
          uint64_t v63 = [a1 _accessibilityRangeForTextMarker:v6];
          goto LABEL_230;
        case 94013:
          [a1 _accessibilityMoveSelectionToMarker:v6];
          goto LABEL_233;
        case 94014:
          uint64_t v194 = [v6 rangeValue];
          uint64_t v17 = objc_msgSend(a1, "_accessibilityMarkersForRange:", v194, v195);
          break;
        case 94015:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 count] != 3) {
            _AXAssert();
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 count] != 3) {
            goto LABEL_233;
          }
          id v196 = v7;
          v197 = [v196 objectAtIndexedSubscript:1];
          uint64_t v198 = [v197 integerValue];
          v199 = [v196 objectAtIndexedSubscript:2];
          uint64_t v200 = [v199 unsignedIntegerValue];
          v201 = [v196 objectAtIndexedSubscript:0];

          uint64_t v202 = objc_msgSend(a1, "_accessibilityPositionInDirection:offset:forPosition:", v198, v200, objc_msgSend(v201, "unsignedIntegerValue"));
          uint64_t v17 = [NSNumber numberWithUnsignedInteger:v202];
          break;
        case 94016:
          uint64_t v63 = objc_msgSend(a1, "_accessibilityCharacterRangeForPosition:", objc_msgSend(v6, "unsignedIntegerValue"));
          goto LABEL_230;
        case 94017:
          uint64_t v63 = [a1 _accessibilityRangeForTextMarkers:v6];
          goto LABEL_230;
        default:
          switch(a3)
          {
            case 92700:
              [v6 pointValue];
              double v20 = v19;
              double v22 = v21;
              id EventForSceneReferencePoint = [a1 _accessibilityParentView];
              uint64_t v23 = [EventForSceneReferencePoint window];
              objc_msgSend(v23, "convertPoint:toView:", EventForSceneReferencePoint, v20, v22);
              double v25 = v24;
              double v27 = v26;

              uint64_t v28 = objc_msgSend(a1, "accessibilityLineNumberForPoint:", v25, v27);
              if (v28 == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v29 = 0x7FFFFFFFLL;
              }
              else {
                uint64_t v29 = v28;
              }
              uint64_t v30 = [NSNumber numberWithInteger:v29];
              goto LABEL_256;
            case 92701:
              int v206 = [v6 intValue];
              if (v206 == 0x7FFFFFFF) {
                uint64_t v207 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v207 = v206;
              }
              [a1 accessibilityFrameForLineNumber:v207];
              goto LABEL_228;
            case 92702:
              uint64_t v208 = (int)[v6 intValue];
              if (objc_opt_respondsToSelector())
              {
                id v18 = [a1 accessibilityAttributedContentForLineNumber:v208];
                if (v18) {
                  goto LABEL_237;
                }
              }
              uint64_t v17 = [a1 accessibilityContentForLineNumber:v208];
              break;
            case 92703:
              uint64_t v209 = [v6 rangeValue];
              objc_msgSend(a1, "_accessibilityFrameForRange:", v209, v210);
              goto LABEL_228;
            case 92704:
              uint64_t v63 = objc_msgSend(a1, "_accessibilityRangeForLineNumber:", (int)objc_msgSend(v6, "intValue"));
              goto LABEL_230;
            default:
              if (a3 != 94500) {
                goto LABEL_233;
              }
              uint64_t v49 = [v6 objectAtIndexedSubscript:0];
              uint64_t v50 = [v49 BOOLValue];

              v51 = [v7 objectAtIndexedSubscript:1];
              uint64_t v52 = [v51 BOOLValue];

              uint64_t v17 = [a1 _accessibilityScannerElementsGrouped:v50 shouldIncludeNonScannerElements:v52];
              goto LABEL_231;
          }
          break;
      }
LABEL_231:
      id v18 = (void *)v17;
      goto LABEL_232;
    }
    if (a3 <= 92599)
    {
      switch(a3)
      {
        case 92500:
          *(void *)buf = [v6 rangeValue];
          *(void *)&buf[8] = v53;
          uint64_t v17 = [a1 accessibilityLabelForRange:buf];
          goto LABEL_231;
        case 92501:
        case 92502:
LABEL_12:
          uint64_t v17 = [a1 _accessibilityProcessElementsInDirection:a3 forParameter:v6];
          goto LABEL_231;
        case 92503:
          [v6 pointValue];
          double v55 = v54;
          double v57 = v56;
          uint64_t v58 = [a1 _accessibilityParentView];
          uint64_t v59 = [v58 window];
          double v60 = AXConvertFromDisplayPointToWindowPoint(v59, v55, v57);
          double v62 = v61;

          uint64_t v17 = objc_msgSend(a1, "_accessibilityLineNumberAndColumnForPoint:", v60, v62);
          goto LABEL_231;
        case 92504:
          uint64_t v63 = [a1 _accessibilityRangeForLineNumberAndColumn:v6];
LABEL_230:
          uint64_t v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v63, v64);
          goto LABEL_231;
        case 92505:
          *(void *)buf = [v6 rangeValue];
          *(void *)&buf[8] = v65;
          uint64_t v17 = [a1 _accessibilityValueForRange:buf];
          goto LABEL_231;
        case 92506:
          uint64_t v66 = [v6 rangeValue];
          objc_msgSend(a1, "_accessibilityBoundsForRange:", v66, v67);
LABEL_228:
          objc_msgSend(a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
          uint64_t v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
          goto LABEL_231;
        case 92507:
        case 92514:
          goto LABEL_233;
        case 92508:
          *(void *)buf = [v6 rangeValue];
          *(void *)&buf[8] = v68;
          uint64_t v17 = [a1 _accessibilityAttributedValueForRange:buf];
          goto LABEL_231;
        case 92509:
          double v69 = NSNumber;
          uint64_t v70 = objc_msgSend(a1, "_accessibilityIsFirstSiblingForType:", (int)objc_msgSend(v6, "intValue"));
          goto LABEL_66;
        case 92510:
          double v69 = NSNumber;
          uint64_t v70 = objc_msgSend(a1, "_accessibilityIsLastSiblingForType:", (int)objc_msgSend(v6, "intValue"));
LABEL_66:
          uint64_t v17 = [v69 numberWithBool:v70];
          goto LABEL_231;
        case 92511:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 count] != 2) {
            goto LABEL_233;
          }
          id EventForSceneReferencePoint = [v7 objectAtIndex:0];
          uint64_t v71 = [EventForSceneReferencePoint unsignedIntegerValue];
          uint64_t v13 = [v7 objectAtIndex:1];
          uint64_t v16 = objc_msgSend(a1, "accessibilityElementForRow:andColumn:", v71, -[NSObject unsignedIntegerValue](v13, "unsignedIntegerValue"));
          goto LABEL_248;
        case 92512:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_233;
          }
          [v7 pointValue];
          double v73 = v72;
          double v75 = v74;
          id EventForSceneReferencePoint = (id)UIAccessibilityCreateEventForSceneReferencePoint(0, v72, v74);
          id v18 = 0;
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_257;
          }
          [EventForSceneReferencePoint _setAccessibilityHitTestStartsAtElement:a1];
LABEL_170:
          uint64_t v30 = objc_msgSend(a1, "_accessibilityHitTest:withEvent:", EventForSceneReferencePoint, v73, v75);
          goto LABEL_256;
        case 92513:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_233;
          }
          [v7 pointValue];
          uint64_t v17 = objc_msgSend(a1, "_accessibilityDataDetectorScheme:");
          goto LABEL_231;
        case 92515:
          uint64_t v76 = objc_msgSend(a1, "_accessibilityAncestorForSiblingsWithType:", (int)objc_msgSend(v6, "intValue"));
LABEL_185:
          id EventForSceneReferencePoint = (id)v76;
          uint64_t v30 = _AXCreateAXUIElementWithElement();
          goto LABEL_256;
        case 92516:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_233;
          }
          uint64_t v17 = [a1 _accessibilityElementsForSearchParameter:v7];
          goto LABEL_231;
        case 92517:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (unint64_t)[v7 count] < 5
            || (unint64_t)[v7 count] >= 8)
          {
LABEL_250:
            _AXAssert();
            goto LABEL_233;
          }
          id EventForSceneReferencePoint = [v7 objectAtIndex:0];
          objc_opt_class();
          id v18 = 0;
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_257;
          }
          double v77 = [v7 objectAtIndex:1];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            double v79 = [v7 objectAtIndex:1];
            uint64_t v307 = [v79 integerValue];
          }
          else
          {
            uint64_t v307 = 0;
          }
          v272 = [v7 objectAtIndex:2];
          objc_opt_class();
          char v273 = objc_opt_isKindOfClass();

          if (v273)
          {
            v274 = [v7 objectAtIndex:2];
            uint64_t v275 = [v274 rangeValue];
            uint64_t v305 = v276;
          }
          else
          {
            uint64_t v305 = 0;
            uint64_t v275 = 0x7FFFFFFFLL;
          }
          uint64_t v13 = [v7 objectAtIndex:3];
          if ((unint64_t)[v7 count] < 5)
          {
            char v278 = 1;
          }
          else
          {
            v277 = [v7 objectAtIndex:4];
            char v278 = [v277 BOOLValue];
          }
          if ((unint64_t)[v7 count] < 6)
          {
            char v280 = 0;
          }
          else
          {
            v279 = [v7 objectAtIndex:5];
            char v280 = [v279 BOOLValue];
          }
          if ((unint64_t)[v7 count] < 7)
          {
            v281 = 0;
          }
          else
          {
            v281 = [v7 objectAtIndex:6];
          }
          BYTE1(v298) = v280;
          LOBYTE(v298) = v278;
          id v18 = objc_msgSend(a1, "_accessibilityNextOpaqueElementsForTechnology:startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:", v13, v281, (int)objc_msgSend(EventForSceneReferencePoint, "intValue"), v307, v275, v305, v298);
          v282 = AXLogElementTraversal();
          if (os_log_type_enabled(v282, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = a1;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v18;
            _os_log_impl(&dword_19F2DB000, v282, OS_LOG_TYPE_INFO, "Next opaque element of %@: %@", buf, 0x16u);
          }

          break;
        default:
          if (a3 != 91512) {
            goto LABEL_233;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_233;
          }
          uint64_t v17 = [a1 _accessibilityRemoteElementForSceneID:v7];
          goto LABEL_231;
      }
LABEL_249:

LABEL_257:
      goto LABEL_232;
    }
    if (a3 == 92600)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count] == 2)
      {
        id EventForSceneReferencePoint = v7;
        v216 = [EventForSceneReferencePoint objectAtIndexedSubscript:0];
        uint64_t v217 = [v216 rangeValue];
        uint64_t v219 = v218;

        uint64_t v13 = [EventForSceneReferencePoint objectAtIndexedSubscript:1];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v16 = [a1 _accessibilityCellWithRowIndex:v217 column:v219 containingView:v13];
LABEL_248:
          id v18 = (void *)v16;
        }
        else
        {
          v261 = [MEMORY[0x1E4F483A0] sharedInstance];
          char v262 = [v261 ignoreLogging];

          if ((v262 & 1) == 0)
          {
            v263 = [MEMORY[0x1E4F483A0] identifier];
            v264 = AXLoggerForFacility();

            os_log_type_t v265 = AXOSLogLevelFromAXLogLevel();
            if (os_log_type_enabled(v264, v265))
            {
              v266 = AXColorizeFormatLog();
              v267 = _AXStringForArgs();
              if (os_log_type_enabled(v264, v265))
              {
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v267;
                _os_log_impl(&dword_19F2DB000, v264, v265, "%{public}@", buf, 0xCu);
              }
            }
          }
LABEL_312:
          id v18 = 0;
        }
        goto LABEL_249;
      }
    }
    else if (a3 == 92601)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v7 CGRectValue];
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        id EventForSceneReferencePoint = [MEMORY[0x1E4F42D90] mainScreen];
        uint64_t v39 = [EventForSceneReferencePoint coordinateSpace];
        CGPoint v40 = [EventForSceneReferencePoint fixedCoordinateSpace];
        objc_msgSend(v39, "convertRect:toCoordinateSpace:", v40, v32, v34, v36, v38);
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;

        uint64_t v30 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v42, v44, v46, v48);
LABEL_256:
        id v18 = (void *)v30;
        goto LABEL_257;
      }
    }
LABEL_233:
    if (AXAttributeAllowsRequeryWhenRemoteElementFails()
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v211 = [v7 objectForKey:@"IgnoreRemoteElement"];
      v212 = (void *)_UIAccessibilityIgnoredRemoteElementForQuery;
      _UIAccessibilityIgnoredRemoteElementForQuerdouble y = (uint64_t)v211;
      id v213 = v211;

      id v18 = [a1 _iosAccessibilityAttributeValue:a3];
      v214 = (void *)_UIAccessibilityIgnoredRemoteElementForQuery;
      _UIAccessibilityIgnoredRemoteElementForQuerdouble y = 0;
    }
    else
    {
      id v18 = 0;
    }
    goto LABEL_237;
  }
  if (a3 <= 95216)
  {
    id v18 = 0;
    switch(a3)
    {
      case 95001:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_233;
        }
        uint64_t v17 = [a1 _accessibilityKeyboardKeyForString:v7];
        goto LABEL_231;
      case 95002:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_233;
        }
        CGRect v155 = NSNumber;
        uint64_t v156 = [a1 _accessibilityIndexForPickerString:v7];
LABEL_211:
        uint64_t v17 = [v155 numberWithInteger:v156];
        goto LABEL_231;
      case 95003:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_233;
        }
        uint64_t v203 = [v7 rangeValue];
        uint64_t v17 = objc_msgSend(a1, "_accessibilityUserTestingChildrenWithRange:", v203, v204);
        goto LABEL_231;
      case 95004:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_233;
        }
        v205 = (void *)MEMORY[0x1E4F29238];
        [v7 CGPointValue];
        uint64_t v17 = objc_msgSend(v205, "valueWithPoint:");
        goto LABEL_231;
      case 95005:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_233;
        }
        uint64_t v17 = [a1 _accessibilityAuditIssuesWithOptions:v7];
        goto LABEL_231;
      case 95006:
        goto LABEL_268;
      case 95007:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v7 pointValue];
          objc_msgSend(a1, "_accessibilitySetStartingPointForIsVisible:");
          id v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_accessibilityIsVisibleByCompleteHitTest"));
          objc_msgSend(a1, "_accessibilitySetStartingPointForIsVisible:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
        }
        else
        {
          id v18 = 0;
        }
LABEL_268:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v231 = [a1 _accessibilityUserTestingSnapshotWithOptions:v7];

          id v18 = (void *)v231;
        }
        break;
      default:
        goto LABEL_233;
    }
    goto LABEL_232;
  }
  switch(a3)
  {
    case 95217:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 count] != 2) {
        goto LABEL_233;
      }
      id EventForSceneReferencePoint = [v7 objectAtIndex:0];
      [EventForSceneReferencePoint pointValue];
      double v10 = v9;
      double v12 = v11;
      uint64_t v13 = [v7 objectAtIndex:1];
      [v13 floatValue];
      LODWORD(v15) = v14;
      uint64_t v16 = objc_msgSend(a1, "_accessibilityUpcomingRoadsForPoint:forAngle:", v10, v12, v15);
      goto LABEL_248;
    case 95218:
      double v69 = NSNumber;
      [v6 pointValue];
      uint64_t v70 = objc_msgSend(a1, "_accessibilityRoadContainsTrackingPoint:");
      goto LABEL_66;
    case 95219:
      [v6 pointValue];
      uint64_t v17 = objc_msgSend(a1, "_accessibilityMapDetailedInfoAtPoint:");
      goto LABEL_231;
    case 95220:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 count] != 2) {
        goto LABEL_233;
      }
      id v80 = [v7 objectAtIndex:0];
      [v80 pointValue];
      double v82 = v81;
      double v84 = v83;
      int v85 = [v7 objectAtIndex:1];
      [v85 floatValue];
      LODWORD(v87) = v86;
      objc_msgSend(a1, "_accessibilityDistanceFromEndOfRoad:forAngle:", v82, v84, v87);
      LODWORD(v82) = v88;

      LODWORD(v89) = LODWORD(v82);
      uint64_t v90 = [NSNumber numberWithFloat:v89];
      goto LABEL_266;
    case 95221:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v69 = NSNumber;
        uint64_t v70 = objc_msgSend(a1, "_accessibilityCanPerformAction:", objc_msgSend(v7, "intValue"));
        goto LABEL_66;
      }
      id v18 = (void *)MEMORY[0x1E4F1CC28];
      goto LABEL_237;
    case 95222:
    case 95253:
    case 95254:
    case 95256:
    case 95257:
      goto LABEL_233;
    case 95223:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v7 count] != 3) {
        goto LABEL_233;
      }
      v91 = [v7 objectAtIndex:2];
      id EventForSceneReferencePoint = (id)_AXCreateAXUIElementWithElement();

      char v92 = [v7 objectAtIndex:0];
      [v92 pointValue];
      objc_msgSend(a1, "_accessibilityScreenPointForSceneReferencePoint:");
      double v94 = v93;
      double v96 = v95;

      double v97 = NSNumber;
      uint64_t v13 = [v7 objectAtIndex:1];
      [v13 floatValue];
      LODWORD(v99) = v98;
      objc_msgSend(a1, "_accessibilityDistance:forAngle:toRoad:", EventForSceneReferencePoint, v94, v96, v99);
      uint64_t v16 = objc_msgSend(v97, "numberWithFloat:");
      goto LABEL_248;
    case 95224:
      if (![a1 _accessibilitySpeakThisCanBeHighlighted]) {
        goto LABEL_233;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      int v100 = [v7 objectForKey:@"speakThisRangeInElement"];
      id EventForSceneReferencePoint = v100;
      if (v100)
      {
        v308 = v100;
        NSUInteger v101 = [v100 rangeValue];
        NSUInteger v103 = v102;
        uint64_t v104 = [v7 objectForKey:@"speakThisCurrentString"];
        uint64_t v105 = AXLogSpeakScreen();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
        {
          v338.id location = v101;
          v338.length = v103;
          -[NSObject(AXPrivCategory) _iosAccessibilityAttributeValue:forParameter:]((int)a1, v338);
        }

        uint64_t v106 = [v7 objectForKey:@"speakThisWantsSentenceRects"];
        uint64_t v107 = [v106 BOOLValue];

        [a1 _accessibilitySetBoolValue:0 forKey:@"AXSpeakScreenRectsUseVisibleFrame"];
        id v108 = objc_msgSend(a1, "_accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:", v101, v103, v104, v107);
        double v109 = [v7 objectForKey:@"speakThisIgnoreScrollToVisible"];
        char v110 = [v109 BOOLValue];

        if ([a1 _accessibilitySpeakThisShouldScrollTextRects]
          && (v110 & 1) == 0
          && [v108 count])
        {
          NSUInteger v300 = v103;
          NSUInteger v302 = v101;
          double x = *MEMORY[0x1E4F1DB20];
          double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
          double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
          double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
          long long v324 = 0u;
          long long v325 = 0u;
          long long v322 = 0u;
          long long v323 = 0u;
          id v115 = v108;
          uint64_t v116 = [v115 countByEnumeratingWithState:&v322 objects:v332 count:16];
          if (v116)
          {
            uint64_t v117 = v116;
            uint64_t v118 = *(void *)v323;
            do
            {
              for (uint64_t k = 0; k != v117; ++k)
              {
                if (*(void *)v323 != v118) {
                  objc_enumerationMutation(v115);
                }
                [*(id *)(*((void *)&v322 + 1) + 8 * k) CGRectValue];
                v341.origin.double x = x;
                v341.origin.double y = y;
                v341.size.double width = width;
                v341.size.double height = height;
                CGRect v340 = CGRectUnion(v339, v341);
                double x = v340.origin.x;
                double y = v340.origin.y;
                double width = v340.size.width;
                double height = v340.size.height;
              }
              uint64_t v117 = [v115 countByEnumeratingWithState:&v322 objects:v332 count:16];
            }
            while (v117);
          }

          objc_msgSend(a1, "_accessibilityScrollRectToVisible:", x, y, width, height);
          NSUInteger v103 = v300;
          NSUInteger v101 = v302;
        }
        [a1 _accessibilitySetBoolValue:1 forKey:@"AXSpeakScreenRectsUseVisibleFrame"];
        v303 = v104;
        __int16 v120 = objc_msgSend(a1, "_accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:", v101, v103, v104, v107);

        id v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v120, "count"));
        long long v318 = 0u;
        long long v319 = 0u;
        long long v320 = 0u;
        long long v321 = 0u;
        id v121 = v120;
        uint64_t v122 = [v121 countByEnumeratingWithState:&v318 objects:v331 count:16];
        if (v122)
        {
          uint64_t v123 = v122;
          uint64_t v124 = *(void *)v319;
          do
          {
            for (uint64_t m = 0; m != v123; ++m)
            {
              if (*(void *)v319 != v124) {
                objc_enumerationMutation(v121);
              }
              [*(id *)(*((void *)&v318 + 1) + 8 * m) CGRectValue];
              objc_msgSend(a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
              NSPoint v126 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
              [v18 addObject:v126];
            }
            uint64_t v123 = [v121 countByEnumeratingWithState:&v318 objects:v331 count:16];
          }
          while (v123);
        }

        uint64_t v13 = v303;
        id EventForSceneReferencePoint = v308;
        goto LABEL_249;
      }
      uint64_t v13 = AXLogSpeakScreen();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[NSObject(AXPrivCategory) _iosAccessibilityAttributeValue:forParameter:]();
      }
      goto LABEL_312;
    case 95225:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (unint64_t)[v7 count] < 4
        || (unint64_t)[v7 count] >= 7)
      {
        goto LABEL_250;
      }
      id EventForSceneReferencePoint = [v7 objectAtIndex:0];
      objc_opt_class();
      id v18 = 0;
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_257;
      }
      NSPoint v127 = [v7 objectAtIndex:1];
      objc_opt_class();
      char v128 = objc_opt_isKindOfClass();

      if (v128)
      {
        CGPoint v129 = [v7 objectAtIndex:1];
        uint64_t v130 = [v129 integerValue];
      }
      else
      {
        uint64_t v130 = 0;
      }
      v283 = [v7 objectAtIndex:2];
      objc_opt_class();
      char v284 = objc_opt_isKindOfClass();

      if (v284)
      {
        v285 = [v7 objectAtIndex:2];
        uint64_t v286 = [v285 rangeValue];
        uint64_t v288 = v287;
      }
      else
      {
        uint64_t v288 = 0;
        uint64_t v286 = 0x7FFFFFFFLL;
      }
      uint64_t v13 = [v7 objectAtIndexedSubscript:3];
      if ((unint64_t)[v7 count] < 5)
      {
        unsigned int v311 = 1;
      }
      else
      {
        v289 = [v7 objectAtIndex:4];
        unsigned int v311 = [v289 BOOLValue];
      }
      if ([v7 count] == 6)
      {
        [v7 objectAtIndex:5];
        id v306 = EventForSceneReferencePoint;
        uint64_t v290 = v286;
        v291 = v13;
        uint64_t v292 = v288;
        v294 = uint64_t v293 = v130;
        char v295 = [v294 BOOLValue];

        uint64_t v130 = v293;
        uint64_t v288 = v292;
        uint64_t v13 = v291;
        uint64_t v286 = v290;
        id EventForSceneReferencePoint = v306;
      }
      else
      {
        char v295 = 0;
      }
      LOBYTE(v298) = v295;
      id v18 = objc_msgSend(a1, "_accessibilityMoveFocusToNextOpaqueElementForTechnology:direction:searchType:range:shouldScrollToVisible:honorsGroups:", v13, (int)objc_msgSend(EventForSceneReferencePoint, "intValue"), v130, v286, v288, v311, v298);
      v296 = AXLogElementTraversal();
      if (os_log_type_enabled(v296, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = a1;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_19F2DB000, v296, OS_LOG_TYPE_INFO, "Opaque movement from %@ to %@", buf, 0x16u);
      }

      goto LABEL_249;
    case 95226:
      uint64_t v17 = [a1 _accessibilityCurrentlyFocusedElementForTechnology:v6];
      goto LABEL_231;
    case 95227:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      buf[0] = 0;
      objc_opt_class();
      CGRect v131 = [v7 objectForKey:@"uuid"];
      v304 = __UIAccessibilityCastAsClass();

      CGRect v132 = [v7 objectForKey:@"direction"];
      uint64_t v133 = [v132 integerValue];

      CGRect v134 = [v7 objectForKey:@"currentItem"];
      v309 = [v134 objectForKey:@"targetElement"];
      CGRect v135 = [v134 objectForKey:@"targetRange"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v136 = v135;
        id v137 = 0;
        uint64_t v138 = 0;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v232 = [v135 rangeValue];
          uint64_t v138 = v233;
          objc_msgSend(v309, "_accessibilityTextRangeFromNSRange:", v232, v233);
          id v136 = (id)objc_claimAutoreleasedReturnValue();
          id v137 = 0;
          goto LABEL_294;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v137 = v135;
        }
        else {
          id v137 = 0;
        }
        uint64_t v138 = 0;
        id v136 = 0;
      }
      uint64_t v232 = 0x7FFFFFFFLL;
LABEL_294:
      id v301 = v137;
      v245 = (void *)[objc_alloc(MEMORY[0x1E4F426D0]) initWithTargetElement:v309 targetRange:v136 targetTextMarkerRange:v137];
      v246 = v245;
      if (!v136 && (v232 != 0x7FFFFFFF || v138)) {
        objc_msgSend(v245, "setTargetNSRange:", v232, v138);
      }
      v247 = [a1 _accessibilityPerformPublicCustomRotorSearch:v304 searchDirection:v133 currentItem:v246];
      v248 = v247;
      if (!v247
        || ([v247 targetElement],
            v249 = objc_claimAutoreleasedReturnValue(),
            v249,
            !v249))
      {
        id v18 = 0;
        goto LABEL_320;
      }
      id v299 = v136;
      v250 = (void *)MEMORY[0x1E4F1CA60];
      v251 = [v248 targetElement];
      v252 = (void *)_AXCreateAXUIElementWithElement();
      id v18 = [v250 dictionaryWithObject:v252 forKey:@"targetElement"];

      *(_OWORD *)buf = xmmword_19F3490A0;
      v253 = [v248 targetRange];

      if (v253)
      {
        v254 = [v248 targetRange];
        [v18 setObject:v254 forKeyedSubscript:@"targetRange"];

        v255 = [v248 targetElement];
        v256 = [v248 targetRange];
        uint64_t v257 = [v255 _accessibilityRawRangeForUITextRange:v256];
        uint64_t v259 = v258;
        *(void *)buf = v257;
        *(void *)&buf[8] = v258;
      }
      else
      {
        uint64_t v257 = 0x7FFFFFFFLL;
        if ([v248 targetNSRange] != 0x7FFFFFFF || v260)
        {
          uint64_t v257 = [v248 targetNSRange];
          uint64_t v259 = v268;
          *(void *)buf = v257;
          *(void *)&buf[8] = v268;
        }
        else
        {
          uint64_t v259 = 0;
        }
      }
      id v136 = v299;
      if (v257 != 0x7FFFFFFF || v259)
      {
        uint64_t v270 = (uint64_t)AXValueCreate(kAXValueTypeCFRange, buf);
        id v137 = v301;
        if (!v270) {
          goto LABEL_320;
        }
      }
      else
      {
        v269 = [v248 targetTextMarkerRange];

        id v137 = v301;
        if (!v269) {
          goto LABEL_320;
        }
        uint64_t v270 = [v248 targetTextMarkerRange];
      }
      v271 = (void *)v270;
      [v18 setObject:v270 forKeyedSubscript:@"targetRange"];

LABEL_320:
      goto LABEL_237;
    case 95228:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        CGRect v139 = v7;
      }
      else {
        CGRect v139 = 0;
      }
      id v140 = v139;
      CGRect v141 = [a1 _accessibilityPublicCustomRotorName:v140];
      if (v141)
      {
        uint64_t v142 = [a1 _accessibilityPublicCustomRotorVisibleInTouchRotor:v140];
        v336[0] = v141;
        v335[0] = @"name";
        v335[1] = @"visibleInTouchRotor";
        CGRect v143 = [NSNumber numberWithBool:v142];
        v336[1] = v143;
        v335[2] = *MEMORY[0x1E4F48888];
        CGRect v144 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "_accessibilityPublicCustomRotorLinkCount:", v140));
        v336[2] = v144;
        id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v336 forKeys:v335 count:3];
      }
      else
      {
        id v18 = 0;
      }

      goto LABEL_237;
    case 95229:
      uint64_t v17 = [a1 _accessibilityFilenameForAttachmentCID:v6];
      goto LABEL_231;
    case 95230:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id EventForSceneReferencePoint = v7;
        uint64_t v145 = 0;
        uint64_t v146 = 0;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_263;
        }
        id EventForSceneReferencePoint = [v7 valueForKey:*MEMORY[0x1E4F48880]];
        buf[0] = 0;
        objc_opt_class();
        v221 = [v7 objectForKey:*MEMORY[0x1E4F48898]];
        v222 = __UIAccessibilityCastAsClass();

        uint64_t v145 = [v222 BOOLValue];
        buf[0] = 0;
        objc_opt_class();
        v223 = [v7 objectForKey:*MEMORY[0x1E4F488B0]];
        v224 = __UIAccessibilityCastAsClass();

        uint64_t v146 = [v224 BOOLValue];
      }
      if (!EventForSceneReferencePoint) {
        goto LABEL_263;
      }
      uint64_t v30 = [a1 _accessibilityFirstContainedElementForTechnology:EventForSceneReferencePoint honoringGroups:v145 shouldAlwaysScroll:v146];
      goto LABEL_256;
    case 95231:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v147 = v7;
        uint64_t v148 = 0;
        uint64_t v149 = 0;
        int v150 = 1;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_263:
          id v18 = 0;
          goto LABEL_232;
        }
        id v147 = [v7 valueForKey:*MEMORY[0x1E4F48880]];
        buf[0] = 0;
        objc_opt_class();
        v225 = [v7 objectForKey:*MEMORY[0x1E4F48898]];
        v226 = __UIAccessibilityCastAsClass();

        uint64_t v148 = [v226 BOOLValue];
        buf[0] = 0;
        objc_opt_class();
        v227 = [v7 objectForKey:*MEMORY[0x1E4F488B0]];
        v228 = __UIAccessibilityCastAsClass();

        uint64_t v149 = [v228 BOOLValue];
        buf[0] = 0;
        objc_opt_class();
        v229 = [v7 objectForKey:*MEMORY[0x1E4F488A0]];
        v230 = __UIAccessibilityCastAsClass();

        int v150 = [v230 BOOLValue];
      }
      if (!v147) {
        goto LABEL_263;
      }
      if ([a1 isAccessibilityOpaqueElementProvider])
      {
        id v18 = [a1 _accessibilityFocusAbsoluteFirstLastOpaqueElement:0 technology:v147 honorsGroups:v148 shouldAlwaysScroll:v149];
      }
      else
      {
        v234 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
        if (v148)
        {
          v235 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups];

          v236 = [v235 leafNodePredicate];
          v316[0] = MEMORY[0x1E4F143A8];
          v316[1] = 3221225472;
          v316[2] = __73__NSObject_AXPrivCategory___iosAccessibilityAttributeValue_forParameter___block_invoke;
          v316[3] = &unk_1E59B9240;
          v316[4] = a1;
          id v317 = v236;
          id v237 = v236;
          [v235 setLeafNodePredicate:v316];

          v234 = v235;
        }
        [v234 setDirection:2];
        v238 = [a1 _accessibilityLeafDescendantsWithCount:1 options:v234];
        id v18 = [v238 firstObject];

        if (!v150 && [v18 _accessibilityIsRemoteElement])
        {
          [a1 _accessibilityLeafDescendantsWithCount:10 options:v234];
          long long v312 = 0u;
          long long v313 = 0u;
          long long v314 = 0u;
          long long v315 = 0u;
          id v239 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v240 = [v239 countByEnumeratingWithState:&v312 objects:v330 count:16];
          if (v240)
          {
            uint64_t v241 = v240;
            id v310 = v147;
            uint64_t v242 = *(void *)v313;
            while (2)
            {
              for (uint64_t n = 0; n != v241; ++n)
              {
                if (*(void *)v313 != v242) {
                  objc_enumerationMutation(v239);
                }
                v244 = *(void **)(*((void *)&v312 + 1) + 8 * n);
                if (([v244 _accessibilityIsRemoteElement] & 1) == 0)
                {
                  id v297 = v244;

                  id v18 = v297;
                  goto LABEL_351;
                }
              }
              uint64_t v241 = [v239 countByEnumeratingWithState:&v312 objects:v330 count:16];
              if (v241) {
                continue;
              }
              break;
            }
LABEL_351:
            id v147 = v310;
          }
        }
      }

LABEL_232:
      if (!v18) {
        goto LABEL_233;
      }
LABEL_237:

      return v18;
    case 95232:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        CGRect v151 = v7;
      }
      else {
        CGRect v151 = 0;
      }
      uint64_t v90 = [a1 _accessibilityPublicCustomRotorIdForSystemType:v151];
      goto LABEL_266;
    case 95233:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        NSRect v152 = v7;
      }
      else {
        NSRect v152 = 0;
      }
      uint64_t v90 = objc_msgSend(a1, "_accessibilityHeaderElementsForColumn:", objc_msgSend(v152, "unsignedIntegerValue"));
      goto LABEL_266;
    case 95234:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        CGRect v153 = v7;
      }
      else {
        CGRect v153 = 0;
      }
      uint64_t v90 = objc_msgSend(a1, "_accessibilityHeaderElementsForRow:", objc_msgSend(v153, "unsignedIntegerValue"));
      goto LABEL_266;
    case 95235:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v154 = [v7 integerValue];
      CGRect v155 = NSNumber;
      uint64_t v156 = [a1 _accessibilityReinterpretVoiceOverCommand:v154];
      goto LABEL_211;
    case 95236:
      uint64_t v17 = [a1 _accessibilityProcessChildrenForParameter:v6];
      goto LABEL_231;
    case 95237:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = objc_msgSend(a1, "_accessibilityAlternativesForTextAtPosition:", objc_msgSend(v7, "unsignedIntegerValue"));
      goto LABEL_231;
    case 95238:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v157 = [v7 unsignedIntegerValue];
      }
      else {
        uint64_t v157 = 0;
      }
      uint64_t v90 = [a1 _accessibilityNotificationSummary:v157];
LABEL_266:
      id v18 = (void *)v90;
      goto LABEL_237;
    case 95239:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = objc_msgSend(a1, "_accessibilityDataSeriesValuesForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
      goto LABEL_231;
    case 95240:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = objc_msgSend(a1, "_accessibilityDataSeriesTitleForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
      goto LABEL_231;
    case 95241:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = objc_msgSend(a1, "_accessibilityDataSeriesMinimumValueForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
      goto LABEL_231;
    case 95242:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = objc_msgSend(a1, "_accessibilityDataSeriesMaximumValueForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
      goto LABEL_231;
    case 95243:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = objc_msgSend(a1, "_accessibilityDataSeriesGridlinePositionsForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
      goto LABEL_231;
    case 95244:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = objc_msgSend(a1, "_accessibilityDataSeriesUnitLabelForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
      goto LABEL_231;
    case 95245:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = objc_msgSend(a1, "_accessibilityDataSeriesCategoryLabelsForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
      goto LABEL_231;
    case 95246:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = [a1 _accessibilityNativeFocusableElements:0 withQueryString:v7];
      goto LABEL_231;
    case 95247:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      [v7 doubleValue];
      double v159 = fmax(v158, 0.0);
      if (v159 > 1.0) {
        double v159 = 1.0;
      }
      v160 = a1;
      uint64_t v161 = 0;
      goto LABEL_157;
    case 95248:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      [v7 doubleValue];
      double v159 = fmax(v162, 0.0);
      if (v159 > 1.0) {
        double v159 = 1.0;
      }
      v160 = a1;
      uint64_t v161 = 1;
LABEL_157:
      uint64_t v17 = [v160 _accessibilityDataSeriesValueDescriptionForPosition:v161 axis:v159];
      goto LABEL_231;
    case 95249:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ![a1 isAccessibilityOpaqueElementProvider])
      {
        goto LABEL_233;
      }
      buf[0] = 0;
      objc_opt_class();
      v163 = [v7 objectForKey:*MEMORY[0x1E4F48898]];
      v164 = __UIAccessibilityCastAsClass();

      uint64_t v165 = [v164 BOOLValue];
      buf[0] = 0;
      objc_opt_class();
      v166 = [v7 objectForKey:*MEMORY[0x1E4F488B8]];
      v167 = __UIAccessibilityCastAsClass();

      uint64_t v168 = [v167 BOOLValue];
      uint64_t v17 = [a1 _accessibilityVisibleOpaqueElementsHonoringGroups:v165 sorted:v168];
      goto LABEL_231;
    case 95250:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      buf[0] = 0;
      objc_opt_class();
      v169 = [v7 objectForKey:*MEMORY[0x1E4F48898]];
      v170 = __UIAccessibilityCastAsClass();

      uint64_t v171 = [v170 BOOLValue];
      uint64_t v17 = [a1 _accessibilityFirstElementForFocusHonoringGroups:v171];
      goto LABEL_231;
    case 95251:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      buf[0] = 0;
      objc_opt_class();
      v172 = [v7 objectForKey:*MEMORY[0x1E4F48898]];
      v173 = __UIAccessibilityCastAsClass();

      uint64_t v174 = [v173 BOOLValue];
      uint64_t v17 = [a1 _accessibilityVisibleElementsHonoringGroups:v174];
      goto LABEL_231;
    case 95252:
      goto LABEL_12;
    case 95255:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = [a1 _accessibilitySpeakThisElementWithIdentifier:v7];
      goto LABEL_231;
    case 95258:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      [v7 pointValue];
      double v73 = v175;
      double v75 = v176;
      id EventForSceneReferencePoint = (id)UIAccessibilityCreateEventForSceneReferencePoint(0, v175, v176);
      id v18 = 0;
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_257;
      }
      v177 = +[UIAccessibilityHitTestOptions dwellControlElementHighlightOptions];
      [EventForSceneReferencePoint _setAccessibilityHitTestOptions:v177];

      goto LABEL_170;
    case 95259:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_233;
      }
      uint64_t v17 = [a1 accessibilityCustomAttribute:v7];
      goto LABEL_231;
    default:
      if (a3 == 96001)
      {
        if (LookingGlassRuntimeSupportLibraryCore())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id EventForSceneReferencePoint = (id)[objc_alloc((Class)getLGRRequestClass()) initWithDictionaryRepresentation:v7];
            [EventForSceneReferencePoint setServerInstance:a1];
            v220 = [getLGRRuntimeManagerClass() sharedInstance];
            uint64_t v13 = [v220 handleRequest:EventForSceneReferencePoint];

            uint64_t v16 = [v13 dictionaryRepresentation];
            goto LABEL_248;
          }
        }
      }
      else if (a3 == 96002 && AXTinkerKitLibraryCore())
      {
        id EventForSceneReferencePoint = [getTinkerRuntimeClass() shared];
        uint64_t v30 = [EventForSceneReferencePoint handleRequest:v7 withElement:a1];
        goto LABEL_256;
      }
      goto LABEL_233;
  }
}

- (uint64_t)_accessibilityResolvedEditingStyles
{
  return 0;
}

- (id)_accessibilityTextualContext
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:36];
  id v3 = (void *)v2;
  if (v2)
  {
    id v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    uint64_t v5 = [a1 accessibilityTextualContext];
    if (!v5)
    {
      uint64_t v6 = [a1 accessibilityContainer];
      if (v6)
      {
        unint64_t v7 = (void *)v6;
        while (1)
        {
          uint64_t v8 = [v7 accessibilityTextualContext];
          if (v8) {
            break;
          }
          uint64_t v5 = [v7 accessibilityContainer];

          unint64_t v7 = v5;
          if (!v5) {
            goto LABEL_11;
          }
        }
        uint64_t v5 = (void *)v8;
LABEL_11:
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
    id v4 = AXSSTextualContextFromUITextualContext(v5);
  }

  return v4;
}

- (double)_accessibilityMagnifierZoomLevel
{
  return 0.0;
}

- (id)__accessibilityRetrieveFrameOrPathDelegate
{
  id v1 = a1;
  if (v1)
  {
    while (1)
    {
      uint64_t v2 = [v1 _accessibilityFrameDelegate];

      if (!v2)
      {
        if (![v1 _accessibilityBoolValueForKey:@"UIAccessibilityStorageKeyPlatformElementShouldUseAccessibilityNodeAsFrameDelegate"])break; {
        uint64_t v3 = [v1 safeValueForKey:@"accessibilityNodeForPlatformElement"];
        }
        if ((id)v3 == v1)
        {

          break;
        }
        uint64_t v2 = (void *)v3;
        if (!v3) {
          break;
        }
      }
      id v4 = v2;

      id v1 = v4;
    }
  }

  return v1;
}

- (double)_accessibilityFocusableFrameForZoom
{
  return *MEMORY[0x1E4F1DB20];
}

- (uint64_t)_accessibilityReinterpretVoiceOverCommand:()AXPrivCategory
{
  return 0;
}

- (__CFString)_iosAccessibilityAttributeValue:()AXPrivCategory
{
  uint64_t v3 = a1;
  id v4 = 0;
  uint64_t v201 = *MEMORY[0x1E4F143B8];
  if (a3 <= 2999)
  {
    switch(a3)
    {
      case 2001:
        uint64_t v7 = [a1 _accessibilityProcessedLabelAttribute];
        break;
      case 2002:
        uint64_t v7 = [a1 _accessibilityAXAttributedHint];
        break;
      case 2003:
        double v25 = objc_msgSend(a1, "__accessibilityRetrieveFrameOrPathDelegate");
        [v25 accessibilityFrame];
        CGFloat x = v26;
        CGFloat y = v28;
        CGFloat width = v30;
        CGFloat height = v32;

        goto LABEL_108;
      case 2004:
        if ([a1 _accessibilityShouldInheritTraits]) {
          uint64_t v34 = [v3 _accessibilityInheritedTraits];
        }
        else {
          uint64_t v34 = [v3 accessibilityTraits];
        }
        uint64_t v164 = v34;
        int v165 = [v3 _accessibilityIsScrollable];
        uint64_t v166 = UIAccessibilityTraitScrollable;
        if (!v165) {
          uint64_t v166 = 0;
        }
        uint64_t v167 = v166 | v164;
        if ([v3 _accessibilityHasTextOperations]) {
          uint64_t v168 = UIAccessibilityTraitTextOperationsAvailable;
        }
        else {
          uint64_t v168 = 0;
        }
        int v169 = [v3 _accessibilityReadAllContinuesWithScroll];
        uint64_t v170 = *MEMORY[0x1E4F434F8];
        if (!v169) {
          uint64_t v170 = 0;
        }
        uint64_t v171 = v167 | v168 | v170;
        int v172 = [v3 _accessibilityIsInTabBar];
        uint64_t v173 = UIAccessibilityTraitTabButton;
        if (!v172) {
          uint64_t v173 = 0;
        }
        uint64_t v174 = v171 | v173;
        uint64_t v175 = [v3 _accessibilityGetBlockForAttribute:5];
        uint64_t v53 = v175;
        if (v175) {
          uint64_t v175 = (*(uint64_t (**)(uint64_t))(v175 + 16))(v175);
        }
        double v57 = [NSNumber numberWithUnsignedLongLong:v174 | v175];
        goto LABEL_546;
      case 2005:
        uint64_t v38 = [a1 _accessibilitySelectedTextRange];
        goto LABEL_553;
      case 2006:
        id v4 = [a1 _accessibilityAXAttributedValue];
        double v35 = [v3 accessibilitySpeechHint];
        if ([v35 count])
        {
          uint64_t v36 = [v3 _accessibilityString:v4 withSpeechHint:v35];

          id v4 = (__CFString *)v36;
        }
        goto LABEL_562;
      case 2007:
        [a1 accessibilityActivationPoint];
        if (v59 == -1.0 && v58 == -1.0)
        {
          double v77 = (void *)MEMORY[0x1E4F29238];
          double v78 = -1.0;
          double v79 = -1.0;
        }
        else
        {
          objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
          double v62 = v61;
          double v64 = v63;
          CGFloat v66 = v65;
          CGFloat v68 = v67;
          AXDeviceGetMainScreenBounds();
          CGFloat v70 = v69;
          CGFloat v72 = v71;
          CGFloat v74 = v73;
          CGFloat v76 = v75;
          v204.origin.CGFloat x = v62;
          v204.origin.CGFloat y = v64;
          v204.size.CGFloat width = v66;
          v204.size.CGFloat height = v68;
          v210.origin.CGFloat x = v70;
          v210.origin.CGFloat y = v72;
          v210.size.CGFloat width = v74;
          v210.size.CGFloat height = v76;
          if (CGRectIntersectsRect(v204, v210))
          {
            v205.origin.CGFloat x = v70;
            v205.origin.CGFloat y = v72;
            v205.size.CGFloat width = v74;
            v205.size.CGFloat height = v76;
            if (v62 > CGRectGetWidth(v205))
            {
              v206.origin.CGFloat x = v70;
              v206.origin.CGFloat y = v72;
              v206.size.CGFloat width = v74;
              v206.size.CGFloat height = v76;
              double v62 = CGRectGetWidth(v206) * 0.5;
            }
            v207.origin.CGFloat x = v70;
            v207.origin.CGFloat y = v72;
            v207.size.CGFloat width = v74;
            v207.size.CGFloat height = v76;
            if (v64 > CGRectGetHeight(v207))
            {
              v208.origin.CGFloat x = v70;
              v208.origin.CGFloat y = v72;
              v208.size.CGFloat width = v74;
              v208.size.CGFloat height = v76;
              double v64 = CGRectGetHeight(v208) * 0.5;
            }
          }
          double v77 = (void *)MEMORY[0x1E4F29238];
          double v78 = v62;
          double v79 = v64;
        }
        goto LABEL_536;
      case 2008:
        id v4 = [a1 accessibilityLanguage];
        if (v4) {
          goto LABEL_30;
        }
        uint64_t v7 = [(id)*MEMORY[0x1E4F43630] accessibilityLanguage];
        break;
      case 2009:
        uint64_t v7 = [a1 _accessibilityScrollStatus];
        break;
      case 2010:
        uint64_t v7 = [a1 _accessibilityTextOperations];
        break;
      case 2011:
        uint64_t v7 = [a1 _accessibilityTextViewTextOperationResponder];
        break;
      case 2012:
        uint64_t v7 = [a1 _accessibilityTouchContainer];
        break;
      case 2013:
        uint64_t v7 = [a1 _accessibilityVisibleItemInList];
        break;
      case 2014:
        uint64_t v37 = 1;
        goto LABEL_132;
      case 2015:
        uint64_t v37 = 0;
LABEL_132:
        uint64_t v7 = [a1 _accessibilityContainerInDirection:v37];
        break;
      case 2016:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 isAccessibilityElement];
        goto LABEL_27;
      case 2017:
        uint64_t v7 = [a1 _accessibilityApplication];
        break;
      case 2018:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityElementIsFocused];
        goto LABEL_27;
      case 2019:
        uint64_t v5 = NSNumber;
        uint64_t v6 = objc_msgSend(a1, "__accessibilitySupportsActivateAction");
        goto LABEL_27;
      case 2020:
        uint64_t v7 = [a1 accessibilityURL];
        break;
      case 2021:
        uint64_t v8 = NSNumber;
        uint64_t v9 = [a1 _accessibilityContextId];
        goto LABEL_314;
      case 2022:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsFirstSibling];
        goto LABEL_27;
      case 2023:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsLastSibling];
        goto LABEL_27;
      case 2024:
        uint64_t v7 = [a1 accessibilityLinkedElement];
        break;
      case 2025:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsVisibleByCompleteHitTest];
        goto LABEL_27;
      case 2026:
        uint64_t v7 = [a1 _accessibilityRetrieveHeaderElements];
        break;
      case 2027:
        uint64_t v38 = [a1 _accessibilityRowRange];
        goto LABEL_553;
      case 2028:
        uint64_t v38 = [a1 _accessibilityColumnRange];
        goto LABEL_553;
      case 2029:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityRequired];
        goto LABEL_27;
      case 2030:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsComboBox];
        goto LABEL_27;
      case 2031:
        uint64_t v7 = [a1 _accessibilityAutomaticIdentifier];
        break;
      case 2032:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityWebSearchResultsActive];
        goto LABEL_27;
      case 2033:
        uint64_t v7 = [a1 accessibilityFlowToElements];
        break;
      case 2034:
        objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_accessibilityIsInTableCell"));
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if ([(__CFString *)v4 BOOLValue]) {
          goto LABEL_30;
        }
        uint64_t v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "_accessibilityIsInCollectionCell"));
        goto LABEL_249;
      case 2035:
      case 2037:
      case 2043:
      case 2090:
      case 2091:
      case 2097:
      case 2098:
      case 2112:
      case 2133:
      case 2134:
      case 2135:
      case 2136:
      case 2137:
      case 2138:
      case 2139:
      case 2146:
      case 2173:
      case 2241:
      case 2242:
      case 2243:
      case 2244:
      case 2245:
      case 2246:
      case 2247:
      case 2248:
      case 2249:
      case 2250:
      case 2251:
      case 2252:
      case 2253:
      case 2254:
      case 2255:
      case 2256:
      case 2257:
      case 2258:
      case 2259:
      case 2260:
      case 2261:
      case 2262:
      case 2263:
      case 2264:
      case 2265:
      case 2266:
      case 2267:
      case 2268:
      case 2269:
      case 2270:
      case 2271:
      case 2272:
      case 2273:
      case 2274:
      case 2275:
      case 2276:
      case 2277:
      case 2278:
      case 2279:
      case 2280:
      case 2281:
      case 2282:
      case 2283:
      case 2284:
      case 2285:
      case 2286:
      case 2287:
      case 2288:
      case 2289:
      case 2290:
      case 2291:
      case 2292:
      case 2293:
      case 2294:
      case 2295:
      case 2296:
      case 2297:
      case 2298:
      case 2299:
      case 2300:
      case 2303:
      case 2309:
      case 2321:
      case 2322:
      case 2323:
      case 2324:
      case 2325:
      case 2326:
      case 2327:
      case 2328:
      case 2329:
      case 2330:
      case 2331:
      case 2332:
      case 2333:
      case 2334:
      case 2335:
      case 2336:
      case 2337:
      case 2338:
      case 2339:
      case 2340:
      case 2341:
      case 2342:
      case 2343:
      case 2344:
      case 2345:
      case 2346:
      case 2347:
      case 2348:
      case 2349:
      case 2350:
      case 2351:
      case 2352:
      case 2353:
      case 2354:
      case 2355:
      case 2356:
      case 2357:
      case 2358:
      case 2359:
      case 2360:
      case 2361:
      case 2362:
      case 2363:
      case 2364:
      case 2365:
      case 2366:
      case 2367:
      case 2368:
      case 2369:
      case 2370:
      case 2371:
      case 2372:
      case 2373:
      case 2374:
      case 2375:
      case 2376:
      case 2377:
      case 2378:
      case 2379:
      case 2380:
      case 2381:
      case 2382:
      case 2383:
      case 2384:
      case 2385:
      case 2386:
      case 2387:
      case 2388:
      case 2389:
      case 2390:
      case 2391:
      case 2392:
      case 2393:
      case 2394:
      case 2395:
      case 2396:
      case 2397:
      case 2398:
      case 2399:
      case 2404:
      case 2405:
      case 2406:
      case 2407:
      case 2408:
      case 2409:
      case 2410:
      case 2411:
      case 2412:
      case 2413:
      case 2414:
      case 2415:
      case 2416:
      case 2417:
      case 2418:
      case 2419:
      case 2420:
      case 2421:
      case 2422:
      case 2423:
      case 2424:
      case 2425:
      case 2426:
      case 2427:
      case 2428:
      case 2429:
      case 2430:
      case 2431:
      case 2432:
      case 2433:
      case 2434:
      case 2435:
      case 2436:
      case 2437:
      case 2438:
      case 2439:
      case 2440:
      case 2441:
      case 2442:
      case 2443:
      case 2444:
      case 2445:
      case 2446:
      case 2447:
      case 2448:
      case 2449:
      case 2450:
      case 2451:
      case 2452:
      case 2453:
      case 2454:
      case 2455:
      case 2456:
      case 2457:
      case 2458:
      case 2459:
      case 2460:
      case 2461:
      case 2462:
      case 2463:
      case 2464:
      case 2465:
      case 2466:
      case 2467:
      case 2468:
      case 2469:
      case 2470:
      case 2471:
      case 2472:
      case 2473:
      case 2474:
      case 2475:
      case 2476:
      case 2477:
      case 2478:
      case 2479:
      case 2480:
      case 2481:
      case 2482:
      case 2483:
      case 2484:
      case 2485:
      case 2486:
      case 2487:
      case 2488:
      case 2489:
      case 2490:
      case 2491:
      case 2492:
      case 2493:
      case 2494:
      case 2495:
      case 2496:
      case 2497:
      case 2498:
      case 2499:
      case 2508:
      case 2509:
      case 2510:
      case 2511:
      case 2512:
      case 2513:
      case 2514:
      case 2515:
      case 2516:
      case 2517:
      case 2518:
      case 2519:
      case 2520:
      case 2521:
      case 2522:
      case 2523:
      case 2524:
      case 2525:
      case 2526:
      case 2527:
      case 2528:
      case 2529:
      case 2530:
      case 2531:
      case 2532:
      case 2533:
      case 2534:
      case 2535:
      case 2536:
      case 2537:
      case 2538:
      case 2539:
      case 2540:
      case 2541:
      case 2542:
      case 2543:
      case 2544:
      case 2545:
      case 2546:
      case 2547:
      case 2548:
      case 2549:
      case 2550:
      case 2551:
      case 2552:
      case 2553:
      case 2554:
      case 2555:
      case 2556:
      case 2557:
      case 2558:
      case 2559:
      case 2560:
      case 2561:
      case 2562:
      case 2563:
      case 2564:
      case 2565:
      case 2566:
      case 2567:
      case 2568:
      case 2569:
      case 2570:
      case 2571:
      case 2572:
      case 2573:
      case 2574:
      case 2575:
      case 2576:
      case 2577:
      case 2578:
      case 2579:
      case 2580:
      case 2581:
      case 2582:
      case 2583:
      case 2584:
      case 2585:
      case 2586:
      case 2587:
      case 2588:
      case 2589:
      case 2590:
      case 2591:
      case 2592:
      case 2593:
      case 2594:
      case 2595:
      case 2596:
      case 2597:
      case 2598:
      case 2599:
        goto LABEL_30;
      case 2036:
        uint64_t v7 = [a1 _accessibilityCustomActionNamesAndIdentifiers];
        break;
      case 2038:
        uint64_t v5 = NSNumber;
        uint64_t v6 = objc_msgSend(a1, "__accessibilityReadAllOnFocus");
        goto LABEL_27;
      case 2039:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsAwayAlertElement];
        goto LABEL_27;
      case 2040:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsAwayAlertElementNew];
        goto LABEL_27;
      case 2041:
        id v4 = [MEMORY[0x1E4F28E78] string];
        double v35 = [v3 accessibilityContainer];
        id v80 = v3;
        double v81 = v80;
        if (v80 && v35)
        {
          do
          {
            uint64_t v82 = [v35 indexOfAccessibilityElement:v81];
            if (v82 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (objc_opt_respondsToSelector())
              {
                double v83 = [v35 _accessibilitySubviews];
                uint64_t v82 = [v83 indexOfObject:v81];
              }
              else
              {
                uint64_t v82 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
            [(__CFString *)v4 appendFormat:@"%ld-", v82];
            id v84 = v35;

            double v35 = [v84 accessibilityContainer];

            double v81 = v84;
          }
          while (v35);
        }
        else
        {
          id v84 = v80;
        }

        goto LABEL_562;
      case 2042:
        double v35 = objc_msgSend(a1, "__accessibilityRetrieveFrameOrPathDelegate");
        int v85 = [v35 accessibilityPath];
        id v4 = [v3 _accessibilityConvertSystemBoundedPathToContextSpace:v85];

        goto LABEL_562;
      case 2044:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsInAppSwitcher];
        goto LABEL_27;
      case 2045:
        uint64_t v7 = [a1 accessibilityInvalidStatus];
        break;
      case 2046:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsRemoteElement];
        goto LABEL_27;
      case 2047:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _allowCustomActionHintSpeakOverride];
        goto LABEL_27;
      case 2048:
        double v11 = NSNumber;
        uint64_t v12 = [a1 _accessibilityMapFeatureType];
        goto LABEL_23;
      case 2049:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityLastHitTestNearBorder];
        goto LABEL_27;
      case 2050:
        double v41 = (void *)MEMORY[0x1E4F29238];
        [a1 _accessibilityTextCursorFrame];
        goto LABEL_328;
      case 2051:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldAnnounceFontInfo];
        goto LABEL_27;
      case 2052:
        double v42 = NSNumber;
        [a1 _accessibilityActivationDelay];
        goto LABEL_479;
      case 2053:
        int v86 = NSNumber;
        uint64_t v87 = [a1 _accessibilityAvailableAutoscrollDirections];
        goto LABEL_540;
      case 2054:
        uint64_t v7 = [a1 _accessibilityAutoscrollTarget];
        break;
      case 2055:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsAutoscrolling];
        goto LABEL_27;
      case 2056:
      case 2088:
        id v4 = (__CFString *)MEMORY[0x1E4F1CC38];
        goto LABEL_30;
      case 2057:
        [a1 _accessibilityVisibleFrame];
        goto LABEL_260;
      case 2058:
        uint64_t v7 = [a1 _accessibilityPhotoDescription];
        break;
      case 2059:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityKeyboardKeyAllowsTouchTyping];
        goto LABEL_27;
      case 2060:
        uint64_t v7 = [a1 _accessibilityElementStoredUserLabel];
        break;
      case 2061:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsEscapable];
        goto LABEL_27;
      case 2062:
        [a1 _accessibilityVisiblePoint];
        double v90 = v89;
        double v91 = v88;
        double v78 = -1.0;
        BOOL v92 = v90 == -1.0 && v88 == -1.0;
        double v79 = -1.0;
        if (!v92) {
          objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenPointToContextSpace:", v90, v91);
        }
        double v77 = (void *)MEMORY[0x1E4F29238];
        goto LABEL_536;
      case 2063:
        uint64_t v7 = [a1 _accessibilitySupportGesturesAttributes];
        break;
      case 2064:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityCanScrollInAtLeastOneDirection];
        goto LABEL_27;
      case 2065:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 isAccessibilityOpaqueElementProvider];
        goto LABEL_27;
      case 2066:
        uint64_t v7 = [a1 _accessibilityOpaqueElementParent];
        break;
      case 2067:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityRetainsCustomRotorActionSetting];
        goto LABEL_27;
      case 2068:
        double v93 = NSNumber;
        [a1 _accessibilityDelayBeforeUpdatingOnActivation];
        goto LABEL_388;
      case 2069:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityOverridesInstructionsHint];
        goto LABEL_27;
      case 2070:
        [a1 _accessibilityVisiblePointHitTestingAnyElement:0];
        if (v94 != -1.0 || v95 != -1.0) {
          objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenPointToContextSpace:", v94, v95);
        }
        objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:");
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v53 = AXLogUIA();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v199 = v4;
          _os_log_impl(&dword_19F2DB000, v53, OS_LOG_TYPE_INFO, "Return visible point: %@", buf, 0xCu);
        }
        goto LABEL_547;
      case 2071:
        uint64_t v7 = [a1 _accessibilityEquivalenceTag];
        break;
      case 2072:
        id v4 = @"<unavailable>";
        goto LABEL_30;
      case 2073:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityAllowsAlternativeCharacterActivation];
        goto LABEL_27;
      case 2074:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldSpeakScrollStatusOnEntry];
        goto LABEL_27;
      case 2075:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityElementVisibilityAffectsLayout];
        goto LABEL_27;
      case 2076:
        id v4 = [a1 _accessibilityActiveKeyboard];
        if (v4) {
          goto LABEL_30;
        }
        uint64_t v7 = [v3 _accessibilitySoftwareMimicKeyboard];
        break;
      case 2077:
        uint64_t v7 = objc_msgSend(a1, "__accessibilityRoleDescription");
        break;
      case 2078:
        double v97 = (void *)MEMORY[0x1E4F29238];
        uint64_t v98 = [a1 _accessibilityIndexPathAsRange];
        goto LABEL_224;
      case 2079:
        uint64_t v5 = NSNumber;
        uint64_t v6 = objc_msgSend(a1, "__accessibilitySupportsSecondaryActivateAction");
        goto LABEL_27;
      case 2080:
        uint64_t v7 = [a1 accessibilityImageOverlayElements];
        break;
      case 2081:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsInFolder];
        goto LABEL_27;
      case 2082:
        uint64_t v7 = [a1 _accessibilityActiveURL];
        break;
      case 2083:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityWebViewIsLoading];
        goto LABEL_27;
      case 2084:
        uint64_t v7 = [a1 _accessibilitySpeakThisElementsAndStrings];
        break;
      case 2085:
        uint64_t v7 = [a1 _accessibilitySpeakThisString];
        break;
      case 2086:
        double v21 = NSNumber;
        uint64_t v22 = [a1 _accessibilityHorizontalSizeClass];
        goto LABEL_549;
      case 2087:
        double v21 = NSNumber;
        uint64_t v22 = [a1 _accessibilityVerticalSizeClass];
        goto LABEL_549;
      case 2089:
        uint64_t v7 = [a1 _accessibilityPreferredScrollActions];
        break;
      case 2092:
      case 2310:
        uint64_t v7 = [a1 _accessibilityRemoteParent];
        break;
      case 2093:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldScrollRemoteParent];
        goto LABEL_27;
      case 2094:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityHasNativeFocus];
        goto LABEL_27;
      case 2095:
        uint64_t v7 = [a1 _accessibilityAccessibleDescendants];
        break;
      case 2096:
        uint64_t v7 = [a1 _accessibilityAccessibleAncestor];
        break;
      case 2099:
        uint64_t v53 = [a1 _accessibilityWindow];
        if (![v53 _accessibilityIsIsolatedWindow]) {
          goto LABEL_471;
        }
        double v57 = v53;
        goto LABEL_546;
      case 2100:
        uint64_t v7 = [a1 _accessibilityElementCommunityIdentifier];
        break;
      case 2101:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsUsingRemoteParentActivateAction];
        goto LABEL_27;
      case 2102:
        uint64_t v7 = [a1 _accessibilityTraitsInspectorHumanReadable];
        break;
      case 2103:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldSuppressCustomActionsHint];
        goto LABEL_27;
      case 2104:
        uint64_t v7 = [a1 _accessibilityTextInputElement];
        break;
      case 2105:
        uint64_t v7 = [a1 _accessibilityWebAreaURL];
        break;
      case 2106:
        double v99 = sel_accessibilityScrollRightPage;
        goto LABEL_207;
      case 2107:
        double v99 = sel_accessibilityScrollLeftPage;
        goto LABEL_207;
      case 2108:
        double v99 = sel_accessibilityScrollUpPage;
        goto LABEL_207;
      case 2109:
        double v99 = sel_accessibilityScrollDownPage;
LABEL_207:
        uint64_t v7 = [a1 _accessibilityScrollAncestorForSelector:v99];
        break;
      case 2110:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilitySupportsPressedState];
        goto LABEL_27;
      case 2111:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsPressed];
        goto LABEL_27;
      case 2113:
        uint64_t v7 = [a1 _accessibilityVisibleOpaqueElements];
        break;
      case 2114:
        double v11 = NSNumber;
        uint64_t v12 = [a1 _accessibilityExpandedStatus];
        goto LABEL_23;
      case 2115:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityRepresentsInfiniteCollection];
        goto LABEL_27;
      case 2116:
        uint64_t v7 = [a1 _accessibilityCurrentStatus];
        break;
      case 2117:
        uint64_t v100 = [a1 accessibilityARIARowIndex];
        goto LABEL_214;
      case 2118:
        uint64_t v100 = [a1 accessibilityARIAColumnIndex];
LABEL_214:
        if (v100 == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v101 = 0x7FFFFFFFLL;
        }
        else {
          uint64_t v101 = v100;
        }
        NSUInteger v102 = NSNumber;
        goto LABEL_466;
      case 2119:
        NSUInteger v103 = NSNumber;
        uint64_t v104 = [a1 accessibilityARIARowCount];
        goto LABEL_465;
      case 2120:
        NSUInteger v103 = NSNumber;
        uint64_t v104 = [a1 accessibilityARIAColumnCount];
        goto LABEL_465;
      case 2121:
        NSUInteger v103 = NSNumber;
        uint64_t v104 = [a1 _accessibilityRowCount];
        goto LABEL_465;
      case 2122:
        NSUInteger v103 = NSNumber;
        uint64_t v104 = [a1 _accessibilityColumnCount];
        goto LABEL_465;
      case 2123:
        uint64_t v8 = NSNumber;
        uint64_t v9 = [a1 _accessibilityDisplayId];
        goto LABEL_314;
      case 2124:
        double v97 = (void *)MEMORY[0x1E4F29238];
        uint64_t v98 = [a1 _accessibilityTextInputElementRangeAsNSRange];
LABEL_224:
        uint64_t v105 = v98;
        uint64_t v106 = v97;
        goto LABEL_554;
      case 2125:
        uint64_t v7 = [a1 _accessibilityAllContextDescriptors];
        break;
      case 2126:
        double v48 = (id *)MEMORY[0x1E4F43630];
        [(id)*MEMORY[0x1E4F43630] setContextKitSearchEnabled:1];
        uint64_t v49 = [v3 _accessibilitySpeakThisElementsAndStrings];
        _accessibilityPostProcessContextKitData(v49);
        id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        [*v48 setContextKitSearchEnabled:0];
        goto LABEL_30;
      case 2127:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityViewHierarchyHasNativeFocus];
        goto LABEL_27;
      case 2128:
        uint64_t v7 = [a1 _accessibilityPublicCustomRotors];
        break;
      case 2129:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityBannerIsSticky];
        goto LABEL_27;
      case 2130:
        uint64_t v107 = objc_msgSend(a1, "__accessibilityRetrieveFrameOrPathDelegate");
        [v107 _accessibilityDirectInteractionFrame];
        double v109 = v108;
        double v111 = v110;
        double v113 = v112;
        double v115 = v114;

        objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", v109, v111, v113, v115);
        uint64_t v116 = (void *)MEMORY[0x1E4F29238];
        goto LABEL_395;
      case 2131:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldSpeakExplorerElementsAfterFocus];
        goto LABEL_27;
      case 2132:
        uint64_t v7 = [a1 _accessibilityWatchAutoSpeakElements];
        break;
      case 2140:
        uint64_t v117 = [a1 _accessibilitySpeakThisPreferredHighlightColor];
        goto LABEL_450;
      case 2141:
        uint64_t v117 = [a1 _accessibilitySpeakThisPreferredUnderlineColor];
        goto LABEL_450;
      case 2142:
        uint64_t v7 = [a1 _accessibilityRemoteApplication];
        break;
      case 2143:
        id v4 = [a1 _accessibilityParentTableView];
        if (v4) {
          goto LABEL_30;
        }
        uint64_t v7 = [v3 _accessibilityParentCollectionView];
        break;
      case 2144:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityHasBadge];
        goto LABEL_27;
      case 2145:
        uint64_t v7 = [a1 _accessibilityContainerTypes];
        break;
      case 2147:
        int v86 = NSNumber;
        uint64_t v87 = [a1 _accessibilityScanningBehaviorTraits];
        goto LABEL_540;
      case 2148:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityCanDisplayMultipleControllers];
        goto LABEL_27;
      case 2149:
        [a1 _accessibilityFocusableFrameForZoom];
        CGFloat x = v203.origin.x;
        CGFloat y = v203.origin.y;
        CGFloat width = v203.size.width;
        CGFloat height = v203.size.height;
        if (CGRectIsNull(v203))
        {
          uint64_t v50 = v3;
          uint64_t v51 = 2003;
          goto LABEL_559;
        }
LABEL_108:
        uint64_t v52 = v3;
        double v44 = x;
        double v45 = y;
        double v46 = width;
        double v47 = height;
LABEL_261:
        objc_msgSend(v52, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", v44, v45, v46, v47);
LABEL_394:
        uint64_t v116 = (void *)MEMORY[0x1E4F29238];
LABEL_395:
        uint64_t v7 = objc_msgSend(v116, "valueWithRect:");
        break;
      case 2150:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityScannerShouldUseActivateInPointMode];
        goto LABEL_27;
      case 2151:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityFullscreenVideoViewIsVisible];
        goto LABEL_27;
      case 2152:
        uint64_t v7 = [a1 accessibilitySortDirection];
        break;
      case 2153:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldSetNativeFocusWhenATVFocused];
        goto LABEL_27;
      case 2154:
        uint64_t v118 = 0;
        goto LABEL_243;
      case 2155:
        uint64_t v118 = 1;
LABEL_243:
        uint64_t v7 = [a1 _accessibilityGuideElementInDirection:v118];
        break;
      case 2156:
        uint64_t v7 = [a1 accessibilityErrorMessageElements];
        break;
      case 2157:
        NSUInteger v103 = NSNumber;
        uint64_t v104 = [a1 accessibilityBlockquoteLevel];
        goto LABEL_465;
      case 2158:
        id v4 = [a1 _iosAccessibilityAttributeValue:2006];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[(__CFString *)v4 length] >= 0x201)
        {
          uint64_t v40 = [(__CFString *)v4 substringToIndex:512];
LABEL_249:
          id v119 = (__CFString *)v40;

          id v4 = v119;
        }
        goto LABEL_30;
      case 2159:
        double v93 = NSNumber;
        [a1 _accessibilityFontSize];
        goto LABEL_388;
      case 2160:
        double v93 = NSNumber;
        [a1 _accessibilityZoomScale];
        goto LABEL_388;
      case 2161:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldIncludeRowRangeInElementDescription];
        goto LABEL_27;
      case 2162:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsContainedByPreferredNativeFocusElement];
        goto LABEL_27;
      case 2163:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityHasDragSources];
        goto LABEL_27;
      case 2164:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityHasDragDestinations];
        goto LABEL_27;
      case 2165:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsDraggableElementAttribute];
        goto LABEL_27;
      case 2166:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsContainedByVideoElement];
        goto LABEL_27;
      case 2167:
        uint64_t v7 = [a1 _accessibilityRetrieveLinkedUIElementsFromContainerChain];
        break;
      case 2168:
        double v93 = NSNumber;
        [a1 _accessibilityViewAlpha];
LABEL_388:
        uint64_t v138 = v93;
        goto LABEL_389;
      case 2169:
        uint64_t v7 = [a1 _accessibilityGuideElementHeaderText];
        break;
      case 2170:
        uint64_t v7 = [a1 accessibilityDatetimeValue];
        break;
      case 2171:
        [a1 accessibilityElementRect];
LABEL_260:
        uint64_t v52 = v3;
        goto LABEL_261;
      case 2172:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsScrollAncestor];
        goto LABEL_27;
      case 2174:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityUseContextlessPassthroughForDrag];
        goto LABEL_27;
      case 2175:
        uint64_t v7 = [a1 _accessibilityDragSourceDescriptorDictionaryRepresentations];
        break;
      case 2176:
        uint64_t v7 = [a1 _accessibilityDropPointDescriptorDictionaryRepresentations];
        break;
      case 2177:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsAttachmentElement];
        goto LABEL_27;
      case 2178:
        uint64_t v7 = [a1 _accessibilityCustomActionGroupIdentifier];
        break;
      case 2179:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsMediaPlaying];
        goto LABEL_27;
      case 2180:
        uint64_t v7 = [a1 _accessibilityHeadingLevel];
        break;
      case 2181:
        uint64_t v53 = [a1 _iosAccessibilityAttributeValue:2003];
        double v54 = (void *)MEMORY[0x1E4F29238];
        [v53 rectValue];
        double v57 = objc_msgSend(v54, "valueWithSize:", v55, v56);
        goto LABEL_546;
      case 2182:
        uint64_t v53 = [a1 _iosAccessibilityAttributeValue:2003];
        __int16 v120 = (void *)MEMORY[0x1E4F29238];
        [v53 rectValue];
        double v57 = objc_msgSend(v120, "valueWithPoint:");
        goto LABEL_546;
      case 2183:
        uint64_t v7 = [a1 _accessibilityElementForTextInsertionAndDeletion];
        break;
      case 2184:
        uint64_t v7 = [a1 _accessibilityGroupedParent];
        break;
      case 2185:
        uint64_t v7 = [a1 description];
        break;
      case 2186:
        uint64_t v7 = [a1 _accessibilityAXAttributedUserInputLabelsIncludingFallbacks];
        break;
      case 2187:
        if ([a1 _accessibilityShouldApplySemanticGroupContainerType])
        {
          id v4 = (__CFString *)&unk_1EF1718F0;
          goto LABEL_30;
        }
        int v86 = NSNumber;
        uint64_t v87 = objc_msgSend(v3, "axContainerTypeFromUIKitContainerType:", objc_msgSend(v3, "accessibilityContainerType"));
LABEL_540:
        uint64_t v7 = [v86 numberWithUnsignedLong:v87];
        break;
      case 2188:
        uint64_t v7 = [a1 _accessibilityElementHelp];
        break;
      case 2189:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityUpdatesSwitchMenu];
        goto LABEL_27;
      case 2190:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityUseElementAtPositionAfterActivation];
        goto LABEL_27;
      case 2191:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsStrongPasswordField];
        goto LABEL_27;
      case 2192:
        id v121 = NSNumber;
        uint64_t v101 = [a1 _accessibilityNotificationCount];
        NSUInteger v102 = v121;
        goto LABEL_466;
      case 2193:
        uint64_t v7 = [a1 _accessibilityTextualContext];
        break;
      case 2194:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityKeyboardIsContinuousPathTracking];
        goto LABEL_27;
      case 2195:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityKeyboardIsContinuousPathAvailable];
        goto LABEL_27;
      case 2196:
        uint64_t v7 = [a1 _accessibilityNextElementsForSpeakThis];
        break;
      case 2197:
        uint64_t v7 = [a1 _accessibilitySpeakThisLeafDescendants];
        break;
      case 2198:
        uint64_t v122 = NSNumber;
        uint64_t v53 = [a1 _accessibilityFindAncestor:&__block_literal_global_1095 startWithSelf:1];
        uint64_t v123 = [v53 isFirstResponder];
        goto LABEL_345;
      case 2199:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityAllowsActivationWithoutBeingNativeFocused];
        goto LABEL_27;
      case 2200:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityHasPopup];
        goto LABEL_27;
      case 2201:
        uint64_t v7 = [a1 accessibilityPopupValue];
        break;
      case 2202:
        uint64_t v7 = [a1 _accessibilityTouchContainerStartingWithSelf:0];
        break;
      case 2203:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldIncludeMediaDescriptionsRotor];
        goto LABEL_27;
      case 2204:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityCanBecomeNativeFocused];
        goto LABEL_27;
      case 2205:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityChildrenContainerGroupingBehaviorHasOverridingParentDelegate];
        goto LABEL_27;
      case 2206:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityParentDiscardsChildrenContainerGroupingBehavior];
        goto LABEL_27;
      case 2207:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsBannerNotificationElement];
        goto LABEL_27;
      case 2208:
        uint64_t v7 = [a1 _accessibilitySelectedChildren];
        break;
      case 2209:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilitySkipImageTraitDescription];
        goto LABEL_27;
      case 2210:
        uint64_t v124 = [a1 _accessibilityCustomContent];
        if (!v124) {
          goto LABEL_514;
        }
        NSPoint v125 = (void *)v124;
        id v196 = 0;
        id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v124 requiringSecureCoding:1 error:&v196];
        uint64_t v53 = v196;

        if (!v53) {
          goto LABEL_547;
        }
        NSPoint v126 = AXRuntimeLogCommon();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
          -[NSObject(AXPrivCategory) _iosAccessibilityAttributeValue:]();
        }
        goto LABEL_366;
      case 2211:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityRetainsFocusOnScreenChange];
        goto LABEL_27;
      case 2212:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsInDescriptionListTerm];
        goto LABEL_27;
      case 2213:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsInDescriptionListDefinition];
        goto LABEL_27;
      case 2214:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityExpandedStatusTogglesOnActivate];
        goto LABEL_27;
      case 2215:
        uint64_t v7 = [a1 _accessibilityResolvedEditingStyles];
        break;
      case 2216:
        uint64_t v38 = [a1 _accessibilityVisibleTextRange];
        goto LABEL_553;
      case 2217:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldIncludeRemoteParentCustomActions];
        goto LABEL_27;
      case 2218:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldIncludeRegionDescription];
        goto LABEL_27;
      case 2219:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsGroupedParent];
        goto LABEL_27;
      case 2220:
        NSUInteger v103 = NSNumber;
        uint64_t v104 = [a1 accessibilitySemanticGroupChildrentCount];
        goto LABEL_465;
      case 2221:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIncludeRoleInGroupNavigationOnly];
        goto LABEL_27;
      case 2222:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIncludeRoleDescription];
        goto LABEL_27;
      case 2223:
        uint64_t v8 = NSNumber;
        uint64_t v9 = [a1 _accessibilitySecureName];
LABEL_314:
        uint64_t v7 = [v8 numberWithUnsignedInt:v9];
        break;
      case 2224:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldUseHostContextIDForPress];
        goto LABEL_27;
      case 2225:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsFirstItemInSuggestion];
        goto LABEL_27;
      case 2226:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsLastItemInSuggestion];
        goto LABEL_27;
      case 2227:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsInsertion];
        goto LABEL_27;
      case 2228:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsDeletion];
        goto LABEL_27;
      case 2229:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsInJindo];
        goto LABEL_27;
      case 2230:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsMarkAnnotation];
        goto LABEL_27;
      case 2231:
        uint64_t v7 = [a1 _accessibilityFirstWebElement];
        break;
      case 2232:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsMacVisualAppearance];
        goto LABEL_27;
      case 2233:
        uint64_t v7 = [a1 _accessibilityDirectTouchOptionsAttribute];
        break;
      case 2234:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldUseHostContextIDForTap];
        goto LABEL_27;
      case 2235:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldUseHostContextIDForLongPress];
        goto LABEL_27;
      case 2236:
        double v41 = (void *)MEMORY[0x1E4F29238];
        [a1 _accessibilityKeyboardFrame];
LABEL_328:
        objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
        uint64_t v116 = v41;
        goto LABEL_395;
      case 2237:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilityIsInNonNativeTextControl];
        goto LABEL_27;
      case 2238:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsJindo];
        goto LABEL_27;
      case 2239:
        uint64_t v7 = [a1 _accessibilityTableIndexTitles];
        break;
      case 2240:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityKeyboardIsEmojiInputMode];
        goto LABEL_27;
      case 2301:
        if ([a1 conformsToProtocol:&unk_1EF1CB3D0])
        {
          uint64_t v127 = 1;
        }
        else
        {
          uint64_t v176 = [v3 accessibilityTraits];
          uint64_t v127 = (*MEMORY[0x1E4F48B98] & ~v176) == 0;
        }
        v177 = [v3 _accessibilitySupportsReadingContent];
        uint64_t v53 = v177;
        if (v177) {
          uint64_t v127 = [v177 BOOLValue];
        }
        CGPoint v129 = NSNumber;
        uint64_t v128 = v127;
        goto LABEL_545;
      case 2302:
        if (objc_opt_respondsToSelector())
        {
          id v4 = [v3 accessibilityAttributedPageContent];
          if (v4) {
            goto LABEL_30;
          }
        }
        id v4 = [v3 accessibilityPageContent];
        if (v4) {
          goto LABEL_30;
        }
        uint64_t v7 = [v3 _accessibilityPageContent];
        break;
      case 2304:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityBookShowsDualPages];
        goto LABEL_27;
      case 2305:
        uint64_t v7 = [a1 _accessibilityPageTextMarkerRange];
        break;
      case 2306:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIncludeDuringContentReading];
        goto LABEL_27;
      case 2307:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilitySupportsFrameForRange];
        goto LABEL_27;
      case 2308:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilitySupportsRangeForLineNumber];
        goto LABEL_27;
      case 2311:
        uint64_t v122 = NSNumber;
        uint64_t v53 = [a1 _accessibilityContainerTypes];
        uint64_t v123 = [v53 containsObject:&unk_1EF171908];
LABEL_345:
        uint64_t v128 = v123;
        CGPoint v129 = v122;
LABEL_545:
        double v57 = [v129 numberWithBool:v128];
        goto LABEL_546;
      case 2312:
        uint64_t v7 = [a1 accessibilityPreviousTextNavigationElement];
        break;
      case 2313:
        uint64_t v7 = [a1 accessibilityNextTextNavigationElement];
        break;
      case 2314:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityTouchContainerShouldOutputBraille];
        goto LABEL_27;
      case 2315:
        uint64_t v130 = [a1 _accessibilityCapturedImages];
        id v4 = [MEMORY[0x1E4F1CA48] array];
        long long v187 = 0u;
        long long v188 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        uint64_t v53 = v130;
        uint64_t v131 = [v53 countByEnumeratingWithState:&v187 objects:v200 count:16];
        if (v131)
        {
          uint64_t v132 = v131;
          uint64_t v133 = *(void *)v188;
          do
          {
            for (uint64_t i = 0; i != v132; ++i)
            {
              if (*(void *)v188 != v133) {
                objc_enumerationMutation(v53);
              }
              CGRect v135 = UIImagePNGRepresentation(*(UIImage **)(*((void *)&v187 + 1) + 8 * i));
              if (v135) {
                [(__CFString *)v4 addObject:v135];
              }
            }
            uint64_t v132 = [v53 countByEnumeratingWithState:&v187 objects:v200 count:16];
          }
          while (v132);
        }

        goto LABEL_547;
      case 2316:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 accessibilitySupportsTextSelection];
        goto LABEL_27;
      case 2317:
        uint64_t v5 = NSNumber;
        uint64_t v191 = MEMORY[0x1E4F143A8];
        uint64_t v192 = 3221225472;
        v193 = __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke_1113;
        uint64_t v194 = &unk_1E59B8EB8;
        uint64_t v195 = a1;
        uint64_t v6 = __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke_1113();
        goto LABEL_27;
      case 2318:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityElementServesAsHeadingLandmark];
        goto LABEL_27;
      case 2319:
        uint64_t v136 = [a1 _accessibilityBrailleMap];
        if (!v136) {
          goto LABEL_514;
        }
        id v137 = (void *)v136;
        id v197 = 0;
        id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v136 requiringSecureCoding:1 error:&v197];
        uint64_t v53 = v197;

        if (!v53) {
          goto LABEL_547;
        }
        NSPoint v126 = AXRuntimeLogCommon();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
          -[NSObject(AXPrivCategory) _iosAccessibilityAttributeValue:]();
        }
LABEL_366:

        goto LABEL_547;
      case 2320:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsSwitch];
        goto LABEL_27;
      case 2400:
        uint64_t v7 = [a1 accessibilityMathEquation];
        break;
      case 2401:
        uint64_t v7 = [a1 accessibilityMathMLSource];
        break;
      case 2402:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldSpeakMathEquationTrait];
        goto LABEL_27;
      case 2403:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityShouldExpandMathEquation];
        goto LABEL_27;
      case 2500:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityIsTourGuideRunning];
        goto LABEL_27;
      case 2501:
        uint64_t v7 = [a1 _accessibilityMapsExplorationCurrentRoadsWithAngles];
        break;
      case 2502:
        uint64_t v7 = [a1 _accessibilityMapsExplorationCurrentLocation];
        break;
      case 2503:
        uint64_t v7 = [a1 _accessibilityMapsExplorationCurrentIntersectionDescription];
        break;
      case 2504:
        uint64_t v7 = [a1 _accessibilityMapsExplorationIncreaseVerbosity];
        break;
      case 2505:
        uint64_t v7 = [a1 _accessibilityMapsExplorationDecreaseVerbosity];
        break;
      case 2506:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityMapsExplorationIsActive];
        goto LABEL_27;
      case 2507:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityMapsExplorationIsPending];
        goto LABEL_27;
      case 2600:
        uint64_t v7 = [a1 _accessibilityHandwritingElement];
        break;
      case 2601:
        uint64_t v7 = [a1 _accessibilityHandwritingAttributes];
        break;
      case 2602:
        uint64_t v5 = NSNumber;
        uint64_t v6 = [a1 _accessibilityRequiresLaTeXInput];
        goto LABEL_27;
      default:
        switch(a3)
        {
          case 2701:
            uint64_t v8 = NSNumber;
            uint64_t v9 = [a1 _accessibilityEffectiveMediaAnalysisOptions];
            goto LABEL_314;
          case 2702:
            uint64_t v7 = [a1 _accessibilityDataSeriesName];
            goto LABEL_29;
          case 2703:
            double v11 = NSNumber;
            uint64_t v12 = [a1 _accessibilityDataSeriesType];
            goto LABEL_23;
          case 2704:
            double v93 = NSNumber;
            [a1 _accessibilityDataSeriesSonificationDuration];
            goto LABEL_388;
          case 2705:
            uint64_t v5 = NSNumber;
            uint64_t v6 = [a1 _accessibilityDataSeriesSupportsSummarization];
            goto LABEL_27;
          case 2706:
            uint64_t v5 = NSNumber;
            uint64_t v6 = [a1 _accessibilityDataSeriesSupportsSonification];
            goto LABEL_27;
          case 2707:
            uint64_t v5 = NSNumber;
            uint64_t v6 = [a1 _accessibilityDataSeriesIncludesTrendlineInSonification];
            goto LABEL_27;
          case 2708:
          case 2715:
          case 2716:
            goto LABEL_30;
          case 2709:
            [a1 _accessibilityMediaAnalysisFrame];
            goto LABEL_394;
          case 2710:
            uint64_t v7 = [a1 _accessibilityMediaAnalysisElement];
            goto LABEL_29;
          case 2711:
            uint64_t v53 = [a1 _accessibilityChartDescriptor];
            double v57 = [v53 dictionaryRepresentation];
            goto LABEL_546;
          case 2712:
            CGRect v139 = [a1 _accessibilityChartElement];
            id v140 = [v139 accessibilityChartDescriptor];
            CGRect v141 = [v140 identifier];
            uint64_t v142 = [v141 UUIDString];

            id v4 = (__CFString *)v142;
            goto LABEL_30;
          case 2713:
            uint64_t v5 = NSNumber;
            uint64_t v6 = [a1 _accessibilitySupportsAudiographs];
            goto LABEL_27;
          case 2714:
            uint64_t v7 = [a1 _accessibilityChartElement];
            goto LABEL_29;
          case 2717:
            uint64_t v7 = [a1 _accessibilityPHAssetLocalIdentifier];
            goto LABEL_29;
          case 2718:
            uint64_t v7 = [a1 _accessibilityChartStructureDescription];
            goto LABEL_29;
          case 2719:
            uint64_t v5 = NSNumber;
            uint64_t v6 = [a1 _accessibilityIsPHAssetLocallyAvailable];
            goto LABEL_27;
          case 2720:
            uint64_t v7 = [a1 _accessibilityPhotoLibraryURL];
            goto LABEL_29;
          case 2721:
            uint64_t v7 = [a1 _accessibilityFBSceneIdentifier];
            goto LABEL_29;
          default:
            if (a3 != 1503) {
              goto LABEL_30;
            }
            double v11 = NSNumber;
            uint64_t v12 = [a1 _accessibilityApplicationOrientation];
            break;
        }
        goto LABEL_23;
    }
LABEL_29:
    id v4 = (__CFString *)v7;
    goto LABEL_30;
  }
  if (a3 > 8999)
  {
    if (a3 > 13000)
    {
      if (a3 == 13001)
      {
        uint64_t v7 = [a1 _accessibilitySemanticContext];
      }
      else
      {
        if (a3 != 13002) {
          goto LABEL_30;
        }
        if ([a1 _accessibilityUnfocusableViewCanBeFocusedForFocusEverywhere])
        {
          uint64_t v10 = 1;
        }
        else
        {
          uint64_t v23 = [v3 _accessibilityGetBlockForAttribute:5010];
          double v24 = (void *)v23;
          if (v23) {
            uint64_t v10 = (*(uint64_t (**)(uint64_t))(v23 + 16))(v23);
          }
          else {
            uint64_t v10 = 0;
          }
        }
        int v14 = NSNumber;
        uint64_t v13 = v10;
LABEL_28:
        uint64_t v7 = [v14 numberWithBool:v13];
      }
    }
    else
    {
      switch(a3)
      {
        case 12000:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityIsScannerElement];
          goto LABEL_27;
        case 12001:
        case 12005:
          goto LABEL_30;
        case 12002:
          uint64_t v7 = [a1 _accessibilityVariantKeys];
          goto LABEL_29;
        case 12003:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityHasVariantKeys];
          goto LABEL_27;
        case 12004:
          double v11 = NSNumber;
          uint64_t v12 = [a1 _accessibilityScannerActivateBehavior];
          goto LABEL_23;
        case 12006:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityKeyboardKeyHasSignificantAlternateActions];
          goto LABEL_27;
        case 12007:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityHandlesTabKey];
          goto LABEL_27;
        case 12008:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityHandlesRemoteFocusMovement];
          goto LABEL_27;
        case 12009:
          uint64_t v16 = NSNumber;
          uint64_t v17 = [a1 _accessibilityRemotePid];
          goto LABEL_38;
        case 12010:
          uint64_t v16 = NSNumber;
          uint64_t v17 = [a1 _accessibilityHostPid];
          goto LABEL_38;
        case 12011:
          uint64_t v7 = [a1 _accessibilityFKAArrowKeysHandled];
          goto LABEL_29;
        case 12012:
          uint64_t v16 = NSNumber;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v17 = [v3 onClientSide];
LABEL_38:
            uint64_t v18 = v17;
          }
          else
          {
            uint64_t v18 = 0;
          }
          double v19 = v16;
LABEL_53:
          uint64_t v7 = [v19 numberWithInt:v18];
          break;
        case 12013:
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v18 = [v3 remotePid];
          }
          else {
            uint64_t v18 = 0;
          }
          double v19 = NSNumber;
          goto LABEL_53;
        case 12014:
          uint64_t v7 = [a1 _accessibilityRemoteSceneID];
          goto LABEL_29;
        case 12015:
          double v20 = @"_promoteSwitchControlMenuItemsKey";
          goto LABEL_44;
        case 12016:
          uint64_t v7 = [a1 _accessibilityTapReplacementGestures];
          goto LABEL_29;
        case 12017:
          uint64_t v7 = [a1 _accessibilityScannerGroupElements];
          goto LABEL_29;
        default:
          if (a3 != 9000) {
            goto LABEL_30;
          }
          [a1 _accessibilityGesturePracticeRegion];
          objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
          uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
          break;
      }
    }
    goto LABEL_29;
  }
  switch(a3)
  {
    case 5001:
      uint64_t v7 = [a1 automationElements];
      goto LABEL_29;
    case 5002:
      uint64_t v7 = [a1 _accessibilityUserTestingParent];
      goto LABEL_29;
    case 5003:
      uint64_t v7 = [a1 _accessibilityUserTestingElementType];
      goto LABEL_29;
    case 5004:
      uint64_t v7 = [a1 _accessibilityUserTestingElementBaseType];
      goto LABEL_29;
    case 5005:
      double v42 = NSNumber;
      [a1 _accessibilityMinValue];
      goto LABEL_478;
    case 5006:
      double v42 = NSNumber;
      [a1 _accessibilityMaxValue];
      goto LABEL_478;
    case 5007:
      [a1 _accessibilityMinScrubberPosition];
      goto LABEL_414;
    case 5008:
      [a1 _accessibilityMaxScrubberPosition];
LABEL_414:
      objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenPointToContextSpace:");
      double v77 = (void *)MEMORY[0x1E4F29238];
      goto LABEL_536;
    case 5009:
      uint64_t v7 = [a1 _accessibilityUserTestingElementAttributes];
      goto LABEL_29;
    case 5010:
      uint64_t v7 = [(id)*MEMORY[0x1E4F43630] _accessibilityMainWindow];
      goto LABEL_29;
    case 5011:
      uint64_t v7 = [a1 _accessibilityAbsoluteValue];
      goto LABEL_29;
    case 5012:
    case 5013:
    case 5040:
    case 5044:
    case 5060:
    case 5065:
    case 5066:
    case 5067:
      break;
    case 5014:
      double v21 = NSNumber;
      uint64_t v22 = [a1 _accessibilityPageIndex];
      goto LABEL_549;
    case 5015:
      double v21 = NSNumber;
      uint64_t v22 = [a1 _accessibilityPageCount];
      goto LABEL_549;
    case 5016:
      uint64_t v7 = [a1 _accessibilityUserTestingVisibleCells];
      goto LABEL_29;
    case 5017:
      uint64_t v7 = [a1 _accessibilityUserTestingVisibleSections];
      goto LABEL_29;
    case 5018:
      uint64_t v5 = NSNumber;
      uint64_t v6 = [a1 _accessibilityBackingElementIsValid];
      goto LABEL_27;
    case 5019:
      double v35 = [a1 accessibilityIdentifier];
      uint64_t v143 = [v3 _accessibilityPostProcessValueForAutomation:v35];
      goto LABEL_561;
    case 5020:
      uint64_t v5 = NSNumber;
      uint64_t v6 = [a1 _accessibilityIsTableCell];
      goto LABEL_27;
    case 5021:
      uint64_t v7 = [a1 _accessibilityInputIdentifierForKeyboard];
      goto LABEL_29;
    case 5022:
      uint64_t v7 = [a1 _accessibiltyAvailableKeyplanes];
      goto LABEL_29;
    case 5023:
      uint64_t v7 = [a1 _accessibilityKeyboardKeyEnteredString];
      goto LABEL_29;
    case 5024:
      uint64_t v7 = [a1 _accessibilityStatusBar];
      goto LABEL_29;
    case 5025:
      uint64_t v7 = [a1 _accessibilityAncestry];
      goto LABEL_29;
    case 5026:
      CGRect v144 = (void *)MEMORY[0x1E4F29238];
      uint64_t v145 = 1;
      goto LABEL_461;
    case 5027:
      CGRect v144 = (void *)MEMORY[0x1E4F29238];
      uint64_t v145 = 0;
LABEL_461:
      objc_msgSend(a1, "__accessibilityVisibleScrollArea:", v145);
      double v77 = v144;
LABEL_536:
      uint64_t v7 = objc_msgSend(v77, "valueWithPoint:", v78, v79);
      goto LABEL_29;
    case 5028:
      uint64_t v5 = NSNumber;
      uint64_t v6 = [a1 _accessibilityAnimationsInProgress];
      goto LABEL_27;
    case 5029:
      uint64_t v7 = [a1 _accessibilityDOMAttributes];
      goto LABEL_29;
    case 5030:
      double v21 = NSNumber;
      uint64_t v22 = [a1 _accessibilityUserTestingChildrenCount];
LABEL_549:
      uint64_t v7 = [v21 numberWithInteger:v22];
      goto LABEL_29;
    case 5031:
      double v11 = NSNumber;
      uint64_t v12 = [a1 _accessibilityPickerType];
      goto LABEL_23;
    case 5032:
      NSUInteger v103 = NSNumber;
      uint64_t v104 = [a1 _accessibilityDatePickerComponentType];
LABEL_465:
      uint64_t v101 = v104;
      NSUInteger v102 = v103;
LABEL_466:
      uint64_t v7 = [v102 numberWithUnsignedInteger:v101];
      goto LABEL_29;
    case 5033:
      uint64_t v7 = [a1 _accessibilityDateTimePickerValues];
      goto LABEL_29;
    case 5034:
      uint64_t v5 = NSNumber;
      uint64_t v6 = [a1 _accessibilityIsUserInteractionEnabled];
      goto LABEL_27;
    case 5035:
      uint64_t v5 = NSNumber;
      uint64_t v6 = [a1 _accessibilityKeyboardSupportsGestureMode];
      goto LABEL_27;
    case 5036:
      uint64_t v5 = NSNumber;
      uint64_t v6 = [a1 _accessibilityFauxCollectionViewCellsDisabled];
      goto LABEL_27;
    case 5037:
      uint64_t v5 = NSNumber;
      uint64_t v6 = [a1 _accessibilityIsStarkElement];
      goto LABEL_27;
    case 5038:
      uint64_t v7 = [a1 _accessibilityUserTestingActionIdentifiers];
      goto LABEL_29;
    case 5039:
      uint64_t v7 = [a1 _accessibilityUserTestingSnapshot];
      goto LABEL_29;
    case 5041:
      buf[0] = 0;
      objc_opt_class();
      NSRect v152 = [v3 _accessibilityViewController];
      uint64_t v53 = __UIAccessibilityCastAsClass();

      if (!v53) {
        goto LABEL_471;
      }
      double v57 = [v53 title];
      goto LABEL_546;
    case 5042:
      uint64_t v53 = [a1 _accessibilityViewController];
      if (v53)
      {
        uint64_t v146 = (objc_class *)objc_opt_class();
        double v57 = NSStringFromClass(v146);
LABEL_546:
        id v4 = (__CFString *)v57;
      }
      else
      {
LABEL_471:
        id v4 = 0;
      }
LABEL_547:

      break;
    case 5043:
      uint64_t v7 = [a1 accessibilityPlaceholderValue];
      goto LABEL_29;
    case 5045:
      id v147 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v147);
      goto LABEL_29;
    case 5046:
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a1);
      goto LABEL_29;
    case 5047:
      uint64_t v7 = [a1 accessibilityLocalizedStringKey];
      goto LABEL_29;
    case 5048:
      uint64_t v7 = [a1 accessibilityLocalizationBundleID];
      goto LABEL_29;
    case 5049:
      uint64_t v7 = [a1 accessibilityLocalizationBundlePath];
      goto LABEL_29;
    case 5050:
      uint64_t v7 = [a1 accessibilityLocalizedStringTableName];
      goto LABEL_29;
    case 5051:
      uint64_t v5 = NSNumber;
      uint64_t v6 = [a1 _accessibilityFauxTableViewCellsDisabled];
      goto LABEL_27;
    case 5052:
      a1 = (void *)*MEMORY[0x1E4F43630];
      double v20 = @"AXSpeakSelectionLastSpokenString";
LABEL_44:
      uint64_t v7 = [a1 _accessibilityValueForKey:v20];
      goto LABEL_29;
    case 5053:
      uint64_t v148 = NSNumber;
      [(id)*MEMORY[0x1E4F43630] _accessibilityMagnifierZoomLevel];
      uint64_t v138 = v148;
LABEL_389:
      uint64_t v7 = objc_msgSend(v138, "numberWithDouble:");
      goto LABEL_29;
    case 5054:
      uint64_t v7 = [a1 _accessibilityVerticalScrollBarElement];
      goto LABEL_29;
    case 5055:
      uint64_t v7 = [a1 _accessibilityHorizontalScrollBarElement];
      goto LABEL_29;
    case 5056:
      uint64_t v5 = NSNumber;
      uint64_t v6 = [a1 _accessibilityIsScrollBarIndicator];
LABEL_27:
      uint64_t v13 = v6;
      int v14 = v5;
      goto LABEL_28;
    case 5057:
      double v11 = NSNumber;
      uint64_t v12 = [a1 _accessibilityOrientation];
LABEL_23:
      uint64_t v7 = [v11 numberWithLong:v12];
      goto LABEL_29;
    case 5058:
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a1, "_accessibilityAutomationType"));
      goto LABEL_29;
    case 5059:
      if (objc_opt_respondsToSelector())
      {
        double v42 = NSNumber;
        [v3 _accessibilityNumberValue];
LABEL_478:
        *(float *)&double v43 = v43;
LABEL_479:
        uint64_t v7 = [v42 numberWithFloat:v43];
      }
      else
      {
        uint64_t v50 = v3;
        uint64_t v51 = 2006;
LABEL_559:
        uint64_t v7 = [v50 _iosAccessibilityAttributeValue:v51];
      }
      goto LABEL_29;
    case 5061:
      uint64_t v7 = [a1 _accessibilityWindowSections];
      goto LABEL_29;
    case 5062:
      uint64_t v7 = [a1 automationCustomProperties];
      goto LABEL_29;
    case 5063:
      uint64_t v7 = [a1 automationSystemProperties];
      goto LABEL_29;
    case 5064:
      uint64_t v149 = (void *)MEMORY[0x1E4F29238];
      [a1 _accessibilityContentOffset];
      uint64_t v7 = objc_msgSend(v149, "valueWithCGPoint:");
      goto LABEL_29;
    case 5068:
      int v150 = NSNumber;
      uint64_t v53 = [a1 _accessibilityFirstResponderForKeyWindow];
      double v57 = objc_msgSend(v150, "numberWithUnsignedInteger:", -[NSObject _accessibilityBoundaryEdges](v53, "_accessibilityBoundaryEdges"));
      goto LABEL_546;
    case 5069:
      uint64_t v117 = [a1 _accessibilityForegroundTextColorAttribute];
      goto LABEL_450;
    case 5070:
      uint64_t v117 = [a1 _accessibilityBackgroundTextColorAttribute];
LABEL_450:
      uint64_t v53 = v117;
      double v57 = [v53 CGColor];
      goto LABEL_546;
    case 5071:
      CGRect v151 = NSNumber;
      uint64_t v53 = [a1 _accessibilityFirstResponderForKeyWindow];
      double v57 = objc_msgSend(v151, "numberWithInteger:", -[NSObject _accessibilityDigitalCrownScrollAmount](v53, "_accessibilityDigitalCrownScrollAmount"));
      goto LABEL_546;
    case 5072:
      CGRect v153 = (void *)MEMORY[0x1E4F29238];
      [a1 _accessibilityContentSize];
      uint64_t v7 = objc_msgSend(v153, "valueWithSize:");
      goto LABEL_29;
    default:
      switch(a3)
      {
        case 3000:
          uint64_t v7 = [a1 _accessibilityFirstElement];
          goto LABEL_29;
        case 3001:
        case 3004:
        case 3005:
        case 3010:
        case 3011:
        case 3012:
        case 3013:
        case 3016:
        case 3017:
        case 3018:
        case 3019:
        case 3023:
        case 3027:
        case 3034:
        case 3035:
        case 3036:
        case 3037:
        case 3040:
        case 3043:
        case 3044:
        case 3045:
        case 3047:
        case 3050:
        case 3051:
        case 3052:
        case 3054:
        case 3060:
        case 3061:
        case 3062:
        case 3063:
        case 3068:
        case 3069:
        case 3071:
        case 3072:
          goto LABEL_30;
        case 3002:
          uint64_t v154 = [a1 accessibilityTextInputResponder];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            CGRect v155 = [v3 accessibilityTextInputResponder];
            int v156 = [v155 isFirstResponder];

            if (v156)
            {
              uint64_t v7 = [v3 accessibilityTextInputResponder];
              goto LABEL_29;
            }
          }
          else
          {
          }
          uint64_t v50 = (void *)*MEMORY[0x1E4F43630];
          uint64_t v51 = 3002;
          goto LABEL_559;
        case 3003:
          uint64_t v7 = [a1 _accessibilityBundleIdentifier];
          goto LABEL_29;
        case 3006:
          uint64_t v53 = [a1 accessibilityTitleElement];
          double v57 = objc_msgSend(MEMORY[0x1E4F1C978], "axArrayByIgnoringNilElementsWithCount:", 1, v53);
          goto LABEL_546;
        case 3007:
          uint64_t v7 = _UIAXLastKeyboardUsed();
          goto LABEL_29;
        case 3008:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityCameraIrisOpen];
          goto LABEL_27;
        case 3009:
          uint64_t v7 = [a1 _accessibilityFirstElementForFocus];
          goto LABEL_29;
        case 3014:
          uint64_t v7 = [a1 _accessibilitySupportedLanguages];
          goto LABEL_29;
        case 3015:
          uint64_t v7 = [a1 _accessibilityVisibleElementsHonoringGroups:0];
          goto LABEL_29;
        case 3020:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityIsInternationalKeyboardKey];
          goto LABEL_27;
        case 3021:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityIsAccessibilityUIServer];
          goto LABEL_27;
        case 3022:
          uint64_t v7 = [a1 _accessibilityExplorerElements];
          goto LABEL_29;
        case 3024:
          uint64_t v7 = [a1 _accessibilityNativeFocusElement];
          goto LABEL_29;
        case 3025:
        case 3032:
          uint64_t v7 = [a1 _accessibilityElementsWithSemanticContext:0];
          goto LABEL_29;
        case 3026:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityIsRTL];
          goto LABEL_27;
        case 3028:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityIsSoftwareKeyboardMimic];
          goto LABEL_27;
        case 3029:
        case 3031:
          uint64_t v7 = [a1 _accessibilityNativeFocusableElements:0];
          goto LABEL_29;
        case 3030:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilitySupportsDirectioOrbManipulation];
          goto LABEL_27;
        case 3033:
          uint64_t v7 = [a1 accessibilityExpandedTextValue];
          goto LABEL_29;
        case 3038:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityRealtimeCompleted];
          goto LABEL_27;
        case 3039:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityRealtimeHasUnread];
          goto LABEL_27;
        case 3041:
          uint64_t v53 = [MEMORY[0x1E4F28F80] processInfo];
          double v57 = [v53 processName];
          goto LABEL_546;
        case 3042:
          uint64_t v7 = [a1 accessibilityLinkRelationshipType];
          goto LABEL_29;
        case 3046:
          uint64_t v7 = [a1 _accessibilityFirstElementsForSpeakThis];
          goto LABEL_29;
        case 3048:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityHasNativeFocusableElements];
          goto LABEL_27;
        case 3049:
          uint64_t v7 = [a1 _accessibilityFocusRingAncestor];
          goto LABEL_29;
        case 3053:
          uint64_t v7 = [a1 accessibilityVisibleText];
          goto LABEL_29;
        case 3055:
          uint64_t v7 = [a1 _accessibilityWindow];
          goto LABEL_29;
        case 3056:
          uint64_t v7 = [a1 _accessibilityWindowSceneIdentifier];
          goto LABEL_29;
        case 3057:
          uint64_t v7 = [a1 _accessibility2DBrailleCanvasElement];
          goto LABEL_29;
        case 3058:
          [a1 accessibilityBrailleMapRenderRegion];
          double v157 = v209.origin.x;
          double v158 = v209.origin.y;
          double v159 = v209.size.width;
          double v160 = v209.size.height;
          if (CGRectIsEmpty(v209))
          {
LABEL_514:
            id v4 = 0;
            goto LABEL_30;
          }
          double v35 = [v3 _accessibilityParentView];
          uint64_t v178 = [v35 window];
          objc_msgSend(v35, "convertRect:toView:", v178, v157, v158, v159, v160);
          objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
          double v180 = v179;
          double v182 = v181;
          double v184 = v183;
          double v186 = v185;

          uint64_t v143 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v180, v182, v184, v186);
          break;
        case 3059:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityElementHasImage];
          goto LABEL_27;
        case 3064:
          uint64_t v161 = [MEMORY[0x1E4F28B50] mainBundle];
          double v162 = [v161 preferredLocalizations];
          uint64_t v163 = [v162 firstObject];

          id v4 = (__CFString *)v163;
          goto LABEL_30;
        case 3065:
          uint64_t v7 = [NSNumber numberWithLongLong:BSGetVersionedPID()];
          goto LABEL_29;
        case 3066:
          uint64_t v5 = NSNumber;
          uint64_t v6 = [a1 _accessibilityApplicationIsRTL];
          goto LABEL_27;
        case 3067:
          uint64_t v7 = [a1 _accessibilityRuntimeElementTransactionSummary];
          goto LABEL_29;
        case 3070:
          uint64_t v7 = [a1 _accessibilityGetAllScrollViews];
          goto LABEL_29;
        case 3073:
          uint64_t v7 = [a1 _accessibilityChildrenForContinuityDisplay];
          goto LABEL_29;
        default:
          switch(a3)
          {
            case 4001:
              double v21 = NSNumber;
              uint64_t v22 = [a1 _accessibilityLineStartPosition];
              goto LABEL_549;
            case 4002:
              double v21 = NSNumber;
              uint64_t v22 = [a1 _accessibilityLineEndPosition];
              goto LABEL_549;
            case 4003:
              uint64_t v7 = [a1 _accessibilityTextMarkerRange];
              goto LABEL_29;
            case 4004:
              uint64_t v7 = [a1 _accessibilityTextMarkerRangeForSelection];
              goto LABEL_29;
            case 4005:
              uint64_t v38 = [a1 _accessibilitySelectedNSRangeForObject];
LABEL_553:
              uint64_t v105 = v38;
              uint64_t v106 = (void *)MEMORY[0x1E4F29238];
LABEL_554:
              uint64_t v7 = objc_msgSend(v106, "valueWithRange:", v105, v39);
              goto LABEL_29;
            case 4006:
              uint64_t v5 = NSNumber;
              uint64_t v6 = [a1 _accessibilityHoverTypingShouldAdjustDockedMode];
              goto LABEL_27;
            default:
              goto LABEL_30;
          }
          goto LABEL_30;
      }
LABEL_561:
      id v4 = (__CFString *)v143;
LABEL_562:

      break;
  }
LABEL_30:

  return v4;
}

- (void)_iosAccessibilitySetValue:()AXPrivCategory forAttribute:
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4 <= 3001)
  {
    if (a4 > 2207)
    {
      if (a4 > 2707)
      {
        if (a4 == 2708)
        {
          if (objc_opt_respondsToSelector())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v7 doubleValue];
              objc_msgSend(a1, "_accessibilityDidChangeSonificationPlaybackPosition:");
            }
          }
        }
        else if (a4 == 2716)
        {
          objc_msgSend(a1, "_accessibilitySonificationPlaybackStatusChanged:", objc_msgSend(v6, "unsignedIntegerValue"));
        }
      }
      else if (a4 == 2208)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [a1 _accessibilitySetSelectedChildren:v7];
        }
      }
      else if (a4 == 2303)
      {
        [a1 _accessibilitySetCurrentWordInPageContext:v6];
      }
    }
    else if (a4 > 2017)
    {
      if (a4 == 2018)
      {
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = [v8 objectForKeyedSubscript:@"focused"];
        uint64_t v17 = [v16 BOOLValue];
        uint64_t v18 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F48880]];
        [a1 _accessibilityHandleATFocused:v17 assistiveTech:v18];

        goto LABEL_57;
      }
      if (a4 == 2054) {
        [a1 _accessibilitySetAutoscrollTarget:v6];
      }
    }
    else
    {
      if (a4 == 2005)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v19 = [v7 rangeValue];
          objc_msgSend(a1, "_accessibilitySetSelectedTextRange:", v19, v20);
          goto LABEL_58;
        }
        id v8 = v7;
        uint64_t v10 = [v8 firstObject];
        uint64_t v11 = [v10 rangeValue];
        uint64_t v13 = v12;

        int v14 = [v8 lastObject];
        uint64_t v15 = [v14 integerValue];

        if (v15 == 1)
        {
          AXSetSelectionModeVoiceOverSelectionMovement(1);
          objc_msgSend(a1, "_accessibilitySetSelectedTextRange:", v11, v13);
          AXSetSelectionModeVoiceOverSelectionMovement(0);
        }
        else
        {
          objc_msgSend(a1, "_accessibilitySetSelectedTextRange:", v11, v13);
        }
LABEL_57:

        goto LABEL_58;
      }
      if (a4 == 2006) {
        [a1 _accessibilitySetValue:v6];
      }
    }
  }
  else if (a4 <= 5035)
  {
    if (a4 > 3016)
    {
      if (a4 == 3017)
      {
        objc_msgSend((id)*MEMORY[0x1E4F43630], "_accessibilitySetWantsOpaqueElementProviders:", objc_msgSend(v6, "BOOLValue"));
      }
      else if (a4 == 3026)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(a1, "_accessibilitySetVoiceOverRTLOverride:", objc_msgSend(v7, "integerValue"));
        }
      }
    }
    else if (a4 == 3002)
    {
      if ([v6 _accessibilityCanBeFirstResponder]) {
        [v7 becomeFirstResponder];
      }
    }
    else if (a4 == 3007)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        _UIAXSetLastKeyboardUsed(v7);
      }
    }
  }
  else if (a4 <= 5063)
  {
    if (a4 == 5036)
    {
      objc_msgSend(a1, "_setAccessibilityFauxCollectionViewCellsDisabled:", objc_msgSend(v6, "BOOLValue"));
    }
    else if (a4 == 5051)
    {
      objc_msgSend(a1, "_setAccessibilityFauxTableViewCellsDisabled:", objc_msgSend(v6, "BOOLValue"));
    }
  }
  else if (a4 == 5064)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [a1 _accessibilityScrollAncestor];
      [v7 pointValue];
      objc_msgSend(v9, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0);
    }
  }
  else
  {
    if (a4 != 12015)
    {
      if (a4 == 5067)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v7 integerValue];
          _AXSVoiceOverTouchSetEnabledAppTemporaryOverride();
        }
      }
      goto LABEL_58;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21[0] = v7;
      id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [a1 _accessibilitySetAdditionalImportantScannerMenuItems:v8];
      goto LABEL_57;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [a1 _accessibilitySetAdditionalImportantScannerMenuItems:v7];
    }
  }
LABEL_58:
}

- (id)_getAccessibilityAttributedString
{
  id v1 = [a1 accessibilityLabel];
  uint64_t v2 = [v1 _accessibilityAttributedLocalizedString];

  return v2;
}

- (id)_accessibilityRetrieveLocalizedStringKey
{
  id v1 = [a1 _getAccessibilityAttributedString];
  uint64_t v2 = [v1 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringKey"];

  return v2;
}

- (id)_accessibilityRetrieveLocalizationBundleID
{
  id v1 = [a1 _getAccessibilityAttributedString];
  uint64_t v2 = [v1 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringBundleID"];

  return v2;
}

- (id)_accessibilityRetrieveLocalizationBundlePath
{
  id v1 = [a1 _getAccessibilityAttributedString];
  uint64_t v2 = [v1 attributeValueForKey:@"UIAccessibilityTokenLocalizationBundlePath"];

  return v2;
}

- (id)_accessibilityRetrieveLocalizedStringTableName
{
  id v1 = [a1 _getAccessibilityAttributedString];
  uint64_t v2 = [v1 attributeValueForKey:@"UIAccessibilityTokenLocalizedStringTableName"];

  return v2;
}

- (uint64_t)_accessibilityShouldInheritTraits
{
  return 0;
}

- (uint64_t)_accessibilityInheritedTraits
{
  uint64_t v2 = [a1 accessibilityTraits];
  uint64_t v3 = [a1 accessibilityContainer];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      uint64_t v5 = [v4 accessibilityTraits];
      uint64_t v6 = [v4 accessibilityContainer];

      v2 |= v5;
      id v4 = (void *)v6;
    }
    while (v6);
  }
  return v2;
}

- (id)_accessibilityTraitsAsHumanReadableStrings:()AXPrivCategory
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
  uint64_t v5 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) init];
  uint64_t v6 = v5;
  if ((*MEMORY[0x1E4F434F0] & ~a3) == 0) {
    [v5 addObject:@"trait.button"];
  }
  if ((*MEMORY[0x1E4F43518] & ~a3) == 0) {
    [v6 addObject:@"trait.link"];
  }
  if ((*MEMORY[0x1E4F43538] & ~a3) == 0) {
    [v6 addObject:@"trait.searchfield"];
  }
  if ((*MEMORY[0x1E4F43508] & ~a3) == 0) {
    [v6 addObject:@"trait.image"];
  }
  if ((*MEMORY[0x1E4F43540] & ~a3) == 0) {
    [v6 addObject:@"trait.selected"];
  }
  if ((*MEMORY[0x1E4F43530] & ~a3) == 0) {
    [v6 addObject:@"trait.playssound"];
  }
  if ((*MEMORY[0x1E4F43510] & ~a3) == 0) {
    [v6 addObject:@"trait.keyboardkey"];
  }
  if ((*MEMORY[0x1E4F43550] & ~a3) == 0) {
    [v6 addObject:@"trait.statictext"];
  }
  if ((*MEMORY[0x1E4F43558] & ~a3) == 0) {
    [v6 addObject:@"trait.summaryelement"];
  }
  if ((*MEMORY[0x1E4F43528] & ~a3) == 0) {
    [v6 addObject:@"trait.notenabled"];
  }
  if ((*MEMORY[0x1E4F43570] & ~a3) == 0) {
    [v6 addObject:@"trait.updatesfrequently"];
  }
  if ((*MEMORY[0x1E4F43548] & ~a3) == 0) {
    [v6 addObject:@"trait.startsmedia"];
  }
  if ((*MEMORY[0x1E4F434E0] & ~a3) == 0) {
    [v6 addObject:@"trait.adjustable"];
  }
  if ((*MEMORY[0x1E4F434F8] & ~a3) == 0) {
    [v6 addObject:@"trait.causes.page.turn"];
  }
  if ((*MEMORY[0x1E4F434E8] & ~a3) == 0) {
    [v6 addObject:@"trait.direct.interaction"];
  }
  if ((*MEMORY[0x1E4F43500] & ~a3) == 0) {
    [v6 addObject:@"trait.header"];
  }
  if ((UIAccessibilityTraitTabButton & ~a3) == 0) {
    [v6 addObject:@"trait.tab"];
  }
  if ((*MEMORY[0x1E4F43568] & ~a3) == 0) {
    [v6 addObject:@"trait.toggle"];
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = UIKitAccessibilityLocalizedString(v12);
        if (!v13)
        {
          uint64_t v15 = v12;
          _AXAssert();
        }
        if (objc_msgSend(v13, "length", v15)) {
          [v4 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v4;
}

- (uint64_t)_accessibilityTraitsInspectorHumanReadable
{
  uint64_t v2 = [a1 accessibilityTraits];

  return [a1 _accessibilityTraitsAsHumanReadableStrings:v2];
}

- (id)_accessibilityPreferredScrollActions
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v3 = [a1 _accessibilityCanPerformAction:2009];
  int v4 = [a1 _accessibilityCanPerformAction:2008];
  int v5 = [a1 _accessibilityCanPerformAction:2007];
  int v6 = [a1 _accessibilityCanPerformAction:2006];
  id v7 = &unk_1EF171938;
  if (!v5) {
    id v7 = 0;
  }
  if (v6) {
    uint64_t v8 = &unk_1EF171920;
  }
  else {
    uint64_t v8 = v7;
  }
  [v2 axSafelyAddObject:v8];
  uint64_t v9 = &unk_1EF171968;
  if (!v4) {
    uint64_t v9 = 0;
  }
  if (v3) {
    uint64_t v10 = &unk_1EF171950;
  }
  else {
    uint64_t v10 = v9;
  }
  [v2 axSafelyAddObject:v10];

  return v2;
}

- (uint64_t)_accessibilityIsKindOfUIView
{
  return 0;
}

- (uint64_t)_accessibilityIsRemoteElement
{
  return 0;
}

- (uint64_t)_accessibilitySupportsChartsV2
{
  return [a1 _accessibilityBoolValueForKey:@"_accessibilitySupportsChartsV2"];
}

- (uint64_t)_accessibilitySetSupportsChartsV2:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"_accessibilitySupportsChartsV2"];
}

- (uint64_t)_accessibilityViewIsMacIdiom
{
  return 0;
}

- (uint64_t)_accessibilityIsMacVisualAppearance
{
  return 0;
}

- (uint64_t)_accessibilityShouldSuppressCustomActionsHint
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a1 _accessibilityCustomActions];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "shouldSuppressActionHint", (void)v6))
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)_accessibilityCanBeFirstResponderWhenNotAnElement
{
  return 0;
}

- (uint64_t)_accessibilityCanBeFirstResponder
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)_accessibilityAllContextDescriptors
{
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = a1;
  if (v3)
  {
    int v4 = v3;
    do
    {
      int v5 = [v4 _accessibilityContextDescriptors];
      [v2 addObjectsFromArray:v5];

      uint64_t v6 = [v4 accessibilityContainer];

      int v4 = (void *)v6;
    }
    while (v6);
  }

  return v2;
}

- (uint64_t)_accessibilityShouldIncludeMediaDescriptionsRotor
{
  return 0;
}

- (uint64_t)_accessibilitySkipImageTraitDescription
{
  return 0;
}

- (id)_accessibilityBrailleMapsFromGraphData
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v16 = [a1 _accessibilityChartDescriptor];
  if (v16)
  {
    id v20 = [MEMORY[0x1E4F17460] connectedBrailleMap];
    if (v20)
    {
      long long v19 = [v16 yAxis];
      uint64_t v15 = [v16 xAxis];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass)
      {
        uint64_t v2 = 0;
        double v3 = 1.0;
      }
      else
      {
        objc_opt_class();
        double v3 = 0.0;
        uint64_t v2 = 0;
        if (objc_opt_isKindOfClass())
        {
          [v15 lowerBound];
          uint64_t v2 = v4;
          [v15 upperBound];
          double v3 = v5;
        }
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      obuint64_t j = [v16 series];
      uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v6)
      {
        uint64_t v18 = *(void *)v36;
        char v7 = isKindOfClass & 1;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(obj);
            }
            long long v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            v33[0] = 0;
            v33[1] = v33;
            void v33[2] = 0x2020000000;
            int v34 = -1;
            v31[0] = 0;
            v31[1] = v31;
            v31[2] = 0x2020000000;
            int v32 = -1;
            uint64_t v10 = [v9 dataPoints];
            uint64_t v11 = [v10 count];

            uint64_t v12 = [v9 dataPoints];
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            void v21[2] = __66__NSObject_AXPrivCategory___accessibilityBrailleMapsFromGraphData__block_invoke;
            v21[3] = &unk_1E59B92B0;
            char v30 = v7;
            uint64_t v27 = v11;
            uint64_t v28 = v2;
            double v29 = v3;
            id v22 = v19;
            id v23 = v20;
            double v24 = v9;
            double v25 = v33;
            double v26 = v31;
            [v12 enumerateObjectsUsingBlock:v21];

            _Block_object_dispose(v31, 8);
            _Block_object_dispose(v33, 8);
          }
          uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        }
        while (v6);
      }

      id v13 = v20;
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (id)_accessibilityBrailleMap
{
  uint64_t v2 = [MEMORY[0x1E4F17460] connectedBrailleMap];
  if (v2)
  {
    id v3 = a1;
    uint64_t v4 = v3;
    if (v3)
    {
      double v5 = v3;
      while (1)
      {
        uint64_t v6 = [v5 accessibilityBrailleMapRenderer];
        if (v6) {
          break;
        }
        uint64_t v7 = [v5 accessibilityContainer];

        double v5 = (void *)v7;
        if (!v7) {
          goto LABEL_6;
        }
      }
      long long v9 = (void *)v6;
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v2);
      id v8 = v2;
    }
    else
    {
LABEL_6:
      id v8 = [v4 _accessibilityBrailleMapsFromGraphData];
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)setAccessibilityCustomContent:()AXPrivCategory
{
  id v4 = (id)[a3 copy];
  [a1 _accessibilitySetRetainedValue:v4 forKey:@"accessibilityCustomContent"];
}

- (id)accessibilityCustomContent
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:28];
  id v3 = (void *)v2;
  if (v2) {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else {
  id v4 = [a1 _accessibilityValueForKey:@"accessibilityCustomContent"];
  }

  return v4;
}

- (id)_accessibilityCustomContent
{
  id v1 = a1;
  id v2 = 0;
  if (!v1)
  {
LABEL_14:
    id v2 = v2;
    uint64_t v7 = v2;
    goto LABEL_15;
  }
  while (1)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = [v1 accessibilityCustomContentBlock];
      if (v3) {
        break;
      }
    }
    id v4 = [v1 accessibilityCustomContent];
    if (v4)
    {
      if (v2) {
        goto LABEL_10;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      double v5 = [MEMORY[0x1E4F42FF8] viewControllerForView:v1];
      id v4 = [v5 accessibilityCustomContent];

      if (v2) {
        goto LABEL_10;
      }
    }
    if (v4) {
      id v2 = (id)objc_opt_new();
    }
LABEL_10:
    [v2 axSafelyAddObjectsFromArray:v4];
    if (([v1 _accessibilityShouldIncludeParentCustomContent] & 1) == 0)
    {

      goto LABEL_14;
    }
    uint64_t v6 = [v1 accessibilityContainer];

    id v1 = (id)v6;
    if (!v6) {
      goto LABEL_14;
    }
  }
  long long v9 = (void *)v3;
  uint64_t v7 = (*(void (**)(void))(v3 + 16))();

LABEL_15:

  return v7;
}

- (uint64_t)_accessibilityIsSwitch
{
  return 0;
}

- (uint64_t)_accessibilityRetainsFocusOnScreenChange
{
  return 0;
}

- (uint64_t)_accessibilityIsNonDismissableStatusBarElement
{
  return 0;
}

- (id)_accessibilityContextDescriptors
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityContextDescriptors);
}

- (uint64_t)_accessibilitySetContextDescriptors:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityElementForRow:()AXPrivCategory andColumn:
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__2;
  uint64_t v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__NSObject_AXPrivCategory__accessibilityElementForRow_andColumn___block_invoke;
  v6[3] = &unk_1E59B92D8;
  v6[4] = &v7;
  void v6[5] = a3;
  v6[6] = a4;
  [a1 accessibilityEnumerateAncestorsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)accessibilityDataTableCellElementForRow:()AXPrivCategory column:
{
  uint64_t v6 = [a1 _accessibilityGetBlockForAttribute:5006];
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    id v8 = (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a3, a4);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (uint64_t)_accessibilityKeyboardIsContinuousPathTracking
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardIsContinuousPathAvailable
{
  return 0;
}

- (uint64_t)_accessibilityIndexPath
{
  return 0;
}

- (uint64_t)_accessibilityIndexPathAsRange
{
  id v2 = [a1 _accessibilityParentCollectionView];

  if (!v2)
  {
    uint64_t v3 = [a1 _accessibilityParentTableView];

    if (!v3) {
      return 0x7FFFFFFFLL;
    }
  }
  id v4 = [a1 _accessibilityAncestorIsKindOf:objc_opt_class()];
  uint64_t v5 = [v4 _accessibilityIndexPathAsRange];

  return v5;
}

- (uint64_t)_accessibilityParentTableView
{
  uint64_t v2 = objc_opt_class();

  return [a1 _accessibilityAncestorIsKindOf:v2];
}

- (uint64_t)_accessibilityParentCollectionView
{
  uint64_t v2 = objc_opt_class();

  return [a1 _accessibilityAncestorIsKindOf:v2];
}

- (uint64_t)accessibilityRowRange
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:5003];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    id v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = [v4 rangeValue];

      goto LABEL_27;
    }
  }
  if ([a1 _accessibilityIsInTabBar])
  {
    uint64_t v7 = [a1 _accessibilityTabBarAncestor];
    if (!v7)
    {
      long long v16 = AXLogAppAccessibility();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        uint64_t v21 = a1;
        _os_log_impl(&dword_19F2DB000, v16, OS_LOG_TYPE_INFO, "Found a tab bar item with no ancestor. Marking it as not a tab bar item, but this may indicate that views are being moved from tab bars to other superviews: %@", (uint8_t *)&v20, 0xCu);
      }

      [a1 _axSetCachedHasTabBarAncestor:MEMORY[0x1E4F1CC28]];
      uint64_t v15 = 0;
      uint64_t v6 = 0x7FFFFFFFLL;
      goto LABEL_20;
    }
    id v8 = +[UIAccessibilityElementTraversalOptions options];
    uint64_t v9 = [v7 _accessibilityLeafDescendantsWithOptions:v8];

    if ([v9 count])
    {
      uint64_t v10 = [v9 indexOfObject:a1];
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v6 = v10;
        uint64_t v15 = [v9 count];
        goto LABEL_19;
      }
      uint64_t v11 = AXLogAppAccessibility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412546;
        uint64_t v21 = a1;
        __int16 v22 = 2112;
        id v23 = v9;
        id v12 = "Tried to get row range from a tab bar item, but it was not one of the tab bar's accessibility element descendants: %@, %@";
        id v13 = v11;
        uint32_t v14 = 22;
LABEL_16:
        _os_log_impl(&dword_19F2DB000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v20, v14);
      }
    }
    else
    {
      uint64_t v11 = AXLogAppAccessibility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        uint64_t v21 = v7;
        id v12 = "Tried to get row range from a tab bar item, but there were no descendants for the tab bar: %@";
        id v13 = v11;
        uint32_t v14 = 12;
        goto LABEL_16;
      }
    }

    uint64_t v15 = 0;
    uint64_t v6 = 0x7FFFFFFFLL;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  uint64_t v15 = 0;
  uint64_t v6 = 0x7FFFFFFFLL;
LABEL_21:
  if (v6 == 0x7FFFFFFF && !v15)
  {
    long long v17 = [a1 _accessibilityValueForKey:@"_accessibilityRowRangeKey"];
    uint64_t v18 = v17;
    if (v17) {
      uint64_t v6 = [v17 rangeValue];
    }
    else {
      uint64_t v6 = 0x7FFFFFFFLL;
    }
  }
LABEL_27:

  return v6;
}

- (void)_accessibilitySetRowRange:()AXPrivCategory
{
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetValue:v2 forKey:@"_accessibilityRowRangeKey" storageMode:0];
}

- (uint64_t)_accessibilityColumnCount
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0x7FFFFFFFLL;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__NSObject_AXPrivCategory___accessibilityColumnCount__block_invoke;
  v3[3] = &unk_1E59B8FA8;
  v3[4] = &v4;
  [a1 accessibilityEnumerateAncestorsUsingBlock:v3];
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)_accessibilityColumnRange
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x3010000000;
  uint64_t v7 = "";
  long long v8 = xmmword_19F3490A0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__NSObject_AXPrivCategory___accessibilityColumnRange__block_invoke;
  v3[3] = &unk_1E59B8FA8;
  v3[4] = &v4;
  [a1 accessibilityEnumerateAncestorsUsingBlock:v3];
  uint64_t v1 = v5[4];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)_accessibilityRowRangeFromTableOrCollectionView:()AXPrivCategory
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3010000000;
  id v12 = "";
  long long v13 = xmmword_19F3490A0;
  if (!_accessibilityRowRangeFromTableOrCollectionView__BaseNSObjectMethod)
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    _accessibilityRowRangeFromTableOrCollectionView__BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v5, sel_accessibilityRowRange);
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__NSObject_AXPrivCategory___accessibilityRowRangeFromTableOrCollectionView___block_invoke;
  v8[3] = &unk_1E59B92D8;
  void v8[4] = &v9;
  v8[5] = sel_accessibilityRowRange;
  v8[6] = a3;
  [a1 accessibilityEnumerateAncestorsUsingBlock:v8];
  uint64_t v6 = v10[4];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (uint64_t)_accessibilityRowRange
{
  return [a1 _accessibilityRowRangeFromTableOrCollectionView:0];
}

- (id)_accessibilityUserDefinedShouldIncludeRowRangeInElementDescription
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityUserDefinedShouldIncludeRowRangeInElementDescription);
}

- (uint64_t)_accessibilitySetUserDefinedShouldIncludeRowRangeInElementDescription:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilitySetShouldIncludeRowRangeInElementDescription:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetUserDefinedShouldIncludeRowRangeInElementDescription:v2];
}

- (uint64_t)_accessibilityShouldIncludeRowRangeInElementDescription
{
  id v2 = [a1 _accessibilityUserDefinedShouldIncludeRowRangeInElementDescription];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 BOOLValue];
  }
  else
  {
    uint64_t v5 = [a1 _iosAccessibilityAttributeValue:2004];
    uint64_t v6 = [v5 unsignedIntegerValue];

    if (((UIAccessibilityTraitRadioButton | *MEMORY[0x1E4F43560] | *MEMORY[0x1E4F43510] | UIAccessibilityTraitTabButton) & v6) != 0)
    {
      uint64_t v4 = 1;
    }
    else if (((*MEMORY[0x1E4F434E0] | *MEMORY[0x1E4F434F0]) & v6) != 0)
    {
      char v8 = 0;
      [a1 _accessibilityRowRangeFromTableOrCollectionView:&v8];
      uint64_t v4 = v8 == 0;
    }
    else
    {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

- (uint64_t)_accessibilityImplementsDefaultRowRange
{
  return 0;
}

- (uint64_t)_accessibilityRowCount
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0x7FFFFFFFLL;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__NSObject_AXPrivCategory___accessibilityRowCount__block_invoke;
  v3[3] = &unk_1E59B8FA8;
  v3[4] = &v4;
  [a1 accessibilityEnumerateAncestorsUsingBlock:v3];
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)accessibilityColumnRange
{
  uint64_t v1 = [a1 _accessibilityGetBlockForAttribute:5002];
  id v2 = (void *)v1;
  if (v1
    && ((*(void (**)(uint64_t))(v1 + 16))(v1), (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v4 = v3;
    uint64_t v5 = [v3 rangeValue];
  }
  else
  {
    uint64_t v5 = 0x7FFFFFFFLL;
  }

  return v5;
}

- (uint64_t)_accessibilityIsFirstElementForFocus
{
  return 0;
}

- (uint64_t)_accessibilitySupplementaryHeaderViews
{
  return [a1 _accessibilityValueForKey:@"SupplementaryHeaderViews"];
}

- (uint64_t)_accessibilitySupplementaryFooterViews
{
  return [a1 _accessibilityValueForKey:@"SupplementaryFooterViews"];
}

- (uint64_t)_accessibilitySetSupplementaryFooterViews:()AXPrivCategory
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"SupplementaryFooterViews"];
}

- (uint64_t)_accessibilitySetSupplementaryHeaderViews:()AXPrivCategory
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"SupplementaryHeaderViews"];
}

- (id)_accessibilityUserDefinedAdditionalElements
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityUserDefinedAdditionalElements);
}

- (uint64_t)_accessibilitySetUserDefinedAdditionalElements:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)_accessibilityTableViewCellContentSubviews
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsClass();
  uint64_t v1 = [v0 contentView];
  id v2 = [v1 subviews];

  return v2;
}

- (id)_accessibilityCollectionViewCellContentSubviews
{
  objc_opt_class();
  v0 = __UIAccessibilityCastAsClass();
  uint64_t v1 = [v0 contentView];
  id v2 = [v1 subviews];

  return v2;
}

- (uint64_t)_accessibilityServesAsFirstResponder
{
  return 0;
}

- (uint64_t)_accessibilityResponderElement
{
  return 0;
}

- (uint64_t)_accessibilityIsTableCell
{
  return 0;
}

- (BOOL)_accessibilityIsInTableCell
{
  uint64_t v1 = [a1 _accessibilityAncestorIsKindOf:objc_opt_class()];
  BOOL v2 = v1 != 0;

  return v2;
}

- (BOOL)_accessibilityIsInCollectionCell
{
  uint64_t v1 = [a1 _accessibilityAncestorIsKindOf:objc_opt_class()];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)_accessibilityLoadURL:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityTableIndexTitles
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardIsEmojiInputMode
{
  return 0;
}

- (uint64_t)_accessibilityIsAwayAlertElement
{
  return 0;
}

- (uint64_t)_accessibilityIsAwayAlertElementNew
{
  return 0;
}

- (uint64_t)_accessibilityIsBannerNotificationElement
{
  return 0;
}

- (uint64_t)_accessibilityNotificationCount
{
  return 0;
}

- (uint64_t)_accessibilityNotificationSummary:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityCanDismissPopoverController:()AXPrivCategory
{
  return 1;
}

- (uint64_t)_accessibilityContainedByTableLogicIsEnabledOutsideOfWebContext
{
  return 1;
}

- (uint64_t)_accessibilityCanDeleteTableViewCell
{
  return 0;
}

- (uint64_t)_accessibilityDidDeleteTableViewCell
{
  return 0;
}

- (uint64_t)_accessibilityVariantKeys
{
  return 0;
}

- (uint64_t)_accessibilityHasVariantKeys
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardKeyHasSignificantAlternateActions
{
  return 0;
}

- (uint64_t)_accessibilityRespectsTableScrollEnabledFlag
{
  return 0;
}

- (uint64_t)_accessibilityCellWithRowIndex:()AXPrivCategory column:containingView:
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardKeyForString:()AXPrivCategory
{
  return 0;
}

- (void)_accessibilitySetObscuredScreenAllowedViews:()AXPrivCategory
{
  id v4 = _Block_copy(aBlock);
  [a1 _accessibilitySetRetainedValue:v4 forKey:@"_accessibilitySetObscuredScreenAllowedViews"];
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v1 = [a1 _accessibilityValueForKey:@"_accessibilitySetObscuredScreenAllowedViews"];
  BOOL v2 = (void *)v1;
  if (v1)
  {
    uint64_t v3 = (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityHitTestingObscuredScreenAllowedViews
{
  return 0;
}

- (uint64_t)_accessibilityIsKeyboardPassthroughInputAccessoryView
{
  return 0;
}

- (uint64_t)_accessibilityAlternateActionForURL:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityTableCellUsesDetailTextAsValue
{
  return [a1 _accessibilityBoolValueForKey:@"DetailTextAsValue"];
}

- (uint64_t)_setAccessibilityTableCellUsesDetailTextAsValue:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"DetailTextAsValue"];
}

- (id)_accessibilityApplication
{
  uint64_t v1 = [a1 _accessibilityParentView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    id v2 = [v1 window];
  }
  uint64_t v3 = v2;
  if ([v2 safeBoolForKey:@"_isHostedInAnotherProcess"]
    && (int)[v3 _accessibilityRemotePid] >= 1)
  {
    id AppElementWithPid = (id)_AXUIElementCreateAppElementWithPid();
  }
  else
  {
    id AppElementWithPid = (id)*MEMORY[0x1E4F43630];
  }
  uint64_t v5 = AppElementWithPid;

  return v5;
}

- (id)_accessibilityRemoteApplication
{
  return (id)*MEMORY[0x1E4F43630];
}

- (uint64_t)_accessibilityUsesSpecialKeyboardDismiss
{
  uint64_t v1 = [a1 accessibilityContainer];
  if (!v1) {
    return 0;
  }
  id v2 = (void *)v1;
  do
  {
    uint64_t v3 = [v2 _accessibilityUsesSpecialKeyboardDismiss];
    if (v3) {
      break;
    }
    uint64_t v4 = [v2 accessibilityContainer];

    id v2 = (void *)v4;
  }
  while (v4);

  return v3;
}

- (id)_accessibilityWindowScene
{
  uint64_t v1 = [a1 _accessibilityWindow];
  id v2 = [v1 windowScene];

  return v2;
}

- (uint64_t)accessibilityIsWindow
{
  return 0;
}

- (id)_accessibilityWindowSceneIdentifier
{
  uint64_t v1 = [a1 _accessibilityWindow];
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 windowScene];
    uint64_t v4 = [v3 _accessibilityWindowSceneIdentifier];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_accessibilityFBSceneIdentifier
{
  uint64_t v1 = [a1 _accessibilityWindowScene];
  id v2 = [v1 _accessibilityFBSceneIdentifier];

  return v2;
}

- (uint64_t)_accessibilityContextId
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = [MEMORY[0x1E4F43058] _applicationKeyWindow];
    uint64_t v3 = [v2 _accessibilityContextId];
  }
  else
  {
    id v2 = [a1 _accessibilityParentView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v2;
    }
    else
    {
      id v4 = [v2 window];
    }
    uint64_t v5 = v4;
    uint64_t v3 = [v4 _accessibilityContextId];
  }
  return v3;
}

- (id)_accessibilityApplicationWindowContextIDs
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA48] array];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v1 = objc_msgSend((id)*MEMORY[0x1E4F43630], "_accessibilityWindowsIgnoringWindowsWithHiddenElements:", 0, 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = [*(id *)(*((void *)&v8 + 1) + 8 * i) safeValueForKey:@"_accessibilityContextId"];
        [v0 axSafelyAddObject:v6];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }

  return v0;
}

- (uint64_t)_accessibilityDisplayId
{
  uint64_t v1 = [a1 _accessibilityWindow];
  uint64_t v2 = [v1 screen];
  uint64_t v3 = [v2 _integerDisplayID];

  return v3;
}

- (uint64_t)_accessibilityStatusBar
{
  v0 = AXLogCommon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    -[NSObject(AXPrivCategory) _accessibilityStatusBar]();
  }

  return 0;
}

- (id)_accessibilityRetrieveImagePathLabel:()AXPrivCategory
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = [v3 lastPathComponent];
    uint64_t v5 = [v4 stringByDeletingPathExtension];

    uint64_t v6 = [v5 rangeOfString:@"@@"];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v7 = [v5 substringToIndex:v6];

      uint64_t v5 = (void *)v7;
    }
    if ([v5 length])
    {
      id v8 = v5;
      if ((unint64_t)[v8 length] >= 0x1F)
      {
        uint64_t v9 = [v8 substringToIndex:30];

        id v8 = (id)v9;
      }
    }
    else
    {
      id v8 = v3;
    }
    long long v11 = [v8 stringByReplacingOccurrencesOfString:@"_" withString:@" "];

    id v12 = [v11 stringByReplacingOccurrencesOfString:@"-" withString:@" "];

    long long v10 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v12];
    [v10 setAttribute:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F48A08]];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)_accessibilityInputIdentifierForKeyboard
{
  v0 = [MEMORY[0x1E4F42B30] sharedInputModeController];
  uint64_t v1 = [v0 currentInputMode];
  uint64_t v2 = [v1 identifierWithLayouts];

  return v2;
}

- (uint64_t)_accessibilityAllowsAlternativeCharacterActivation
{
  return 0;
}

- (uint64_t)_accessibilityIsInternationalKeyboardKey
{
  return 0;
}

- (uint64_t)_accessibilityIsAccessibilityUIServer
{
  return 0;
}

- (uint64_t)_accessibilityIsIsolatedWindow
{
  return 0;
}

- (uint64_t)_accessibilityElementCommunityIdentifier
{
  return 0;
}

- (uint64_t)_accessibilityIsOrnamentWindow
{
  return 0;
}

- (uint64_t)_accessibilityIsUsingRemoteParentActivateAction
{
  return 0;
}

- (uint64_t)_accessibilityInterfaceOrientationForScreenCoordinates
{
  return 0;
}

- (uint64_t)_accessibilityIsFKARunningForFocusItem
{
  return 0;
}

- (uint64_t)_accessibilityFKAShouldProcessChildren
{
  uint64_t v1 = [a1 _accessibilityValueForKey:@"AXFKAShouldProcessChildren"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (void)_accessibilitySetFKAShouldProcessChildren:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"AXFKAShouldProcessChildren"];
}

- (id)_accessibilityDefaultFocusGroupIdentifier
{
  id v2 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v5 = [v2 stringWithFormat:@"%@:%p", v4, a1];

  return v5;
}

- (id)_axGetStoredFocusGroupIdentifier
{
  return objc_getAssociatedObject(a1, &__NSObjectAccessibility___axGetStoredFocusGroupIdentifier);
}

- (uint64_t)_setAxStoredFocusGroupIdentifier:()AXPrivCategory
{
  return MEMORY[0x1F41063E0](a1, &__NSObjectAccessibility___axGetStoredFocusGroupIdentifier);
}

- (uint64_t)_accessibilityIsVerticalAdjustableElement
{
  return 0;
}

- (id)_accessibilityKeyCommands
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = [a1 accessibilityTraits];
  uint64_t v4 = (void *)MEMORY[0x1E4F43A80];
  uint64_t v5 = (void *)MEMORY[0x1E4F439D8];
  uint64_t v6 = (void *)MEMORY[0x1E4F43A60];
  uint64_t v7 = (void *)MEMORY[0x1E4F43A78];
  if ((*MEMORY[0x1E4F434E0] & v3) != 0)
  {
    int v8 = [a1 _accessibilityIsVerticalAdjustableElement];
    int v9 = [a1 _accessibilityIsRTL];
    long long v10 = (void *)*v6;
    if (v9) {
      long long v11 = (void *)*v6;
    }
    else {
      long long v11 = (void *)*v7;
    }
    if (v9) {
      long long v10 = (void *)*v7;
    }
    if (v8) {
      id v12 = (void *)*v4;
    }
    else {
      id v12 = v11;
    }
    uint64_t v13 = (void *)*v5;
    if (!v8) {
      uint64_t v13 = v10;
    }
    uint32_t v14 = (void *)MEMORY[0x1E4F42AF8];
    id v15 = v13;
    id v16 = v12;
    long long v17 = [v14 keyCommandWithInput:v16 modifierFlags:0 action:sel_accessibilityIncrement];
    v27[0] = v17;
    uint64_t v18 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:v15 modifierFlags:0 action:sel_accessibilityDecrement];
    v27[1] = v18;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    [v2 addObjectsFromArray:v19];

    uint64_t v5 = (void *)MEMORY[0x1E4F439D8];
    uint64_t v7 = (void *)MEMORY[0x1E4F43A78];

    uint64_t v6 = (void *)MEMORY[0x1E4F43A60];
  }
  if ([a1 _accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement])
  {
    int v20 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*v4 modifierFlags:0 action:sel__fkaMoveUp];
    v26[0] = v20;
    uint64_t v21 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*v5 modifierFlags:0 action:sel__fkaMoveDown];
    v26[1] = v21;
    __int16 v22 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*v6 modifierFlags:0 action:sel__fkaMoveLeft];
    v26[2] = v22;
    id v23 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*v7 modifierFlags:0 action:sel__fkaMoveRight];
    v26[3] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    [v2 addObjectsFromArray:v24];
  }

  return v2;
}

- (uint64_t)_accessibilityKeyCommandsShouldOverrideKeyCommands
{
  return 0;
}

- (uint64_t)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 0;
}

- (BOOL)_accessibilityHandlesTabKey
{
  uint64_t v1 = [a1 accessibilityTraits];
  return ((*MEMORY[0x1E4F48C28] | *MEMORY[0x1E4F48CF8]) & ~v1) == 0;
}

- (uint64_t)_accessibilityFKAArrowKeysHandled
{
  return 0;
}

- (void)_fkaMoveUp
{
}

- (void)_fkaMoveDown
{
}

- (void)_fkaMoveLeft
{
}

- (void)_fkaMoveRight
{
}

- (id)_accessibilityElementToFocusForAppearanceScreenChange
{
  if ([a1 isAccessibilityElement]
    && ([a1 isAccessibilityOpaqueElementProvider] & 1) == 0)
  {
    id v2 = a1;
  }
  else if ([a1 _accessibilityHasOrderedChildren])
  {
    uint64_t v7 = 0;
    int v8 = &v7;
    uint64_t v9 = 0x3032000000;
    long long v10 = __Block_byref_object_copy__2;
    long long v11 = __Block_byref_object_dispose__2;
    id v12 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __81__NSObject_AXPrivCategory___accessibilityElementToFocusForAppearanceScreenChange__block_invoke;
    v6[3] = &unk_1E59B9328;
    v6[4] = &v7;
    [a1 accessibilityEnumerateContainerElementsUsingBlock:v6];
    id v2 = [(id)v8[5] _accessibilityElementToFocusForAppearanceScreenChange];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    uint64_t v3 = [a1 _accessibilitySortedElementsWithin];
    uint64_t v4 = [v3 firstObject];

    id v2 = [v4 _accessibilityElementToFocusForAppearanceScreenChange];
  }

  return v2;
}

- (uint64_t)_accessibilityFocusRingAncestor
{
  return [a1 _accessibilityFindAncestor:&__block_literal_global_1296 startWithSelf:0 findTopmostAncestor:1];
}

- (uint64_t)_accessibilityIsSupportedGestureRecognizer
{
  return 1;
}

- (uint64_t)_accessibilityShouldAttemptToAddDismissalElement
{
  return 1;
}

- (uint64_t)_accessibilityIsFocusForFocusEverywhereRunningForFocusItem
{
  return 0;
}

- (uint64_t)_accessibilityDisplayFocusIndicatorForFocusEverywhereView
{
  return 0;
}

- (uint64_t)_accessibilityHoverTypingShouldAdjustDockedMode
{
  return 0;
}

- (id)_accessibilityStoredChartDescriptor
{
  return objc_getAssociatedObject(a1, &UIAccessibilityStorageKeyChartDescriptor);
}

- (void)_accessibilitySetStoredChartDescriptor:()AXPrivCategory
{
}

- (uint64_t)_accessibilityChartElement
{
  return [a1 _accessibilityFindAncestor:&__block_literal_global_1298 startWithSelf:1];
}

- (uint64_t)_accessibilityIsChartElement
{
  id v2 = [a1 _accessibilityStoredChartDescriptor];

  if (v2 || ([a1 _accessibilitySupportsChartsV2] & 1) != 0) {
    return 1;
  }
  uint64_t v5 = [a1 _accessibilityGetBlockForAttribute:30];
  uint64_t v6 = (void *)v5;
  if (v5
    && ((*(void (**)(uint64_t))(v5 + 16))(v5),
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [a1 conformsToProtocol:&unk_1EF1CB4F0];
  }

  return v3;
}

- (uint64_t)accessibilityChartDescriptor
{
  return 0;
}

- (id)_accessibilityChartDescriptor
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:30];
  uint64_t v3 = (void *)v2;
  if (v2)
  {
    uint64_t v4 = (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    uint64_t v5 = [a1 _accessibilityChartElement];
    uint64_t v4 = [v5 _accessibilityStoredChartDescriptor];
    if (!v4)
    {
      uint64_t v4 = [v5 accessibilityChartDescriptor];
    }
  }

  return v4;
}

- (id)_accessibilityChartStructureDescription
{
  uint64_t v1 = [a1 _accessibilityChartElement];
  uint64_t v2 = [v1 _accessibilityStoredChartDescriptor];
  if (!v2)
  {
    uint64_t v2 = [v1 accessibilityChartDescriptor];
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = UIKitAccessibilityLocalizedString(@"audiograph.axis.description.x");
  double v25 = UIKitAccessibilityLocalizedString(@"audiograph.axis.description.y");
  uint64_t v5 = UIKitAccessibilityLocalizedString(@"audiograph.series.count");
  uint64_t v6 = [v2 series];
  uint64_t v7 = [v6 count];

  int v8 = [v2 xAxis];
  uint64_t v9 = [v8 title];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    long long v11 = [v2 xAxis];
    id v23 = [v11 title];
    id v12 = AXCFormattedString();

    objc_msgSend(v3, "addObject:", v12, v23);
  }
  uint64_t v13 = [v2 yAxis];
  if (v13)
  {
    uint32_t v14 = (void *)v13;
    id v15 = [v2 yAxis];
    id v16 = [v15 title];
    uint64_t v17 = [v16 length];

    if (v17)
    {
      uint64_t v18 = [v2 yAxis];
      uint64_t v24 = [v18 title];
      long long v19 = AXCFormattedString();

      objc_msgSend(v3, "addObject:", v19, v24);
    }
  }
  int v20 = objc_msgSend(NSString, "localizedStringWithFormat:", v5, v7);
  [v3 addObject:v20];
  uint64_t v21 = [v3 componentsJoinedByString:@", "];

  return v21;
}

- (uint64_t)_accessibilityShouldUseHostContextIDForPress
{
  return 0;
}

- (uint64_t)_accessibilityShouldUseHostContextIDForTap
{
  uint64_t v1 = [a1 _accessibilityGetBlockForAttribute:5007];
  uint64_t v2 = (void *)v1;
  if (v1) {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityShouldUseHostContextIDForLongPress
{
  uint64_t v1 = [a1 _accessibilityGetBlockForAttribute:5008];
  uint64_t v2 = (void *)v1;
  if (v1) {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityNativeFocusElement
{
  return 0;
}

- (uint64_t)_accessibilitySecureName
{
  uint64_t v1 = [a1 _accessibilityParentView];
  uint64_t v2 = [v1 safeUnsignedIntForKey:@"_secureName"];

  return v2;
}

- (uint64_t)accessibilityIsInsertion
{
  return 0;
}

- (uint64_t)accessibilityIsDeletion
{
  return 0;
}

- (uint64_t)accessibilityIsFirstItemInSuggestion
{
  return 0;
}

- (uint64_t)accessibilityIsLastItemInSuggestion
{
  return 0;
}

- (uint64_t)accessibilityIsMarkAnnotation
{
  return 0;
}

- (uint64_t)accessibilityIsInNonNativeTextControl
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesName
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesValuesForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesType
{
  return 0;
}

- (double)_accessibilityDataSeriesSonificationDuration
{
  return 6.0;
}

- (uint64_t)_accessibilityDataSeriesTitleForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesUnitLabelForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesMinimumValueForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesMaximumValueForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesGridlinePositionsForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesCategoryLabelsForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesValueDescriptionForPosition:()AXPrivCategory axis:
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesSupportsSummarization
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesSupportsSonification
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesIncludesTrendlineInSonification
{
  return 0;
}

- (BOOL)_accessibilitySupportsAudiographs
{
  uint64_t v1 = [a1 _accessibilityChartElement];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)_accessibilitySortCollectionViewLogically
{
  return 1;
}

- (uint64_t)_accessibilityShouldAvoidScrollingCollectionViewCells
{
  return 0;
}

- (uint64_t)_accessibilityCollectionViewCellScrollShouldInformScrollDelegate
{
  return 1;
}

- (uint64_t)_accessibilityDescendantElementAtIndexPathIsValid:()AXPrivCategory
{
  return 1;
}

- (uint64_t)_accessibilityHeaderElement
{
  return 0;
}

- (uint64_t)accessibilityTitleElement
{
  return 0;
}

- (uint64_t)_accessibilityElementsForSearchParameter:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityRetainsCustomRotorActionSetting
{
  return 0;
}

- (id)_accessibilityUserDefinedScrollAcrossPageBoundaries
{
  return objc_getAssociatedObject(a1, &__NSObjectAccessibility___accessibilityUserDefinedScrollAcrossPageBoundaries);
}

- (uint64_t)_accessibilitySetUserDefinedScrollAcrossPageBoundaries:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)_accessibilityScrollAcrossPageBoundaries
{
  uint64_t v1 = [a1 _accessibilityUserDefinedScrollAcrossPageBoundaries];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_accessibilitySetScrollAcrossPageBoundaries:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetUserDefinedScrollingEnabled:v2];
}

- (uint64_t)_accessibilityAllowedPagingOverlap
{
  return [a1 _accessibilityValueForKey:@"_accessibilityAllowedPagingOverlap"];
}

- (void)_accessibilitySetAllowedPagingOverlap:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"_accessibilityAllowedPagingOverlap"];
}

- (uint64_t)_accessibilityPagingEnabled
{
  return [a1 _accessibilityValueForKey:@"_accessibilityPagingEnabled"];
}

- (uint64_t)_accessibilitySetPagingEnabled:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"_accessibilityPagingEnabled"];
}

- (BOOL)_accessibilityDidSetOpaqueElementProvider
{
  uint64_t v1 = [a1 _accessibilityValueForKey:@"IsOpaqueProvider"];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)setIsAccessibilityOpaqueElementProvider:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"IsOpaqueProvider"];
}

- (id)_accessibilityContainerToStopVisibilityCheck
{
  return objc_getAssociatedObject(a1, &__NSObjectAccessibility___accessibilityContainerToStopVisibilityCheck);
}

- (uint64_t)_accessibilitySetContainerToStopVisibilityCheck:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)_accessibilityShouldIgnoreOpaqueElementProviders
{
  return MEMORY[0x1F4106398](a1, &__NSObjectAccessibility___accessibilityShouldIgnoreOpaqueElementProviders);
}

- (uint64_t)_accessibilitySetShouldIgnoreOpaqueElementProviders:()AXPrivCategory
{
  return MEMORY[0x1F41063D0](a1, &__NSObjectAccessibility___accessibilityShouldIgnoreOpaqueElementProviders);
}

- (uint64_t)_accessibilityStartingPointForIsVisible
{
  return MEMORY[0x1F41063A0](a1, &__NSObjectAccessibility___accessibilityStartingPointForIsVisible);
}

- (uint64_t)_accessibilitySetStartingPointForIsVisible:()AXPrivCategory
{
  return MEMORY[0x1F41063D8](a1, &__NSObjectAccessibility___accessibilityStartingPointForIsVisible);
}

- (uint64_t)_accessibilityWantsOpaqueElementProviders
{
  if ([a1 _accessibilityShouldIgnoreOpaqueElementProviders]) {
    return 0;
  }
  if (!UIAccessibilityIsSwitchControlRunning()
    && (!_AXSAutomationEnabled() || UIAccessibilityIsVoiceOverRunning()))
  {
    return 1;
  }

  return [a1 _accessibilityBoolValueForKey:@"WantsOpaqueProviders"];
}

- (uint64_t)_accessibilitySetWantsOpaqueElementProviders:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"WantsOpaqueProviders"];
}

- (uint64_t)isAccessibilityOpaqueElementProvider
{
  uint64_t v1 = [a1 _accessibilityValueForKey:@"IsOpaqueProvider"];
  BOOL v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_accessibilityOpaqueElementParent
{
  uint64_t v1 = [a1 accessibilityContainer];
  if (v1)
  {
    BOOL v2 = (void *)v1;
    uint64_t v3 = 0;
    do
    {
      if ([v2 isAccessibilityOpaqueElementProvider])
      {
        id v4 = v2;

        uint64_t v3 = v4;
      }
      uint64_t v5 = [v2 accessibilityContainer];

      BOOL v2 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_accessibilityFirstOpaqueElement
{
  BOOL v2 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  if (__60__NSObject_AXPrivCategory___accessibilityFirstOpaqueElement__block_invoke())
  {
    uint64_t v3 = [a1 _accessibilitySortedElementsWithinWithOptions:v2];
    id v4 = [v3 firstObject];
  }
  else
  {
    id v4 = [a1 _accessibilityFirstOpaqueElementWithOptions:v2];
  }

  return v4;
}

- (id)_accessibilityFirstOpaqueElementWithOptions:()AXPrivCategory
{
  id v4 = a3;
  if (__72__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementWithOptions___block_invoke())
  {
    uint64_t v5 = [a1 _accessibilityFirstOpaqueElement];
  }
  else
  {
    uint64_t v6 = [a1 _accessibilitySortedElementsWithinWithOptions:v4];
    uint64_t v5 = [v6 firstObject];
  }

  return v5;
}

- (id)_accessibilityFirstOpaqueElementForFocus
{
  BOOL v2 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  if (__68__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocus__block_invoke()) {
    [a1 _accessibilityFirstOpaqueElementWithOptions:v2];
  }
  else {
  uint64_t v3 = [a1 _accessibilityFirstOpaqueElementForFocusWithOptions:v2];
  }

  return v3;
}

- (id)_accessibilityFirstOpaqueElementForFocusWithOptions:()AXPrivCategory
{
  id v4 = a3;
  if (__80__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocusWithOptions___block_invoke()) {
    [a1 _accessibilityFirstOpaqueElementForFocus];
  }
  else {
  uint64_t v5 = [a1 _accessibilityFirstOpaqueElementWithOptions:v4];
  }

  return v5;
}

- (id)_accessibilityLastOpaqueElement
{
  BOOL v2 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  if (__59__NSObject_AXPrivCategory___accessibilityLastOpaqueElement__block_invoke())
  {
    uint64_t v3 = [a1 _accessibilitySortedElementsWithinWithOptions:v2];
    id v4 = [v3 lastObject];
  }
  else
  {
    id v4 = [a1 _accessibilityLastOpaqueElementWithOptions:v2];
  }

  return v4;
}

- (id)_accessibilityLastOpaqueElementWithOptions:()AXPrivCategory
{
  id v4 = a3;
  if (__71__NSObject_AXPrivCategory___accessibilityLastOpaqueElementWithOptions___block_invoke())
  {
    uint64_t v5 = [a1 _accessibilityLastOpaqueElement];
  }
  else
  {
    uint64_t v6 = [a1 _accessibilitySortedElementsWithinWithOptions:v4];
    uint64_t v5 = [v6 lastObject];
  }

  return v5;
}

- (uint64_t)_accessibilityOpaqueHeaderElementInDirection:()AXPrivCategory childElement:
{
  return 0;
}

- (uint64_t)_accessibilityMoveFocusToNextOpaqueElementForTechnology:()AXPrivCategory direction:searchType:range:
{
  return objc_msgSend(a1, "_accessibilityMoveFocusToNextOpaqueElementForTechnology:direction:searchType:range:shouldScrollToVisible:", a3, a4, a5, a6, a7, 1);
}

- (uint64_t)_accessibilityMoveFocusToNextOpaqueElementForTechnology:()AXPrivCategory direction:searchType:range:shouldScrollToVisible:
{
  LOBYTE(v2) = 0;
  return objc_msgSend(a1, "_accessibilityMoveFocusToNextOpaqueElementForTechnology:direction:searchType:range:shouldScrollToVisible:honorsGroups:", v2);
}

- (id)_accessibilityNextOpaqueElementsForTechnology:()AXPrivCategory startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (!v12)
  {
    id v12 = [a1 _accessibilityCurrentlyFocusedElementForTechnology:v11];
    [v12 _accessibilityHandleATFocused:1 assistiveTech:v11];
  }
  char v30 = v11;
  uint64_t v13 = AXLogOpaqueElements();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(AXPrivCategory) _accessibilityNextOpaqueElementsForTechnology:startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:]((uint64_t)a1, v12);
  }

  id v14 = a1;
  id v15 = v14;
  if (v12)
  {
    id v15 = [v12 _accessibilityFindAncestor:&__block_literal_global_1355 startWithSelf:0];

    if (!v15)
    {
      id v15 = v14;
      id v16 = AXLogOpaqueElements();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[NSObject(AXPrivCategory) _accessibilityNextOpaqueElementsForTechnology:startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:]();
      }
    }
  }
  id v17 = v12;
  uint64_t v18 = v17;
  if (v12) {
    uint64_t v19 = a9;
  }
  else {
    uint64_t v19 = 0;
  }
  double v29 = v17;
  while (1)
  {
    id v35 = v15;
    LOWORD(v28) = a9;
    int v20 = [v15 _accessibilitySearchSubtreesAfterChildElement:v18 direction:a5 searchType:a6 allowOutOfBoundsChild:v19 range:a7 shouldScrollToVisible:a8 honorGroups:v28 updatedContainer:&v35];
    id v21 = v35;

    if (v21 == v14 || v21 == 0) {
      break;
    }
    id v23 = v21;

    id v15 = [v23 _accessibilityFindAncestor:&__block_literal_global_1358 startWithSelf:0];

    uint64_t v24 = AXLogOpaqueElements();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v37 = v15;
      _os_log_debug_impl(&dword_19F2DB000, v24, OS_LOG_TYPE_DEBUG, "\tUP:  %{public}@", buf, 0xCu);
    }

    uint64_t v18 = v23;
    if (v20) {
      goto LABEL_23;
    }
  }
  id v23 = v18;
  id v15 = v21;
LABEL_23:
  double v25 = AXLogOpaqueElements();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(AXPrivCategory) _accessibilityNextOpaqueElementsForTechnology:startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:](v20);
  }

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((_BYTE)a9) {
        [v20 _accessibilityScrollToVisible];
      }
    }
  }
  id v26 = v20;

  return v26;
}

- (id)_accessibilityMoveFocusToNextOpaqueElementForTechnology:()AXPrivCategory direction:searchType:range:shouldScrollToVisible:honorsGroups:
{
  id v15 = a3;
  BYTE1(v18) = a9;
  LOBYTE(v18) = a8;
  id v16 = [a1 _accessibilityNextOpaqueElementsForTechnology:v15 startElement:0 direction:a4 searchType:a5 range:a6 shouldScrollToVisible:a7 honorsGroups:v18];
  [v16 _accessibilityHandleATFocused:1 assistiveTech:v15];

  return v16;
}

- (void)_accessibilitySetOpaqueElementScrollsContentIntoView:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 accessibilitySetUserDefinedOpaqueElementScrollsContentIntoView:v2];
}

- (uint64_t)_accessibilityOpaqueElementScrollsContentIntoView
{
  uint64_t v1 = [a1 accessibilityUserDefinedOpaqueElementScrollsContentIntoView];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_accessibilityScrollOpaqueElementIntoView:()AXPrivCategory previousScroller:
{
  id v6 = a4;
  if (([v6 safeBoolForKey:@"_forwardsToParentScroller"] & 1) == 0)
  {
    objc_opt_class();
    uint64_t v7 = __UIAccessibilityCastAsClass();
    if (v6)
    {
      [v6 bounds];
      objc_msgSend(v7, "convertRect:fromView:", v6);
      double v9 = v8;
      double v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      [v7 contentOffset];
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      [v7 contentSize];
      v27.size.CGFloat width = v20;
      v27.size.CGFloat height = v21;
      v27.origin.CGFloat x = v17;
      v27.origin.CGFloat y = v19;
      v28.origin.CGFloat x = v9;
      v28.origin.CGFloat y = v11;
      v28.size.CGFloat width = v13;
      v28.size.CGFloat height = v15;
      if (CGRectContainsRect(v27, v28))
      {
LABEL_4:
        [v7 _accessibilityOpaqueElementScrollCleanup];
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      [a1 _accessibilityOffsetForOpaqueElementDirection:a3];
      double v9 = v22;
      double v11 = v23;
      [v7 contentOffset];
      if (v25 == v9 && v24 == v11) {
        goto LABEL_4;
      }
    }
    objc_msgSend(v7, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, v9, v11);
    [v7 _accessibilityOpaqueElementScrollCleanup];
    [v7 layoutIfNeeded];
    goto LABEL_10;
  }
LABEL_11:
}

- (double)_accessibilityOffsetForOpaqueElementDirection:()AXPrivCategory
{
  objc_opt_class();
  uint64_t v5 = __UIAccessibilityCastAsClass();
  [v5 adjustedContentInset];
  if (a3 == 1)
  {
    if ([a1 _accessibilityApplicationIsRTL]) {
      [a1 _accessibilityRightOpaqueScrollViewContentOffsetLimit];
    }
    else {
      [a1 _accessibilityLeftOpaqueScrollViewContentOffsetLimit];
    }
    double v8 = v6;
  }
  else
  {
    [v5 contentSize];
    [v5 bounds];
    if ([a1 _accessibilityApplicationIsRTL]) {
      [a1 _accessibilityLeftOpaqueScrollViewContentOffsetLimit];
    }
    else {
      [a1 _accessibilityRightOpaqueScrollViewContentOffsetLimit];
    }
    double v8 = v7;
  }

  return v8;
}

- (double)_accessibilityRightOpaqueScrollViewContentOffsetLimit
{
  objc_opt_class();
  uint64_t v2 = __UIAccessibilityCastAsClass();
  [v2 adjustedContentInset];
  double v4 = v3;
  double v6 = v5;
  [v2 contentSize];
  double v8 = v7;
  [v2 bounds];
  double v10 = v6 + v8 - v9;
  int v11 = [a1 _accessibilityApplicationIsRTL];
  double v12 = -v4;
  if (v10 >= -v4) {
    double v12 = v10;
  }
  if (v11) {
    double v13 = v10;
  }
  else {
    double v13 = v12;
  }

  return v13;
}

- (double)_accessibilityLeftOpaqueScrollViewContentOffsetLimit
{
  objc_opt_class();
  uint64_t v2 = __UIAccessibilityCastAsClass();
  [v2 adjustedContentInset];
  double v4 = v3;
  double v6 = -v5;
  if ([a1 _accessibilityApplicationIsRTL])
  {
    [v2 contentSize];
    double v8 = v7;
    [v2 bounds];
    if (v4 + v8 - v9 <= v6) {
      double v6 = v4 + v8 - v9;
    }
  }

  return v6;
}

- (id)_accessibilityFindElementInDirection:()AXPrivCategory searchType:allowOutOfBoundsChild:
{
  double v9 = [a1 _accessibilityTouchContainer];
  double v10 = [a1 _accessibilityFindElementInDirection:a3 searchType:a4 allowOutOfBoundsChild:a5 startingTouchContainer:v9 honorGroups:0];

  return v10;
}

- (id)_accessibilityFindElementInDirection:()AXPrivCategory searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:
{
  v64[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  int v11 = AXLogOpaqueElements();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(AXPrivCategory) _accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:]();
  }

  if (![a1 isAccessibilityElement])
  {
    if (a7 && [a1 _accessibilityIsGroupedParent])
    {
      id v16 = a1;
LABEL_75:
      id v31 = v16;
      goto LABEL_82;
    }
    int v51 = [a1 _accessibilityHasOrderedChildren];
    if (v51)
    {
      uint64_t v17 = [a1 accessibilityElementCount];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
        CGFloat v19 = (void *)v18;
        if (a7)
        {
          CGFloat v20 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups];

          CGFloat v21 = [v20 leafNodePredicate];
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_3;
          v60[3] = &unk_1E59B9240;
          v60[4] = a1;
          id v22 = v21;
          id v61 = v22;
          [v20 setLeafNodePredicate:v60];
          uint64_t v23 = [a1 _accessibilityGroupedParent];
          double v24 = (void *)v23;
          if (v23)
          {
            v64[0] = v23;
            [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
            uint64_t v25 = a4;
            CGRect v27 = v26 = v10;
            [v20 setAllowedElementsForTraversal:v27];

            id v10 = v26;
            a4 = v25;
          }
        }
        else
        {
          CGFloat v20 = (void *)v18;
        }
        char v30 = [a1 _accessibilitySortedElementsWithinWithOptions:v20];
        uint64_t v17 = [v30 count];

LABEL_28:
        id v31 = 0;
        if (a3 == 1) {
          uint64_t v32 = 0;
        }
        else {
          uint64_t v32 = v17 - 1;
        }
        BOOL v33 = v32 < v17;
        if (a3 != 1) {
          BOOL v33 = v32 >= 0;
        }
        if (v33)
        {
          if (a3 == 1) {
            uint64_t v34 = 1;
          }
          else {
            uint64_t v34 = -1;
          }
          id v48 = v10;
          uint64_t v49 = v34;
          uint64_t v50 = v30;
          while (1)
          {
            if ([a1 _accessibilityHasOrderedChildren]) {
              [a1 accessibilityElementAtIndex:v32];
            }
            else {
            id v35 = [v30 objectAtIndex:v32];
            }
            if (v35 != a1
              && (!UIAccessibilityIsWidgetExtension()
               || ([v35 _accessibilityIsFrameOutOfBounds] & 1) == 0))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v31 = v35;
                if (v31) {
                  goto LABEL_65;
                }
              }
              else
              {
                aBlock[0] = MEMORY[0x1E4F143A8];
                aBlock[1] = 3221225472;
                aBlock[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_4;
                aBlock[3] = &unk_1E59B9378;
                uint64_t v56 = a3;
                uint64_t v57 = a4;
                uint64_t v36 = a4;
                char v58 = a5;
                id v37 = v10;
                id v55 = v37;
                char v59 = a7;
                uint64_t v38 = (void (**)(void *, void *))_Block_copy(aBlock);
                if (!v51) {
                  goto LABEL_55;
                }
                if (a3 == 2) {
                  [v35 _accessibilitySupplementaryFooterViews];
                }
                else {
                uint64_t v39 = [v35 _accessibilitySupplementaryHeaderViews];
                }
                v38[2](v38, v39);
                id v31 = (id)objc_claimAutoreleasedReturnValue();

                id v10 = v48;
                if (!v31)
                {
LABEL_55:
                  id v31 = [v35 _accessibilityFindElementInDirection:a3 searchType:v36 allowOutOfBoundsChild:a5 startingTouchContainer:v37 honorGroups:a7];
                  int v40 = v31 ? 0 : v51;
                  if (v40 == 1)
                  {
                    if (a3 == 2) {
                      [v35 _accessibilitySupplementaryHeaderViews];
                    }
                    else {
                    double v41 = [v35 _accessibilitySupplementaryFooterViews];
                    }
                    v38[2](v38, v41);
                    id v31 = (id)objc_claimAutoreleasedReturnValue();
                  }
                }

                a4 = v36;
                char v30 = v50;
                uint64_t v34 = v49;
                if (v31)
                {
LABEL_65:

                  goto LABEL_81;
                }
              }
            }

            v32 += v34;
            BOOL v42 = v32 < v17;
            if (a3 != 1) {
              BOOL v42 = v32 >= 0;
            }
            if (!v42)
            {
              id v31 = 0;
              goto LABEL_81;
            }
          }
        }
        goto LABEL_81;
      }
      uint64_t v17 = 0;
    }
    char v30 = 0;
    goto LABEL_28;
  }
  uint64_t v12 = [a1 accessibilityTraits];
  if ((UIAccessibilityTraitSpacer & ~v12) == 0) {
    goto LABEL_71;
  }
  id v13 = a1;
  double v14 = v13;
  if (a4 <= 10)
  {
    if (a4 == 1)
    {
      uint64_t v28 = [v13 accessibilityTraits];
      double v29 = (void *)MEMORY[0x1E4F48BF8];
    }
    else
    {
      if (a4 != 10)
      {
LABEL_72:

        goto LABEL_73;
      }
      uint64_t v28 = [v13 accessibilityTraits];
      double v29 = (void *)MEMORY[0x1E4F48C00];
    }
    goto LABEL_70;
  }
  if (a4 == 11)
  {
    uint64_t v28 = [v13 accessibilityTraits];
    double v29 = (void *)MEMORY[0x1E4F48C40];
LABEL_70:
    uint64_t v45 = *v29 & ~v28;

    if (v45) {
      goto LABEL_71;
    }
    goto LABEL_73;
  }
  if (a4 != 35)
  {
    if (a4 == 36)
    {
      int v15 = [v13 _accessibilityIsSpeakThisElement];

      if (v15) {
        goto LABEL_73;
      }
LABEL_71:
      id v31 = 0;
      goto LABEL_82;
    }
    goto LABEL_72;
  }
  id v43 = v10;
  id v44 = [v14 _accessibilityTouchContainer];

  if (v44 == v43) {
    goto LABEL_71;
  }
LABEL_73:
  if (a5)
  {
    id v16 = v14;
    goto LABEL_75;
  }
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke;
  v63[3] = &unk_1E59B8EB8;
  v63[4] = v14;
  char v30 = (uint64_t (**)(void))_Block_copy(v63);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_2;
  v62[3] = &unk_1E59B8EB8;
  v62[4] = v14;
  double v46 = (uint64_t (**)(void))_Block_copy(v62);
  if ((v46[2]() & 1) != 0 || (v30[2](v30) & 1) == 0) {
    id v31 = v14;
  }
  else {
    id v31 = 0;
  }

LABEL_81:
LABEL_82:

  return v31;
}

- (void)_accessibilityOpaqueElementScrollToDirection:()AXPrivCategory
{
  objc_opt_class();
  id v5 = a1;
  if (v5)
  {
    double v6 = v5;
    id v9 = 0;
    do
    {
      if (objc_opt_isKindOfClass())
      {
        if ([v6 _accessibilityOpaqueElementScrollsContentIntoView]
          && [v6 isScrollEnabled])
        {
          [v6 _accessibilityScrollOpaqueElementIntoView:a3 previousScroller:v9];
        }
        id v7 = v6;

        id v9 = v7;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 superview];
      }
      else {
      uint64_t v8 = [v6 accessibilityContainer];
      }

      double v6 = (void *)v8;
    }
    while (v8);
  }
}

- (id)_accessibilitySortedElementsWithin
{
  if (__62__NSObject_AXPrivCategory___accessibilitySortedElementsWithin__block_invoke())
  {
    uint64_t v2 = 0;
  }
  else
  {
    double v3 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
    uint64_t v2 = [a1 _accessibilitySortedElementsWithinWithOptions:v3];
  }

  return v2;
}

- (id)_accessibilitySortedElementsWithinWithOptions:()AXPrivCategory
{
  if (__74__NSObject_AXPrivCategory___accessibilitySortedElementsWithinWithOptions___block_invoke())
  {
    uint64_t v2 = [a1 _accessibilitySortedElementsWithin];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)_accessibilityElementServesAsHeadingLandmark
{
  return 0;
}

- (id)_accessibilityFocusAbsoluteFirstLastOpaqueElement:()AXPrivCategory technology:honorsGroups:shouldAlwaysScroll:
{
  if (([a1 isAccessibilityOpaqueElementProvider] & 1) == 0) {
    _AXAssert();
  }
  if (a3) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = 2;
  }
  BYTE1(v11) = a5;
  LOBYTE(v11) = 1;
  id v9 = [a1 _accessibilitySearchSubtreesAfterChildElement:0 direction:v8 searchType:0 allowOutOfBoundsChild:0 range:0x7FFFFFFFLL shouldScrollToVisible:0 honorGroups:v11 updatedContainer:0];
  [v9 _accessibilityScrollToVisible];
  [v9 _accessibilityHandleATFocused:1 assistiveTech:*MEMORY[0x1E4F43460]];

  return v9;
}

- (id)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:
{
  uint64_t v43 = a11;
  v61[1] = *MEMORY[0x1E4F143B8];
  int v15 = a3;
  uint64_t v16 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions];
  uint64_t v17 = (void *)v16;
  if (a10)
  {
    uint64_t v18 = +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups];

    CGFloat v19 = [v18 leafNodePredicate];
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke;
    v59[3] = &unk_1E59B9240;
    v59[4] = a1;
    id v60 = v19;
    id v20 = v19;
    [v18 setLeafNodePredicate:v59];
  }
  else
  {
    uint64_t v18 = (void *)v16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a10)
    {
      CGFloat v21 = [a1 _axNavigationalGroupParentOfChild:v15];
    }
    else
    {
      CGFloat v21 = 0;
    }
    if (v21) {
      id v22 = v21;
    }
    else {
      id v22 = a1;
    }
    v61[0] = v22;
    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v61, 1, a11);
    [v18 setAllowedElementsForTraversal:v23];
  }
  else
  {
    if ([a1 _accessibilityHasOrderedChildren]) {
      goto LABEL_16;
    }
    CGFloat v21 = AXLogOpaqueElements();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:].cold.5();
    }
  }

LABEL_16:
  objc_msgSend(v18, "setDirection:", a4, v43);
  [v18 setAlternateViewChildrenHandler:&__block_literal_global_1375];
  if (v15 != a1)
  {
    if (a5 == 1)
    {
      double v24 = [a1 _accessibilityOpaqueHeaderElementInDirection:a4 childElement:v15];
      uint64_t v25 = AXLogOpaqueElements();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:].cold.4();
      }

      if (v24)
      {
        id v26 = [MEMORY[0x1E4F1CA98] null];
        char v27 = [v24 isEqual:v26];

        if (v27) {
          id v28 = 0;
        }
        else {
          id v28 = v24;
        }

        goto LABEL_60;
      }
    }
    double v29 = [v15 _accessibilityTouchContainer];
    if ((([a1 _accessibilityHasOrderedChildren] | a9 ^ 1) & 1) == 0)
    {
      if (v15) {
        [v15 _accessibilityScrollToVisibleForNextElementRetrieval:a4];
      }
      else {
        [a1 _accessibilityOpaqueElementScrollToDirection:a4];
      }
    }
    uint64_t v53 = 0;
    double v54 = &v53;
    uint64_t v55 = 0x3032000000;
    uint64_t v56 = __Block_byref_object_copy__2;
    uint64_t v57 = __Block_byref_object_dispose__2;
    id v58 = 0;
    if (v15)
    {
      uint64_t v31 = [v18 includeAncestorsOfSelfInSiblingMatch];
      if ((v31 & 1) == 0)
      {
        NSClassFromString(&cfstr_Uiremoteview.isa);
        [v18 setIncludeAncestorsOfSelfInSiblingMatch:objc_opt_isKindOfClass() & 1];
      }
      id v52 = 0;
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke_1377;
      v45[3] = &unk_1E59B93C0;
      double v47 = &v53;
      uint64_t v48 = a4;
      uint64_t v49 = a5;
      char v50 = a6;
      id v46 = v29;
      unsigned __int8 v51 = a10;
      BOOL v32 = [v15 _accessibilityEnumerateSiblingsWithParent:&v52 options:v18 usingBlock:v45];
      BOOL v33 = v52;
      [v18 setIncludeAncestorsOfSelfInSiblingMatch:v31];
      if (!v32)
      {
        uint64_t v34 = AXLogOpaqueElements();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:]();
        }
      }
      id v35 = v46;
      goto LABEL_40;
    }
    if (![a1 isAccessibilityOpaqueElementProvider])
    {
LABEL_49:
      if (v54[5])
      {
        BOOL v33 = 0;
        goto LABEL_51;
      }
      uint64_t v42 = [a1 _accessibilityFindElementInDirection:a4 searchType:a5 allowOutOfBoundsChild:a6 startingTouchContainer:v29 honorGroups:a10];
      BOOL v33 = 0;
      id v35 = (void *)v54[5];
      v54[5] = v42;
LABEL_40:

LABEL_51:
      if (v44)
      {
        if (v33)
        {
          if (v33 != a1)
          {
            int v40 = AXLogOpaqueElements();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
              -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:]();
            }

            a1 = v33;
          }
        }
        else
        {
          a1 = a1;
        }
        BOOL v33 = a1;
        void *v44 = v33;
      }
      id v28 = (id)v54[5];

      _Block_object_dispose(&v53, 8);
      goto LABEL_60;
    }
    if (a4 == 2)
    {
      uint64_t v36 = [a1 _accessibilityLastOpaqueElementWithOptions:v18];
    }
    else
    {
      if (a4 != 1)
      {
        id v37 = 0;
        goto LABEL_48;
      }
      uint64_t v36 = [a1 _accessibilityFirstOpaqueElementWithOptions:v18];
    }
    id v37 = (void *)v36;
LABEL_48:
    uint64_t v38 = [v37 _accessibilityFindElementInDirection:a4 searchType:a5 allowOutOfBoundsChild:a6 startingTouchContainer:v29 honorGroups:a10];
    uint64_t v39 = (void *)v54[5];
    v54[5] = v38;

    goto LABEL_49;
  }
  char v30 = AXLogOpaqueElements();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:]();
  }

  id v28 = [a1 _accessibilityFirstOpaqueElementWithOptions:v18];
LABEL_60:

  return v28;
}

- (uint64_t)_accessibilityVisibleOpaqueElements
{
  return [a1 _accessibilityVisibleOpaqueElementsHonoringGroups:0 sorted:0];
}

- (id)_accessibilityVisibleOpaqueElementsHonoringGroups:()AXPrivCategory sorted:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (([a1 isAccessibilityOpaqueElementProvider] & 1) == 0) {
    _AXAssert();
  }
  id v7 = +[UIAccessibilityElementTraversalOptions options];
  uint64_t v8 = v7;
  if (a3)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __85__NSObject_AXPrivCategory___accessibilityVisibleOpaqueElementsHonoringGroups_sorted___block_invoke;
    v21[3] = &unk_1E59B8A80;
    void v21[4] = a1;
    [v7 setLeafNodePredicate:v21];
  }
  [v8 setShouldOnlyIncludeElementsWithVisibleFrame:1];
  [v8 setSorted:a4];
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = objc_msgSend(a1, "_accessibilitySortedElementsWithinWithOptions:", v8, 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) _accessibilityLeafDescendantsWithOptions:v8];
        [v9 addObjectsFromArray:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v12);
  }

  return v9;
}

- (id)_accessibilityDescendantOfType:()AXPrivCategory
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__NSObject_AXPrivCategory___accessibilityDescendantOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  double v3 = [a1 _accessibilityFindDescendant:v5];

  return v3;
}

- (BOOL)_accessibilityHasDescendantOfType:()AXPrivCategory
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__NSObject_AXPrivCategory___accessibilityHasDescendantOfType___block_invoke;
  v6[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v6[4] = a3;
  double v3 = [a1 _accessibilityFindDescendant:v6];
  BOOL v4 = v3 != 0;

  return v4;
}

- (uint64_t)_accessibilityUnignoredDescendant
{
  return [a1 _accessibilityFindDescendant:&__block_literal_global_1380];
}

- (uint64_t)_accessibilityIsSwiftUIHostingView
{
  return 0;
}

- (uint64_t)accessibilityCustomAttribute:()AXPrivCategory
{
  return 0;
}

- (id)accessibilityViewWithIdentifier:()AXPrivCategory
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__NSObject_AXPrivCategory__accessibilityViewWithIdentifier___block_invoke;
  v8[3] = &unk_1E59B8A80;
  id v9 = v4;
  id v5 = v4;
  double v6 = [a1 _accessibilityFindDescendant:v8];

  return v6;
}

- (BOOL)_accessibilityIsViewDescendantOfElement:()AXPrivCategory
{
  id v4 = a3;
  id v5 = a1;
  id v6 = v5;
  for (BOOL i = v5 != 0; v6 != v4 && v6; BOOL i = v6 != 0)
  {
    uint64_t v8 = v6;
    id v6 = [v6 superview];
  }
  return i;
}

- (BOOL)_accessibilityIsDescendantOfElement:()AXPrivCategory
{
  id v6 = a3;
  id v7 = a1;
  NSClassFromString(&cfstr_Uiaccessibilit_6.isa);
  NSClassFromString(&cfstr_Uitableviewcel.isa);
  NSClassFromString(&cfstr_Uicollectionvi.isa);
  BOOL v8 = v7 != 0;
  if (v7 == v6 || !v7) {
    goto LABEL_35;
  }
  while (1)
  {
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v6 safeValueForKey:@"view"];

      if (v9 == v7) {
        break;
      }
    }
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v3 = [v6 safeValueForKey:@"tableViewCell"];
      if (v3 == v7) {
        goto LABEL_33;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
    {
      id v11 = [v7 safeValueForKey:@"tableViewCell"];

      if (isKindOfClass) {
      if (v11 == v6)
      }
        break;
    }
    else if (isKindOfClass)
    {
    }
    char v12 = objc_opt_isKindOfClass();
    if (v12)
    {
      id v4 = [v6 safeValueForKey:@"cell"];
      if (v4 == v7)
      {
LABEL_33:

        break;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass())
    {
      id v13 = [v7 safeValueForKey:@"cell"];

      if (v12) {
      if (v13 == v6)
      }
        break;
    }
    else if (v12)
    {
    }
    double v14 = [v7 accessibilityContainer];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        uint64_t v16 = [v7 superview];
        goto LABEL_30;
      }
    }
    else
    {
    }
    uint64_t v16 = [v7 accessibilityContainer];
LABEL_30:
    id v17 = (id)v16;

    BOOL v8 = v17 != 0;
    if (v17 != v6)
    {
      id v7 = v17;
      if (v17) {
        continue;
      }
    }
    goto LABEL_36;
  }
  BOOL v8 = 1;
LABEL_35:
  id v17 = v7;
LABEL_36:

  return v8;
}

- (id)_accessibilityFindViewAncestor:()AXPrivCategory startWithSelf:
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!a4 ? ([a1 superview], id v7 = (id)objc_claimAutoreleasedReturnValue()) : (id v7 = a1),
        (BOOL v8 = v7) != 0))
  {
    while (1)
    {
      char v11 = 0;
      if (v6[2](v6, v8, &v11))
      {
        id v9 = v8;
        goto LABEL_13;
      }
      if (v11) {
        break;
      }
      id v9 = [v8 superview];

      BOOL v8 = v9;
      if (!v9) {
        goto LABEL_14;
      }
    }
    id v9 = 0;
LABEL_13:
  }
  else
  {
    id v9 = 0;
  }
LABEL_14:

  return v9;
}

- (uint64_t)_accessibilityAncestorIsAccessibilityElementsHidden
{
  return [a1 _accessibilityFindAncestor:&__block_literal_global_1396 startWithSelf:1];
}

- (void)accessibilityEnumerateAncestorsUsingBlock:()AXPrivCategory
{
  id v4 = a3;
  id v5 = a1;
  if (v5)
  {
    id v6 = v5;
    while (1)
    {
      char v8 = 0;
      v4[2](v4, v6, &v8);
      if (v8) {
        break;
      }
      uint64_t v7 = [v6 accessibilityContainer];

      id v6 = (void *)v7;
      if (!v7) {
        goto LABEL_7;
      }
    }
  }
LABEL_7:
}

- (id)_accessibilityFindDescendant:()AXPrivCategory
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__NSObject_AXPrivCategory___accessibilityFindDescendant___block_invoke;
  v5[3] = &unk_1E59B94B0;
  v5[4] = a1;
  id v3 = -[NSObject _accessibilityFindFirstAXDescendantPassingTest:byYieldingElements:](a1, a3, v5);

  return v3;
}

- (id)_accessibilityFindSubviewDescendant:()AXPrivCategory
{
  return -[NSObject _accessibilityFindFirstAXDescendantPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_1401);
}

- (id)_accessibilityFindSubviewDescendantsPassingTest:()AXPrivCategory
{
  id v4 = -[NSObject _accessibilityFindAXDescendantsPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_1403);
  [a1 _accessibilitySortElementsUsingGeometry:v4];

  return v4;
}

- (id)_accessibilityFindViewControllerDescendant:()AXPrivCategory
{
  return -[NSObject _accessibilityFindFirstAXDescendantPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_1405);
}

- (id)_accessibilityFindViewControllerDescendantOfType:()AXPrivCategory
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NSObject_AXPrivCategory___accessibilityFindViewControllerDescendantOfType___block_invoke;
  v5[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v5[4] = a3;
  id v3 = [a1 _accessibilityFindViewControllerDescendant:v5];

  return v3;
}

- (id)_accessibilityFindUnsortedSubviewDescendantsPassingTest:()AXPrivCategory
{
  return -[NSObject _accessibilityFindAXDescendantsPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_1407);
}

- (id)_accessibilityFindUnsortedDescendantsPassingTest:()AXPrivCategory
{
  return -[NSObject _accessibilityFindAXDescendantsPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_1409);
}

- (id)_accessibilityControlDescendantWithTarget:()AXPrivCategory
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__NSObject_AXPrivCategory___accessibilityControlDescendantWithTarget___block_invoke;
  v9[3] = &unk_1E59B94F8;
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v4;
  uint64_t v7 = [a1 _accessibilityFindSubviewDescendant:v9];

  return v7;
}

- (id)_accessibilityControlDescendantWithAction:()AXPrivCategory
{
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__NSObject_AXPrivCategory___accessibilityControlDescendantWithAction___block_invoke;
  v10[3] = &unk_1E59B94F8;
  id v11 = v6;
  uint64_t v12 = v5;
  id v7 = v6;
  char v8 = [a1 _accessibilityFindSubviewDescendant:v10];

  return v8;
}

- (void)_accessibilitySetAuditIssueDict:()AXPrivCategory
{
  id v5 = a3;
  id v4 = [a1 _accessibilityValueForKey:@"auditIssueSetAssociatedObjectKey"];
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F1CA80] set];
    [a1 _accessibilitySetRetainedValue:v4 forKey:@"auditIssueSetAssociatedObjectKey"];
  }
  [v4 addObject:v5];
}

- (id)_accessibilityAuditIssuesWithOptions:()AXPrivCategory
{
  v0 = objc_opt_new();

  return v0;
}

- (uint64_t)_accessibilityVisibleElementsHonoringGroups:()AXPrivCategory
{
  return [a1 _accessibilityVisibleElementsHonoringGroups:a3 respectGroupedParents:1];
}

- (uint64_t)_accessibilityAuditVisibleElementsHonoringGroups:()AXPrivCategory
{
  return [a1 _accessibilityVisibleElementsHonoringGroups:a3 respectGroupedParents:0];
}

- (id)_accessibilityVisibleElementsHonoringGroups:()AXPrivCategory respectGroupedParents:
{
  id v7 = +[UIAccessibilityElementTraversalOptions options];
  char v8 = v7;
  if (a3)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    void v23[2] = __94__NSObject_AXPrivCategory___accessibilityVisibleElementsHonoringGroups_respectGroupedParents___block_invoke;
    v23[3] = &unk_1E59B9520;
    char v24 = a4;
    v23[4] = a1;
    [v7 setLeafNodePredicate:v23];
  }
  [v8 setShouldOnlyIncludeElementsWithVisibleFrame:1];
  id v9 = [a1 _accessibilityLeafDescendantsWithOptions:v8];
  id v10 = v9;
  if (a3)
  {
    id v11 = (id)objc_opt_new();
    long long v20 = v10;
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "axArrayWithPossiblyNilArrays:", 1, v10);
    while ([v12 count])
    {
      id v13 = objc_msgSend(v12, "ax_dequeueObject");
      [v11 axSafelyAddObject:v13];
      double v14 = +[UIAccessibilityElementTraversalOptions options];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      void v21[2] = __94__NSObject_AXPrivCategory___accessibilityVisibleElementsHonoringGroups_respectGroupedParents___block_invoke_2;
      v21[3] = &unk_1E59B8A80;
      id v15 = v13;
      id v22 = v15;
      [v14 setLeafNodePredicate:v21];
      [v8 setShouldOnlyIncludeElementsWithVisibleFrame:1];
      uint64_t v16 = [v15 _accessibilityLeafDescendantsWithOptions:v14];
      id v17 = [v16 firstObject];
      char v18 = [v17 isEqual:v15];

      if ((v18 & 1) == 0) {
        [v12 axSafelyAddObjectsFromArray:v16];
      }
    }
    id v10 = v20;
  }
  else
  {
    id v11 = v9;
  }

  return v11;
}

- (id)_accessibilityRemoteParent
{
  id v1 = a1;
  if (v1)
  {
    while (![v1 _accessibilityIsRemoteElement]
         || ([v1 onClientSide] & 1) != 0)
    {
      uint64_t v2 = [v1 accessibilityContainer];

      id v1 = (id)v2;
      if (!v2) {
        goto LABEL_7;
      }
    }
    id v1 = v1;
  }
LABEL_7:

  return v1;
}

- (uint64_t)_accessibilityOrderedChildrenContainer
{
  return [a1 _accessibilityOrderedChildrenContainerWithinElements:0];
}

- (id)_accessibilityOrderedChildrenContainerWithinElements:()AXPrivCategory
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 accessibilityContainer];
  if (v5)
  {
    while (([v5 _accessibilityHasOrderedChildren] & 1) == 0)
    {
      uint64_t v6 = [v5 accessibilityContainer];

      id v5 = (void *)v6;
      if (!v6) {
        goto LABEL_19;
      }
    }
    if (v4)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v7 = v4;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = [v5 _accessibilityParentView];
              char v14 = [v13 _accessibilityIsViewDescendantOfElement:v12];

              if (v14) {
                goto LABEL_18;
              }
            }
            else if (objc_msgSend(v5, "_accessibilityIsDescendantOfElement:", v12, (void)v19))
            {
              goto LABEL_18;
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v9);
      }

      id v7 = v5;
      id v5 = 0;
LABEL_18:
    }
  }
LABEL_19:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [v5 safeValueForKey:@"_accessibilityMockParent"];
    uint64_t v16 = v15;
    if (v15)
    {
      id v17 = v15;

      id v5 = v17;
    }
  }

  return v5;
}

- (id)_accessibilityScannerElementsGrouped:()AXPrivCategory shouldIncludeNonScannerElements:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = +[UIAccessibilityElementTraversalOptions defaultSwitchControlOptions];
  [v7 setShouldReturnScannerGroups:a3];
  if (a4) {
    [v7 setLeafNodePredicate:&__block_literal_global_1415];
  }
  uint64_t v8 = [a1 _accessibilityLeafDescendantsWithOptions:v7];
  uint64_t v9 = AXLogElementTraversal();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109634;
    v11[1] = a3;
    __int16 v12 = 1024;
    int v13 = a4;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_debug_impl(&dword_19F2DB000, v9, OS_LOG_TYPE_DEBUG, "*** Scanner elements (grouped: %i, include non scanner: %i) were %{public}@", (uint8_t *)v11, 0x18u);
  }

  return v8;
}

- (uint64_t)_accessibilityIsRootElementForElementTraversal
{
  return 0;
}

- (void)setAccessibilitySize:()AXPrivCategory
{
  objc_msgSend(MEMORY[0x1E4F29238], "axValueWithCGSize:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"_AX_Size"];
}

- (void)_accessibilitySetAllowedGeometryOverlap:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithDouble:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"UIAccessibilityStorageKeyAllowedGeometryOverlap"];
}

- (double)_accessibilityAllowedGeometryOverlap
{
  double v2 = 13.0;
  if ((AXDeviceIsPad() & 1) == 0)
  {
    if (AXDeviceIsWatch()) {
      double v2 = 4.0;
    }
    else {
      double v2 = 8.0;
    }
  }
  id v3 = [a1 _accessibilityValueForKey:@"UIAccessibilityStorageKeyAllowedGeometryOverlap"];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    double v2 = v5;
  }

  return v2;
}

- (double)_accessibilityAllowedGeometryOverlapX
{
  return 0.0;
}

- (uint64_t)_accessibilitySetOverridesInvisibility:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"UIAccessibilityStorageKeyOverridesInvisibility"];
}

- (uint64_t)_accessibilityOverridesInvisibility
{
  double v2 = [a1 _accessibilityValueForKey:@"UIAccessibilityStorageKeyOverridesInvisibility"];

  if (!v2) {
    return 0;
  }

  return [a1 _accessibilityBoolValueForKey:@"UIAccessibilityStorageKeyOverridesInvisibility"];
}

- (uint64_t)_accessibilitySortPriorityWithReturningElement:()AXPrivCategory
{
  double v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p-sortPriorityWithView", a1);
  uint64_t v6 = [(id)AXServerCache objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = [(id)AXServerCache objectForKeyedSubscript:v5];
    *a3 = [v7 objectForKeyedSubscript:@"view"];

    id v8 = [(id)AXServerCache objectForKeyedSubscript:v5];
    uint64_t v9 = [v8 objectForKeyedSubscript:@"priority"];
    uint64_t v10 = [v9 integerValue];
  }
  else
  {
    uint64_t v10 = UIAccessibilityDefaultSortPriority;
    id v8 = a1;
    if (v8)
    {
      while (1)
      {
        uint64_t v10 = [v8 _accessibilitySortPriority];
        if (v10 != UIAccessibilityDefaultSortPriority) {
          break;
        }
        uint64_t v11 = [v8 accessibilityContainer];

        id v8 = (id)v11;
        if (!v11) {
          goto LABEL_8;
        }
      }
      id v8 = v8;
      *a3 = v8;
    }
LABEL_8:
    __int16 v12 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = v12;
    if (*a3) {
      [v12 setObject:*a3 forKeyedSubscript:@"view"];
    }
    int v13 = [NSNumber numberWithInteger:v10];
    [v9 setObject:v13 forKeyedSubscript:@"priority"];

    [(id)AXServerCache setObject:v9 forKeyedSubscript:v5];
  }

  return v10;
}

- (uint64_t)_accessibilityCompareElement:()AXPrivCategory toElement:
{
  return 0;
}

- (double)_handleRotatingFrame:()AXPrivCategory fromOrientation:toOrientation:
{
  if (a4)
  {
    AXDeviceGetMainScreenBounds();
    _UIConvertRectFromOrientationToOrientation();
    return v5;
  }
  return a1;
}

- (uint64_t)_accessibilityUsesChildrenFramesForSorting
{
  return 0;
}

- (double)_accessibilityChildrenUnionContentFrame
{
  uint64_t v5 = 0;
  uint64_t v6 = (double *)&v5;
  uint64_t v7 = 0x4010000000;
  id v8 = "";
  long long v1 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v9 = *MEMORY[0x1E4F1DB28];
  long long v10 = v1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __67__NSObject_AXPrivCategory___accessibilityChildrenUnionContentFrame__block_invoke;
  v4[3] = &unk_1E59B9328;
  v4[4] = &v5;
  [a1 accessibilityEnumerateContainerElementsUsingBlock:v4];
  double v2 = v6[4];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)_accessibilityFrameForSorting
{
  uint64_t v2 = [a1 _accessibilityGetBlockForAttribute:23];
  id v3 = (void *)v2;
  if (v2)
  {
    double v4 = (*(double (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityFrameForSorting", a1);
    uint64_t v6 = [(id)AXServerCache objectForKeyedSubscript:v5];

    if (v6)
    {
      uint64_t v7 = [(id)AXServerCache objectForKeyedSubscript:v5];
      [v7 rectValue];
      double v4 = v8;
    }
    else
    {
      if ([a1 _accessibilityHasOrderedChildren]
        && [a1 _accessibilityUsesChildrenFramesForSorting])
      {
        [a1 _accessibilityChildrenUnionContentFrame];
      }
      else
      {
        [a1 _accessibilityContentFrame];
      }
      double v4 = v9;
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
      [(id)AXServerCache setObject:v7 forKeyedSubscript:v5];
    }
  }
  return v4;
}

- (uint64_t)_accessibilityGeometrySortedElements:()AXPrivCategory
{
  return [a3 sortedArrayUsingSelector:sel_accessibilityCompareGeometry_];
}

- (uint64_t)_accessibilitySortElementsUsingGeometry:()AXPrivCategory
{
  return [a3 sortUsingSelector:sel_accessibilityCompareGeometry_];
}

- (uint64_t)_accessibilityOrientationForCompareGeometryForApplication:()AXPrivCategory
{
  id v4 = a3;
  if (AXProcessIsSpringBoard())
  {
    uint64_t v5 = [v4 activeInterfaceOrientation];
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v7 = [a1 _accessibilityWindow];
      uint64_t v6 = [v7 interfaceOrientation];

      goto LABEL_7;
    }
    uint64_t v5 = [v4 _accessibilityOrientationForCompareGeometry];
  }
  uint64_t v6 = v5;
LABEL_7:

  return v6;
}

- (uint64_t)accessibilityCompareGeometry:()AXPrivCategory
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x19F3CA890]();
  uint64_t v6 = -[NSObject _accessibilityCompareGeometry:](a1, v4);

  return v6;
}

- (uint64_t)_accessibilityVisibleFrame
{
  return [a1 _accessibilityVisibleFrame:1];
}

- (double)_accessibilityVisibleFrame:()AXPrivCategory
{
  uint64_t v23 = 0;
  uint64_t v24 = (CGRect *)&v23;
  uint64_t v25 = 0x4010000000;
  id v26 = "";
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v27 = *MEMORY[0x1E4F1DB28];
  long long v28 = v5;
  uint64_t v6 = [a1 accessibilityPath];
  uint64_t v7 = v6;
  if (v6) {
    BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v6 CGPath]);
  }
  else {
    [a1 _accessibilityContentFrame];
  }
  v24[1] = BoundingBox;
  double v8 = [a1 _accessibilityVisibleFrameClippingAncestor];
  double v9 = v8;
  if (v8)
  {
    [v8 accessibilityFrame];
    v31.origin.double x = v10;
    v31.origin.CGFloat y = v11;
    v31.size.CGFloat width = v12;
    v31.size.CGFloat height = v13;
    CGRect v30 = CGRectIntersection(v24[1], v31);
    v24[1] = v30;
  }
  if (a3)
  {
    __int16 v14 = (id *)MEMORY[0x1E4F43630];
    if ([(id)*MEMORY[0x1E4F43630] _accessibilitySoftwareKeyboardCoversElement:a1])
    {
      [*v14 _accessibilitySoftwareKeyboardAccessibilityFrame];
      AX_CGRectBySubtractingRect();
      p_double x = (void *)&v24->origin.x;
      v24[1].origin.double x = v16;
      p_x[5] = v17;
      p_x[6] = v18;
      p_x[7] = v19;
    }
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __55__NSObject_AXPrivCategory___accessibilityVisibleFrame___block_invoke;
  v22[3] = &unk_1E59B8FA8;
  v22[4] = &v23;
  [a1 _accessibilityIterateScrollParentsUsingBlock:v22 includeSelf:0];
  double x = v24[1].origin.x;

  _Block_object_dispose(&v23, 8);
  return x;
}

- (double)_accessibilityConvertSystemBoundedScreenRectToContextSpace:()AXPrivCategory
{
  id v3 = [a1 _accessibilityWindow];
  if (v3)
  {
    AXUIConvertRectFromScreenToContextSpace();
    a2 = v4;
  }

  return a2;
}

- (uint64_t)_accessibilityConvertSystemBoundedScreenPointToContextSpace:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", a3, a4, 0.0, 0.0);
}

- (id)_accessibilityConvertSystemBoundedPathToContextSpace:()AXPrivCategory
{
  if (a3)
  {
    [a3 CGPath];
    CGMutablePathRef Mutable = CGPathCreateMutable();
    uint64_t v7 = MEMORY[0x1E4F143A8];
    AX_CGPathEnumerateElementsUsingBlock();
    long long v5 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithCGPath:", Mutable, v7, 3221225472, __81__NSObject_AXPrivCategory___accessibilityConvertSystemBoundedPathToContextSpace___block_invoke, &unk_1E59B9550, a1, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }
  else
  {
    long long v5 = 0;
  }

  return v5;
}

- (double)_accessibilityDisplayRectForSceneReferenceRect:()AXPrivCategory
{
  CGRect v22 = CGRectStandardize(*(CGRect *)&a2);
  double x = v22.origin.x;
  double y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;
  objc_msgSend(a1, "_accessibilityDisplayPointForSceneReferencePoint:");
  double v11 = v10;
  double v13 = v12;
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v23);
  v24.origin.double x = x;
  v24.origin.double y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v24);
  objc_msgSend(a1, "_accessibilityDisplayPointForSceneReferencePoint:", MaxX, MaxY);
  if (v11 != x || v13 != y || v16 != MaxX || v17 != MaxY)
  {
    if (v11 >= v16) {
      return v16;
    }
    else {
      return v11;
    }
  }
  return x;
}

- (id)_accessibilityDisplayPathForScreenPath:()AXPrivCategory
{
  return UIAccessibilitySceneReferencePathForScreenPath(a3);
}

- (uint64_t)_accessibilityCirclePathBasedOnBoundsWidth
{
  return 0;
}

- (__n128)_accessibilityJailTransform
{
  long long v1 = (__n128 *)MEMORY[0x1E4F1DAB8];
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = v1[2];
  *(__n128 *)(a1 + 32) = result;
  return result;
}

- (double)_accessibilityVisibleContentInset
{
  return *MEMORY[0x1E4F437F8];
}

- (double)_accessibilityContentSize
{
  return *MEMORY[0x1E4F1DB30];
}

- (uint64_t)_accessibilityShouldUseFallbackForVisibleContentInset
{
  return 0;
}

- (uint64_t)_accessibilityOnlyComparesByXAxis
{
  return [a1 _accessibilityBoolValueForKey:@"_accessibilityOnlyComparesByXAxis"];
}

- (uint64_t)_accessibilitySetOnlyComparesByXAxis:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"_accessibilityOnlyComparesByXAxis"];
}

- (uint64_t)_accessibilityScrollParentForComparingByXAxis
{
  return 0;
}

- (double)_accessibilityCompareFrameForScrollParent:()AXPrivCategory frame:fromOrientation:toOrientation:
{
  id v10 = a4;
  if (v10)
  {
    if (objc_opt_respondsToSelector())
    {
      [v10 visibleBounds];
      double x = UIAccessibilityFrameForBounds(v10, v11, v12, v13, v14);
      double y = v16;
      double width = v18;
      double height = v20;
      [v10 _accessibilityContentFrame];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      v35.origin.double x = v23;
      v35.origin.double y = v25;
      v35.size.double width = v27;
      v35.size.double height = v29;
      if (!CGRectContainsRect(v32, v35))
      {
LABEL_7:
        objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", a5, a6, x, y, width, height);
        a2 = v30;
        goto LABEL_8;
      }
      v33.origin.double x = x;
      v33.origin.double y = y;
      v33.size.double width = width;
      v33.size.double height = height;
      v36.origin.double x = v23;
      v36.origin.double y = v25;
      v36.size.double width = v27;
      v36.size.double height = v29;
      CGRect v34 = CGRectIntersection(v33, v36);
    }
    else
    {
      [v10 accessibilityFrame];
    }
    double x = v34.origin.x;
    double y = v34.origin.y;
    double width = v34.size.width;
    double height = v34.size.height;
    goto LABEL_7;
  }
LABEL_8:

  return a2;
}

- (void)_accessibilitySetSortPriority:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"AXSortPriority"];
}

- (uint64_t)_accessibilitySortPriority
{
  uint64_t v1 = UIAccessibilityDefaultSortPriority;
  id v2 = [a1 _accessibilityValueForKey:@"AXSortPriority"];
  id v3 = v2;
  if (v2) {
    uint64_t v1 = [v2 integerValue];
  }

  return v1;
}

- (void)_accessibilitySetIsSortPriorityContainer:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetRetainedValue:v2 forKey:@"AXIsSortPriorityContainer"];
}

- (uint64_t)_accessibilityIsSortPriorityContainer
{
  uint64_t v1 = [a1 _accessibilityValueForKey:@"AXIsSortPriorityContainer"];
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_accessibilitySortPriorityContainer
{
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilitySortPriorityContainer", a1);
  id v9 = 0;
  PossiblyNilObjectForKedouble y = _AXServerCacheGetPossiblyNilObjectForKey(v2, &v9);
  id v4 = v9;
  if (!PossiblyNilObjectForKey)
  {
    id v5 = a1;

    id v4 = 0;
    if (v5)
    {
      do
      {
        if ([v5 _accessibilityIsSortPriorityContainer])
        {
          id v6 = v5;

          id v4 = v6;
        }
        uint64_t v7 = [v5 accessibilityContainer];

        id v5 = (id)v7;
      }
      while (v7);
    }
    _AXServerCacheInsertPossiblyNilObjectForKey(v2, v4);
  }

  return v4;
}

- (uint64_t)_accessibilityOverridesInvalidFrames
{
  return 0;
}

- (uint64_t)_accessibilityIsFrameOutOfBounds
{
  return [a1 _accessibilityIsFrameOutOfBoundsConsideringScrollParents:1];
}

- (uint64_t)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return 0;
}

- (double)_axScreenBoundsForBoundsCheck
{
  uint64_t v1 = [a1 _accessibilityWindow];
  [v1 frame];
  BOOL v4 = v3 == *MEMORY[0x1E4F1DAD8] && v2 == *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (!v4 && ([v1 isKeyWindow] & 1) == 0)
  {
    uint64_t v5 = [(id)*MEMORY[0x1E4F43630] keyWindow];

    uint64_t v1 = (void *)v5;
  }
  id v6 = [MEMORY[0x1E4F42738] sharedApplication];
  if ([v6 _accessibilityUseWindowBoundsForOutOfBoundsChecking])
  {
  }
  else
  {
    int v7 = [v1 _accessibilityUseWindowBoundsForOutOfBoundsChecking];

    if (!v7)
    {
      id v10 = [v1 screen];
      [v10 bounds];
      double v9 = v11;

      goto LABEL_12;
    }
  }
  [v1 bounds];
  double v9 = v8;
LABEL_12:

  return v9;
}

- (id)_axOutermostScrollParent
{
  if (UIAccessibilityIsWidgetExtension())
  {
    id v2 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    id v6 = &v5;
    uint64_t v7 = 0x3032000000;
    double v8 = __Block_byref_object_copy__2;
    double v9 = __Block_byref_object_dispose__2;
    id v10 = 0;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __52__NSObject_AXPrivCategory___axOutermostScrollParent__block_invoke;
    v4[3] = &unk_1E59B8FA8;
    v4[4] = &v5;
    [a1 _accessibilityIterateScrollParentsUsingBlock:v4];
    id v2 = (id)v6[5];
    _Block_object_dispose(&v5, 8);
  }

  return v2;
}

- (double)_axFrameForBoundsCheck:()AXPrivCategory
{
  [a1 accessibilityFrame];
  double x = v14.origin.x;
  if (CGRectIsEmpty(v14)) {
    return *MEMORY[0x1E4F1DB20];
  }
  id v6 = [a1 _accessibilityUIViewAccessibilityFrame];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 CGRectValue];
    double x = v8;
  }
  if (a3)
  {
    double v9 = [a1 _axOutermostScrollParent];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [v9 _accessibilityUIViewAccessibilityFrame];
        [v10 CGRectValue];
        double x = v11;
      }
      else
      {
        [v9 accessibilityFrame];
        double x = v12;
      }
    }
  }
  return x;
}

- (uint64_t)_accessibilityIsFrameOutOfBoundsConsideringScrollParents:()AXPrivCategory
{
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p-_accessibilityIsFrameOutOfBoundsConsideringScrollParents", a1);
  id v6 = [(id)AXServerCache objectForKeyedSubscript:v5];

  if (!v6)
  {
    if (![a1 _accessibilityOverridesInvalidFrames])
    {
      [a1 _axScreenBoundsForBoundsCheck];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [a1 _axFrameForBoundsCheck:a3];
      CGFloat x = v42.origin.x;
      CGFloat y = v42.origin.y;
      CGFloat width = v42.size.width;
      CGFloat height = v42.size.height;
      if (CGRectIsNull(v42)) {
        goto LABEL_7;
      }
      CGFloat v38 = v12;
      CGFloat v40 = v10;
      v43.origin.CGFloat x = v10;
      v43.origin.CGFloat y = v12;
      v43.size.CGFloat width = v14;
      v43.size.CGFloat height = v16;
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = height;
      CGRect v44 = CGRectIntersection(v43, v51);
      CGFloat v22 = v44.size.width;
      if (v44.size.width < 1.0 || (CGFloat v23 = v44.size.height, v44.size.height < 1.0))
      {
        objc_msgSend(a1, "_axOutermostScrollParent", v44.origin.x, v44.origin.y);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        if (!v7) {
          id v7 = a1;
        }
        CGFloat v29 = [v7 _accessibilityHeaderElement];

        if (v29)
        {
          double v30 = [v7 _accessibilityParentView];
          [v30 bounds];
          v52.origin.CGFloat x = UIAccessibilityFrameForBounds(v30, v31, v32, v33, v34);
          v52.origin.CGFloat y = v35;
          v52.size.CGFloat width = v36;
          v52.size.CGFloat height = v37;
          v49.origin.CGFloat x = v40;
          v49.origin.CGFloat y = v38;
          v49.size.CGFloat width = v14;
          v49.size.CGFloat height = v16;
          CGRect v50 = CGRectIntersection(v49, v52);
          if (v50.size.width > 0.0 && v50.size.height > 0.0)
          {
            objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", MEMORY[0x1E4F1CC28], v5, v50.origin.x, v50.origin.y);

            uint64_t v8 = 0;
            goto LABEL_3;
          }
        }
        [(id)AXServerCache setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v5];
        uint64_t v8 = 1;
        goto LABEL_3;
      }
      CGFloat v39 = v44.origin.y;
      CGFloat v41 = v44.origin.x;
      if ([a1 isAccessibilityElement])
      {
        v45.origin.CGFloat x = x;
        v45.origin.CGFloat y = y;
        v45.size.CGFloat width = width;
        v45.size.CGFloat height = height;
        double v24 = CGRectGetWidth(v45);
        v46.origin.CGFloat x = x;
        v46.origin.CGFloat y = y;
        v46.size.CGFloat width = width;
        v46.size.CGFloat height = height;
        double v25 = v24 * CGRectGetHeight(v46);
        v47.origin.CGFloat x = v41;
        v47.origin.CGFloat y = v39;
        v47.size.CGFloat width = v22;
        v47.size.CGFloat height = v23;
        double v26 = CGRectGetWidth(v47);
        v48.origin.CGFloat x = v41;
        v48.origin.CGFloat y = v39;
        v48.size.CGFloat width = v22;
        v48.size.CGFloat height = v23;
        double v27 = (v25 - v26 * CGRectGetHeight(v48)) / v25;
        [(id)*MEMORY[0x1E4F43630] _accessibilityMaximumAllowedOutOfBoundsPercent];
        if (v27 > v28)
        {
LABEL_7:
          [(id)AXServerCache setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v5];
          uint64_t v8 = 1;
          goto LABEL_8;
        }
      }
    }
    [(id)AXServerCache setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v5];
    uint64_t v8 = 0;
    goto LABEL_8;
  }
  id v7 = [(id)AXServerCache objectForKeyedSubscript:v5];
  uint64_t v8 = [v7 BOOLValue];
LABEL_3:

LABEL_8:
  return v8;
}

- (uint64_t)_accessibilityFKAShouldBeProcessed
{
  return 1;
}

- (uint64_t)_accessibilityFKAShouldIncludeViewsAsElements
{
  return 0;
}

- (uint64_t)_accessibilitySetFocusRingTintColor:()AXPrivCategory
{
  return [a1 _accessibilitySetRetainedValue:a3 forKey:@"AXFocusRingTintColor"];
}

- (uint64_t)_accessibilityFocusRingTintColor
{
  return [a1 _accessibilityValueForKey:@"AXFocusRingTintColor"];
}

- (uint64_t)_accessibilityApplicationOrientation
{
  return (int)__UIAccessibilityGetAssociatedInt();
}

- (uint64_t)_accessibilitySetApplicationOrientation:()AXPrivCategory
{
  return MEMORY[0x1F41063E8](a1, &__NSObject___accessibilityApplicationOrientation);
}

- (uint64_t)accessibilityMenuActions
{
  return 0;
}

- (uint64_t)accessibilityEditOperationAction:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityBeginUndoableTextInsertion
{
  return 0;
}

- (uint64_t)_accessibilityEndUndoableTextInsertion
{
  return 0;
}

- (uint64_t)_accessibilityResetBannerTimer
{
  return 0;
}

- (uint64_t)accessibilityPerformCustomAction:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityPerformCustomActionWithIdentifier:()AXPrivCategory
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
LABEL_5:
    id v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKeyedSubscript:@"CustomActionIdentifier"];
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = [a1 _accessibilityCustomActions];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
LABEL_9:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v33 != v10) {
        objc_enumerationMutation(v7);
      }
      CGFloat v12 = *(void **)(*((void *)&v32 + 1) + 8 * v11);
      if ([v12 _accessibilityMatchesCustomActionIdentifier:v6]) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v9) {
          goto LABEL_9;
        }
        goto LABEL_24;
      }
    }
    double v13 = [v12 actionHandler];

    if (v13)
    {
      CGFloat v14 = [v12 actionHandler];
      uint64_t v15 = ((uint64_t (**)(void, void *))v14)[2](v14, v12);
LABEL_18:

      goto LABEL_25;
    }
    CGFloat v16 = [v12 target];

    if (v16)
    {
      double v17 = [v12 target];
      double v18 = (objc_class *)objc_opt_class();
      Method InstanceMethod = class_getInstanceMethod(v18, (SEL)[v12 selector]);

      if (InstanceMethod)
      {
        CGFloat v14 = [v12 target];
        double v20 = method_copyReturnType(InstanceMethod);
        if (v20 && (long long v21 = v20, v22 = strcmp(v20, "B"), free(v21), !v22))
        {
          int v24 = 0;
        }
        else
        {
          CGFloat v23 = NSStringFromSelector((SEL)[v12 selector]);
          NSLog(&cfstr_ShouldReturnAB.isa, v14, v23);

          int v24 = 1;
        }
        double v26 = [v12 target];
        [v12 selector];
        char v27 = objc_opt_respondsToSelector();

        if (v27)
        {
          double v28 = [v12 target];
          CGFloat v29 = (uint64_t (*)(void *, uint64_t, void *))objc_msgSend(v28, "methodForSelector:", objc_msgSend(v12, "selector"));

          double v30 = [v12 target];
          unsigned int v31 = v29(v30, [v12 selector], v12);

          uint64_t v15 = v24 | v31;
        }
        else
        {
          uint64_t v15 = 0;
        }
        goto LABEL_18;
      }
    }
  }
LABEL_24:
  uint64_t v15 = 0;
LABEL_25:

  return v15;
}

- (uint64_t)_accessibilityBoundaryEdges
{
  return 0;
}

- (uint64_t)_accessibilityDigitalCrownScrollAmount
{
  return 75;
}

- (uint64_t)accessibilityZoomInAtPoint:()AXPrivCategory
{
  id v5 = [a1 accessibilityContainer];
  uint64_t v6 = objc_msgSend(v5, "accessibilityZoomInAtPoint:", a2, a3);

  return v6;
}

- (uint64_t)accessibilityZoomOutAtPoint:()AXPrivCategory
{
  id v5 = [a1 accessibilityContainer];
  uint64_t v6 = objc_msgSend(v5, "accessibilityZoomOutAtPoint:", a2, a3);

  return v6;
}

- (void)accessibilityIncreaseTrackingDetail
{
  id v1 = [a1 accessibilityContainer];
  [v1 accessibilityIncreaseTrackingDetail];
}

- (void)accessibilityDecreaseTrackingDetail
{
  id v1 = [a1 accessibilityContainer];
  [v1 accessibilityDecreaseTrackingDetail];
}

- (uint64_t)_accessibilityTextOperationAction:()AXPrivCategory
{
  id v4 = a3;
  id v5 = [a1 _accessibilityTextViewTextOperationResponder];
  if (([v5 accessibilityEditOperationAction:v4] & 1) == 0)
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F48D08]])
    {
      [a1 _accessibilityCopy];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D58]])
    {
      [a1 _accessibilityScanText];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D10]])
    {
      [a1 _accessibilityCut];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D40]])
    {
      [a1 _accessibilityPaste];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D68]])
    {
      [a1 _accessibilitySelectAll];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D38]])
    {
      [a1 _accessibilityMoveUp];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D30]])
    {
      [a1 _accessibilityMoveDown];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D60]])
    {
      [a1 _accessibilitySelect];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D20]])
    {
      [a1 _accessibilityDelete];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D50]])
    {
      [a1 _accessibilityReplace];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D18]])
    {
      [a1 _accessibilityDefine];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D70]])
    {
      [a1 _accessibilityShare];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D90]])
    {
      [a1 _accessibilityUnderline];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D00]])
    {
      [a1 _accessibilityBold];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D28]])
    {
      [a1 _accessibilityItalic];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D98]])
    {
      [a1 _accessibilityUndo];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D48]])
    {
      [a1 _accessibilityRedo];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D78]])
    {
      [a1 _accessibilitySpeak];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D80]])
    {
      [a1 _accessibilitySpeakSentence];
    }
    else if ([v4 isEqualToString:*MEMORY[0x1E4F48D88]])
    {
      [a1 _accessibilitySpeakSpellOut];
    }
    else
    {
      if (![v4 isEqualToString:*MEMORY[0x1E4F48DA0]])
      {
        uint64_t v6 = 0;
        goto LABEL_45;
      }
      [a1 _accessibilityShowWritingTools];
    }
  }
  uint64_t v6 = 1;
LABEL_45:

  return v6;
}

- (uint64_t)_accessibilityAuthenticatedPasteWithValue:()AXPrivCategory
{
  id v4 = (void *)MEMORY[0x1E4F28DC0];
  id v5 = a3;
  uint64_t v6 = [v4 unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:0];

  uint64_t v9 = v6;
  id v7 = v6;
  AXPerformSafeBlock();
  [a1 _accessibilityPaste];

  return 1;
}

- (void)_accessibilityShowKeyboard
{
  id v0 = [MEMORY[0x1E4F42B20] sharedInstance];
  [v0 showKeyboardWithoutSuppressionPolicy];
}

- (void)_accessibilityHideKeyboard
{
  id v1 = [MEMORY[0x1E4F42B20] sharedInstance];
  if (objc_opt_respondsToSelector())
  {
    id v0 = [MEMORY[0x1E4F42B20] sharedInstance];
    [v0 hideKeyboard];
  }
}

- (id)_accessibilityCustomRotorResultHelper:()AXPrivCategory array:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 currentItem];
  uint64_t v8 = [v7 targetElement];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = [v6 currentItem];
    uint64_t v11 = [v10 targetElement];
    uint64_t v12 = [v5 indexOfObject:v11];

    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v13 = -1;
    }
    else {
      uint64_t v13 = v12;
    }
    uint64_t v14 = [v6 searchDirection];

    if (v14 != 1)
    {
      if (v13 != -1)
      {
LABEL_12:
        unint64_t v16 = v13 - 1;
        goto LABEL_13;
      }
LABEL_11:
      uint64_t v13 = [v5 count];
      goto LABEL_12;
    }
  }
  else
  {

    uint64_t v15 = [v6 searchDirection];
    if (v15 != 1) {
      goto LABEL_11;
    }
    uint64_t v13 = -1;
  }
  unint64_t v16 = v13 + 1;
LABEL_13:
  unint64_t v17 = [v5 count];
  double v18 = 0;
  if ((v16 & 0x8000000000000000) == 0 && v16 < v17)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F426D0]);
    double v20 = [v5 objectAtIndexedSubscript:v16];
    double v18 = (void *)[v19 initWithTargetElement:v20 targetRange:0];
  }

  return v18;
}

- (uint64_t)_accessibilityPerformEscape
{
  if (!_accessibilityPerformEscape_BaseNSObjectMethod)
  {
    id v2 = (objc_class *)objc_opt_class();
    _accessibilityPerformEscape_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityPerformEscape);
  }
  id v3 = a1;
  if (v3)
  {
    id v4 = v3;
    while (1)
    {
      id v5 = (objc_class *)objc_opt_class();
      if (class_getInstanceMethod(v5, sel_accessibilityPerformEscape) != (Method)_accessibilityPerformEscape_BaseNSObjectMethod
        && ([v4 accessibilityPerformEscape] & 1) != 0)
      {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!_accessibilityPerformEscape_AXUIViewControllerClass) {
          _accessibilityPerformEscape_AXUIViewControllerClass = (uint64_t)NSClassFromString(&cfstr_Uiviewcontroll.isa);
        }
        NSClassFromString(&cfstr_Uilayoutcontai.isa);
        uint64_t isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass)
        {
          uint64_t v7 = __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_3(isKindOfClass, v4);
          if ((v7 & 1) != 0 || __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke(v7, v4)) {
            break;
          }
        }
        else
        {
          BOOL v8 = __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke(isKindOfClass, v4);
          if (v8 || (__55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_3(v8, v4) & 1) != 0) {
            break;
          }
        }
      }
      uint64_t v9 = [v4 accessibilityContainer];

      id v4 = (void *)v9;
      if (!v9) {
        goto LABEL_17;
      }
    }

    return 1;
  }
  else
  {
LABEL_17:
    uint64_t v10 = (void *)*MEMORY[0x1E4F43630];
    return [v10 accessibilityPerformEscape];
  }
}

- (id)_accessibilityTextOperations
{
  id v2 = [a1 _accessibilityTextViewTextOperationResponder];
  id v3 = v2;
  if (v2 == a1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v2 _accessibilityTextOperations];
  }

  return v4;
}

- (uint64_t)_accessibilityHasTextOperations
{
  id v2 = [a1 _accessibilityTextViewTextOperationResponder];
  id v3 = v2;
  if (v2 == a1)
  {
    id v5 = [a1 _accessibilityTextOperations];
    uint64_t v4 = [v5 count] != 0;
  }
  else
  {
    uint64_t v4 = [v2 _accessibilityHasTextOperations];
  }

  return v4;
}

- (uint64_t)_accessibilityPerformOrbGesture:()AXPrivCategory
{
  if (objc_msgSend(a1, "_accessibilityBasePerformOrbGesture:")) {
    return 1;
  }
  if (__AXRuntimeApplicationElement())
  {
    id v3 = (void (*)(void))__AXRuntimeApplicationElement();
    uint64_t v4 = v3();
    id v5 = (const void *)_AXCreateAXUIElementWithElement();
  }
  else
  {
    id v5 = (const void *)_AXCreateAXUIElementWithElement();
  }
  AXDeviceGetMainScreenBounds();
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGRectGetMidY(v12);
  [a1 _accessibilityDisplayId];
  _AXUIElementCopyElementAtPositionWithParams();
  uint64_t v2 = 0;
  if (v5) {
    CFRelease(v5);
  }
  return v2;
}

- (uint64_t)_accessibilityBasePerformOrbGesture:()AXPrivCategory
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 _accessibilityParentView];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = 0;
    do
    {
      if ([v5 isUserInteractionEnabled])
      {
        uint64_t v7 = [v5 gestureRecognizers];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v16;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v7);
              }
              CGRect v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
              if [v12 isEnabled] && (objc_opt_respondsToSelector())
              {
                [v12 _accessibilitySimulateOrbGestureWithState:a3];
                char v6 = 1;
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
          }
          while (v9);
        }
      }
      uint64_t v13 = [v5 superview];

      id v5 = (void *)v13;
    }
    while (v13);
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (uint64_t)_accessibilityCameraIrisOpen
{
  id v1 = objc_getAssociatedObject(a1, @"__ax_camera_iris_open");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_accessibilitySetCameraIrisOpen:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"__ax_camera_iris_open", v2, (void *)1);
}

- (uint64_t)_accessibilityIsTourGuideRunning
{
  id v1 = objc_getAssociatedObject(a1, @"__ax_is_tour_guide_running");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)_accessibilityMapsExplorationIsActive
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationIsPending
{
  return 0;
}

- (void)_accessibilitySetIsTourGuideRunning:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, @"__ax_is_tour_guide_running", v2, (void *)1);
}

- (void)_accessibilityPlaySystemSound:()AXPrivCategory
{
}

- (uint64_t)_accessibilityPlayKeyboardClickSound
{
  uint64_t result = UIAccessibilityIsVoiceOverRunning();
  if (result)
  {
    return [a1 _accessibilityPlaySystemSound:1104];
  }
  return result;
}

- (uint64_t)_accessibilityLoadAccessibilityInformationSupplementaryItems
{
  return 0;
}

- (uint64_t)_accessibilityShouldReleaseAfterUnregistration
{
  return 0;
}

- (uint64_t)accessibilityElementIsFocused
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend((id)__UIAccessibilityFocusedElements, "allValues", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*((void *)&v9 + 1) + 8 * v6) == a1)
        {
          uint64_t v7 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (id)accessibilityAssistiveTechnologyFocusedIdentifiers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = objc_msgSend((id)__UIAccessibilityFocusedElements, "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        long long v9 = [(id)__UIAccessibilityFocusedElements objectForKeyedSubscript:v8];

        if (v9 == a1)
        {
          if (!v5)
          {
            uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
          }
          [v5 addObject:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }

  long long v10 = (void *)[v5 copy];

  return v10;
}

- (BOOL)_accessibilityAnimationsInProgress
{
  return _AXAnimationsInProgressCount > 0;
}

- (void)_accessibilityDetectAnimationsNonActive
{
  if ([a1 _accessibilityAnimationsInProgress])
  {
    _AXAnimationsCompletedShouldNotifCGFloat y = 1;
  }
  else
  {
    UIAccessibilityPostNotification(0xFA2u, &unk_1EF171D68);
  }
}

- (double)accessibilityBoundsForTextMarkers:()AXPrivCategory
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = _beaxTextMarkerRangeForArray(v4);
    [a1 accessibilityBoundsForTextMarkerRange:v5];
    double v7 = v6;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB28];
  }

  return v7;
}

- (id)accessibilityStringForTextMarkers:()AXPrivCategory
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = _beaxTextMarkerRangeForArray(v4);
    double v6 = [a1 accessibilityContentForTextMarkerRange:v5];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (uint64_t)accessibilityArrayOfTextForTextMarkers:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityObjectForTextMarker:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityLineRangeForPosition:()AXPrivCategory
{
  Method InstanceMethod = (objc_method *)_accessibilityLineRangeForPosition__BaseMethod;
  if (!_accessibilityLineRangeForPosition__BaseMethod)
  {
    double v6 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v6, sel_accessibilityLineRangeForPosition_);
    _accessibilityLineRangeForPosition__BaseMethod = (uint64_t)InstanceMethod;
  }
  double v7 = (objc_class *)objc_opt_class();
  if (InstanceMethod == class_getInstanceMethod(v7, sel_accessibilityLineRangeForPosition_)) {
    return 0x7FFFFFFFLL;
  }

  return [a1 accessibilityLineRangeForPosition:a3];
}

- (uint64_t)_accessibilityCharacterRangeForPosition:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityPositionInDirection:()AXPrivCategory offset:forPosition:
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)accessibilityContentForLineNumber:()AXPrivCategory
{
  return 0;
}

- (double)accessibilityFrameForLineNumber:()AXPrivCategory
{
  return *MEMORY[0x1E4F1DB28];
}

- (double)_accessibilityFrameForRange:()AXPrivCategory
{
  return *MEMORY[0x1E4F1DB28];
}

- (uint64_t)_accessibilityRangeForLineNumber:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityDataDetectorScheme:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityActivateTextViewLink:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityTriggerDictationFromPath:()AXPrivCategory
{
  return 0;
}

- (void)_accessibilitySetSelectedTextRange:()AXPrivCategory
{
  if (!_accessibilitySetSelectedTextRange__BaseFrameForBrowserRangeMethod)
  {
    double v7 = (objc_class *)objc_opt_class();
    _accessibilitySetSelectedTextRange__BaseFrameForBrowserRangeMethod = (uint64_t)class_getInstanceMethod(v7, sel_browserAccessibilitySetSelectedTextRange_);
  }
  uint64_t v8 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v8, sel_browserAccessibilitySetSelectedTextRange_);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || InstanceMethod == (Method)_accessibilitySetSelectedTextRange__BaseFrameForBrowserRangeMethod)
  {
    long long v10 = [a1 _accessibilityTextViewTextOperationResponder];
    if (v10 && v10 != a1)
    {
      id v11 = v10;
      objc_msgSend(v10, "_accessibilitySetSelectedTextRange:", a3, a4);
      long long v10 = v11;
    }
  }
  else
  {
    objc_msgSend(a1, "browserAccessibilitySetSelectedTextRange:", a3, a4);
  }
}

- (uint64_t)_accessibilitySelectedTextRange
{
  if (!_accessibilitySelectedTextRange_BaseFrameForBrowserRangeMethod)
  {
    id v2 = (objc_class *)objc_opt_class();
    _accessibilitySelectedTextRange_BaseFrameForBrowserRangeMethod = (uint64_t)class_getInstanceMethod(v2, sel_browserAccessibilitySelectedTextRange);
  }
  uint64_t v3 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v3, sel_browserAccessibilitySelectedTextRange);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || InstanceMethod == (Method)_accessibilitySelectedTextRange_BaseFrameForBrowserRangeMethod)
  {
    double v6 = [a1 _accessibilityTextViewTextOperationResponder];
    double v7 = v6;
    uint64_t v8 = 0x7FFFFFFFLL;
    if (v6 && v6 != a1) {
      uint64_t v8 = [v6 _accessibilitySelectedTextRange];
    }

    return v8;
  }
  else
  {
    return [a1 safeRangeForKey:@"browserAccessibilitySelectedTextRange"];
  }
}

- (uint64_t)_accessibilityVisibleTextRange
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityLineEndPosition
{
  Method InstanceMethod = (objc_method *)_accessibilityLineEndPosition_BaseMethod;
  if (!_accessibilityLineEndPosition_BaseMethod)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v3, sel_accessibilityLineEndPositionFromCurrentSelection);
    _accessibilityLineEndPosition_BaseMethod = (uint64_t)InstanceMethod;
  }
  id v4 = (objc_class *)objc_opt_class();
  if (InstanceMethod == class_getInstanceMethod(v4, sel_accessibilityLineEndPositionFromCurrentSelection)) {
    return 0x7FFFFFFFLL;
  }

  return [a1 accessibilityLineEndPositionFromCurrentSelection];
}

- (uint64_t)_accessibilityLineStartPosition
{
  Method InstanceMethod = (objc_method *)_accessibilityLineStartPosition_BaseMethod;
  if (!_accessibilityLineStartPosition_BaseMethod)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v3, sel_accessibilityLineStartPositionFromCurrentSelection);
    _accessibilityLineStartPosition_BaseMethod = (uint64_t)InstanceMethod;
  }
  id v4 = (objc_class *)objc_opt_class();
  if (InstanceMethod == class_getInstanceMethod(v4, sel_accessibilityLineStartPositionFromCurrentSelection)) {
    return 0x7FFFFFFFLL;
  }

  return [a1 accessibilityLineStartPositionFromCurrentSelection];
}

- (uint64_t)_accessibilityLineNumberAndColumnForPoint:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityRangeForLineNumberAndColumn:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (double)_accessibilityBoundsForRange:()AXPrivCategory
{
  return *MEMORY[0x1E4F1DB28];
}

- (id)_accessibilityLineStartMarker:()AXPrivCategory
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a1 accessibilityLineStartMarkerForMarker:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_accessibilityMarkerForPoint:()AXPrivCategory
{
  if (objc_opt_respondsToSelector())
  {
    double v6 = objc_msgSend(a1, "accessibilityMarkerForPoint:", a2, a3);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_accessibilityLineEndMarker:()AXPrivCategory
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a1 accessibilityLineEndMarkerForMarker:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)_accessibilityElementStoredUserLabel
{
  return 0;
}

- (uint64_t)_accessibiltyAvailableKeyplanes
{
  return 0;
}

- (id)_accessibilityNextMarker:()AXPrivCategory
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a1 accessibilityNextTextMarker:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_accessibilityPreviousMarker:()AXPrivCategory
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a1 accessibilityPreviousTextMarker:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)_accessibilityTextMarkerRange
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = [a1 accessibilityTextMarkerRange];
    uint64_t v3 = _beaxRangeToArray(v2);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityPageTextMarkerRange
{
  return 0;
}

- (uint64_t)_accessibilityFilenameForAttachmentCID:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityRangeForTextMarker:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityRangeForTextMarkers:()AXPrivCategory
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = _beaxTextMarkerRangeForArray(v4);
    uint64_t v6 = [a1 accessibilityRangeForTextMarkerRange:v5];
  }
  else
  {
    uint64_t v6 = 0x7FFFFFFFLL;
  }

  return v6;
}

- (id)_accessibilityTextMarkerRangeForSelection
{
  if (objc_opt_respondsToSelector())
  {
    id v2 = [a1 accessibilityTextMarkerRangeForCurrentSelection];
    uint64_t v3 = _beaxRangeToArray(v2);
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilitySelectedNSRangeForObject
{
  return 0x7FFFFFFFLL;
}

- (id)_accessibilityTextMarkerForPosition:()AXPrivCategory
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [a1 accessibilityTextMarkerForPosition:a3];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)_accessibilityDOMAttributes
{
  return 0;
}

- (uint64_t)_accessibilityReadAllContinuesWithScroll
{
  return 0;
}

- (double)_accessibilityVisibleScrollArea:()AXPrivCategory
{
  return 2147483650.0;
}

- (uint64_t)accessibilityPageContent
{
  return 0;
}

- (uint64_t)accessibilityLineNumberForPoint:()AXPrivCategory
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_accessibilityIncludeDuringContentReading
{
  return 0;
}

- (uint64_t)_accessibilityPageContent
{
  return 0;
}

- (uint64_t)_accessibilityShouldAnnounceFontInfo
{
  return 1;
}

- (uint64_t)_accessibilityKeyboardKeyAllowsTouchTyping
{
  return 0;
}

- (uint64_t)_accessibilityBookShowsDualPages
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardSupportsGestureMode
{
  return 0;
}

- (uint64_t)accessibilityImageOverlayElements
{
  return 0;
}

- (id)_accessibilityPhotoDescription
{
  return objc_getAssociatedObject(a1, &AXPhotoDesc);
}

- (void)_setAccessibilityPhotoDescription:()AXPrivCategory
{
}

- (double)_accessibilityTextCursorFrame
{
  uint64_t v2 = [a1 accessibilityTraits];
  if ((*MEMORY[0x1E4F48C28] & ~v2) != 0) {
    return *MEMORY[0x1E4F1DB28];
  }
  if (![a1 conformsToProtocol:&unk_1EF1BE0D8]) {
    return *MEMORY[0x1E4F1DB28];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return *MEMORY[0x1E4F1DB28];
  }
  id v3 = a1;
  id v4 = [v3 selectedTextRange];
  [v3 firstRectForRange:v4];
  double v9 = UIAccessibilityFrameForBounds(v3, v5, v6, v7, v8);

  return v9;
}

- (double)_accessibilityKeyboardFrame
{
  if (!AXUIKeyboardIsOnScreen()) {
    return *MEMORY[0x1E4F1DB28];
  }
  AXUIKeyboardScreenFrame();
  return result;
}

- (__CFString)accessibilityLabelForRange:()AXPrivCategory
{
  id v4 = [a1 _accessibilityPotentiallyAttributedValueForNonAttributedSelector:sel_accessibilityLabel attributedSelector:sel_accessibilityAttributedLabel];
  if (!v4)
  {
    double v9 = 0;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      _AXAssert();
    }
    long long v10 = v4;
    double v6 = v10;
    if (a3)
    {
      v15.length = [(__CFString *)v10 length];
      v15.id location = 0;
      NSRange v11 = NSIntersectionRange(*a3, v15);
      if (v11.length)
      {
        -[__CFString attributedSubstringFromRange:](v6, "attributedSubstringFromRange:", v11.location, v11.length);
        double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
LABEL_14:
      double v9 = 0;
      goto LABEL_15;
    }
LABEL_12:
    double v8 = v6;
    goto LABEL_13;
  }
  CFStringRef v5 = v4;
  double v6 = (__CFString *)v5;
  if (!a3) {
    goto LABEL_12;
  }
  v14.length = CFStringGetLength(v5);
  v14.id location = 0;
  NSRange v7 = NSIntersectionRange(*a3, v14);
  if (!v7.length) {
    goto LABEL_14;
  }
  -[__CFString substringWithRange:](v6, "substringWithRange:", v7.location, v7.length);
  double v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  double v9 = v8;
LABEL_15:

LABEL_16:

  return v9;
}

- (id)_accessibilityMarkersForPoints:()AXPrivCategory
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFStringRef v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "pointValue", (void)v13);
        NSRange v11 = objc_msgSend(a1, "_accessibilityMarkerForPoint:");
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_accessibilityMarkersForRange:()AXPrivCategory
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = objc_msgSend(a1, "accessibilityTextMarkerRangeForRange:", a3, a4);
    uint64_t v8 = _beaxRangeToArray(v7);
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v9 = [a1 _accessibilityTextMarkerForPosition:a3];
    if (v9)
    {
      [v8 addObject:v9];
    }
    else
    {
      long long v10 = [MEMORY[0x1E4F1CA98] null];
      [v8 addObject:v10];
    }
    uint64_t v7 = [a1 _accessibilityTextMarkerForPosition:a3 + a4];

    if (v7)
    {
      [v8 addObject:v7];
    }
    else
    {
      NSRange v11 = [MEMORY[0x1E4F1CA98] null];
      [v8 addObject:v11];
    }
  }

  return v8;
}

- (id)_accessibilityMarkerLineEndsForMarkers:()AXPrivCategory
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFStringRef v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        NSRange v11 = objc_msgSend(a1, "_accessibilityLineEndMarker:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)_accessibilitySupportsReadingContent
{
  return 0;
}

- (uint64_t)_accessibilityReadAllOnFocus
{
  return 0;
}

- (uint64_t)__accessibilityReadAllOnFocus
{
  id v1 = a1;
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  do
  {
    uint64_t v3 = [v2 _accessibilityReadAllOnFocus];
    if (v3) {
      break;
    }
    uint64_t v4 = [v2 accessibilityContainer];

    uint64_t v2 = (void *)v4;
  }
  while (v4);

  return v3;
}

- (id)_accessibilityValueForRange:()AXPrivCategory
{
  if (!_accessibilityValueForRange__BaseFrameForBrowserRangeMethod)
  {
    CFStringRef v5 = (objc_class *)objc_opt_class();
    _accessibilityValueForRange__BaseFrameForBrowserRangeMethod = (uint64_t)class_getInstanceMethod(v5, sel_browserAccessibilityValueInRange_);
  }
  id v6 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v6, sel_browserAccessibilityValueInRange_);
  if (a3)
  {
    Method v8 = InstanceMethod;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && v8 != (Method)_accessibilityValueForRange__BaseFrameForBrowserRangeMethod)
    {
      length = objc_msgSend(a1, "browserAccessibilityValueInRange:", a3->location, a3->length);
      goto LABEL_17;
    }
  }
  long long v10 = [a1 _accessibilityAXAttributedValue];
  NSRange v11 = v10;
  if (!a3 || !v10)
  {
    id v13 = v10;
LABEL_15:
    length = v13;
    goto LABEL_16;
  }
  v16.length = [v10 length];
  v16.id location = 0;
  NSRange v12 = NSIntersectionRange(*a3, v16);
  length = (void *)v12.length;
  if (v12.length)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v11, "attributedSubstringFromRange:", v12.location, v12.length);
    }
    else {
      objc_msgSend(v11, "substringWithRange:", v12.location, v12.length);
    }
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
LABEL_16:

LABEL_17:

  return length;
}

- (uint64_t)_accessibilitySupportsFrameForRange
{
  uint64_t result = [a1 conformsToProtocol:&unk_1EF1CB3D0];
  if (result)
  {
    if (!_accessibilitySupportsFrameForRange_BaseFrameForRangeMethod)
    {
      uint64_t v2 = (objc_class *)objc_opt_class();
      _accessibilitySupportsFrameForRange_BaseFrameForRangeMethod = (uint64_t)class_getInstanceMethod(v2, sel__accessibilityFrameForRange_);
    }
    uint64_t v3 = (objc_class *)objc_opt_class();
    return _accessibilitySupportsFrameForRange_BaseFrameForRangeMethod != (void)class_getInstanceMethod(v3, sel__accessibilityFrameForRange_);
  }
  return result;
}

- (BOOL)_accessibilitySupportsRangeForLineNumber
{
  if (!_accessibilitySupportsRangeForLineNumber_BaseRangeForLineNumberMethod)
  {
    id v0 = (objc_class *)objc_opt_class();
    _accessibilitySupportsRangeForLineNumber_BaseRangeForLineNumberMethod = (uint64_t)class_getInstanceMethod(v0, sel__accessibilityRangeForLineNumber_);
  }
  id v1 = (objc_class *)objc_opt_class();
  return _accessibilitySupportsRangeForLineNumber_BaseRangeForLineNumberMethod != (void)class_getInstanceMethod(v1, sel__accessibilityRangeForLineNumber_);
}

+ (id)_accessibilityTextChecker
{
  id v0 = (void *)_AXTextChecker;
  if (!_AXTextChecker)
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F42EE8]) _initWithAsynchronousLoading:1];
    uint64_t v2 = (void *)_AXTextChecker;
    _AXTextChecker = v1;

    id v0 = (void *)_AXTextChecker;
  }
  if ([v0 _doneLoading]) {
    id v3 = (id)_AXTextChecker;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityTextChecker
{
  return [MEMORY[0x1E4FBA8A8] _accessibilityTextChecker];
}

- (uint64_t)_accessibilityTextViewIgnoresValueChanges
{
  return [a1 _accessibilityBoolValueForKey:@"_accessibilitySetTextViewIgnoresValueChanges"];
}

- (uint64_t)_accessibilitySetTextViewIgnoresValueChanges:()AXPrivCategory
{
  return [a1 _accessibilitySetBoolValue:a3 forKey:@"_accessibilitySetTextViewIgnoresValueChanges"];
}

- (void)_accessibilitySetTextViewShouldBreakUpParagraphs:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetValue:v2 forKey:@"AXTextViewBreakUpParagraphs" storageMode:0];
}

- (uint64_t)_accessibilityTextViewShouldBreakUpParagraphs
{
  uint64_t v1 = [a1 _accessibilityValueForKey:@"AXTextViewBreakUpParagraphs"];
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (uint64_t)_accessibilityActivateParagraphInTextViewRange:()AXPrivCategory
{
  uint64_t v6 = [a1 _accessibilityGetBlockForAttribute:24];
  uint64_t v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a3, a4);
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_accessibilitySetIncreaseLayoutBounds:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _accessibilitySetValue:v2 forKey:@"AXIncreaseLayoutBounds" storageMode:0];
}

- (uint64_t)_accessibilityIncreaseLayoutBounds
{
  uint64_t v1 = [a1 _accessibilityValueForKey:@"AXIncreaseLayoutBounds"];
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (void)_accessibilitySetValue:()AXPrivCategory
{
  id v5 = a3;
  uint64_t v4 = [a1 _accessibilityTextViewTextOperationResponder];
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 setText:v5];
    }
  }
}

- (void)_accessibilityConvertStyleAttributesToAccessibility:()AXPrivCategory
{
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  uint64_t v5 = [v3 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__NSObject_AXPrivCategory___accessibilityConvertStyleAttributesToAccessibility___block_invoke;
  v7[3] = &unk_1E59B8A38;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v7);
  [v3 setAttributedString:v6];
}

- (double)_accessibilityNavigationControllerInset
{
  return *MEMORY[0x1E4F437F8];
}

- (void)_accessibilityAddAutoCorrectionAttributes:()AXPrivCategory
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F42B20] activeInstance];
  uint64_t v5 = [v4 safeValueForKey:@"_textChoicesAssistant"];

  id v6 = [v5 safeValueForKey:@"underlinedWordData"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    uint64_t v10 = *MEMORY[0x1E4F1CFD0];
    NSRange v11 = (void *)MEMORY[0x1E4F48AC0];
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        NSRange v13 = NSRangeFromString((NSString *)*(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v13.location + v13.length < [v3 length]) {
          objc_msgSend(v3, "addAttribute:value:range:", *v11, v10, v13.location, v13.length);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)_accessibilityAddMispellingsToAttributedString:()AXPrivCategory
{
  id v20 = a3;
  if (v20)
  {
    id v4 = a1;
    NSClassFromString(&cfstr_Uiaccessibilit_16.isa);
    uint64_t v5 = v4;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v4 accessibilityContainer];
    }
    if ((objc_opt_respondsToSelector() & 1) == 0 || [v5 spellCheckingType] != 1)
    {
      if (AXRequestingClient() == 3)
      {
        uint64_t v6 = *MEMORY[0x1E4F48AC8];
        uint64_t v7 = [v20 length];
        objc_msgSend(v20, "addAttribute:value:range:", v6, MEMORY[0x1E4F1CC38], 0, v7);
      }
      else
      {
        uint64_t v8 = [v4 _accessibilityTextChecker];
        if (v8)
        {
          uint64_t v9 = [v20 string];
          NSUInteger v10 = [v9 length];
          NSRange v11 = [MEMORY[0x1E4F42B30] sharedInputModeController];
          NSUInteger v12 = 0;
          uint64_t v13 = *MEMORY[0x1E4F1CFD0];
          while (1)
          {
            long long v14 = [v11 currentInputMode];
            if (!v14)
            {
              long long v14 = [v11 currentSystemInputMode];
            }
            long long v15 = [v14 primaryLanguage];
            NSUInteger v16 = objc_msgSend(v8, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v9, 0, v10, v12, 0, v15);
            NSUInteger v18 = v17;

            if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            v22.id location = 0;
            v22.length = v10;
            v23.id location = v16;
            v23.length = v18;
            NSRange v19 = NSIntersectionRange(v22, v23);
            objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E4F48A58], v13, v19.location, v19.length);
            NSUInteger v12 = v16 + v18;

            if (v12 >= v10) {
              goto LABEL_16;
            }
          }

LABEL_16:
        }
      }
    }
  }
}

- (id)_accessibilityAttributedValueForRange:()AXPrivCategory
{
  if (!_accessibilityAttributedValueForRange__BaseFrameForBrowserRangeMethod)
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    _accessibilityAttributedValueForRange__BaseFrameForBrowserRangeMethod = (uint64_t)class_getInstanceMethod(v5, sel_browserAccessibilityAttributedValueInRange_);
  }
  uint64_t v6 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v6, sel_browserAccessibilityAttributedValueInRange_);
  if (a3)
  {
    Method v8 = InstanceMethod;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && v8 != (Method)_accessibilityAttributedValueForRange__BaseFrameForBrowserRangeMethod)
    {
      objc_msgSend(a1, "browserAccessibilityAttributedValueInRange:", *a3, a3[1]);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  NSUInteger v10 = [a1 _accessibilityValueForRange:a3];
  if ([v10 length])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = objc_msgSend((id)objc_msgSend(v10, "cfAttributedString"), "mutableCopy");
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 mutableCopyWithZone:0];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v9 = 0;
          goto LABEL_16;
        }
        uint64_t v11 = [objc_allocWithZone(MEMORY[0x1E4F28E48]) initWithString:v10];
      }
    }
    id v9 = (id)v11;
LABEL_16:
    [a1 _accessibilityAddAutoCorrectionAttributes:v9];
    [a1 _accessibilityConvertStyleAttributesToAccessibility:v9];
    [a1 _accessibilityAddMispellingsToAttributedString:v9];
    goto LABEL_17;
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F28B18]);
LABEL_17:

LABEL_18:

  return v9;
}

- (uint64_t)_accessibilityTextInputProxiesForRealTextView
{
  return 1;
}

- (void)_accessibilityPostValueChangedNotificationWithChangeType:()AXPrivCategory insertedText:keyInputDelegate:
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  AXPerformBlockAsynchronouslyOnMainThread();
}

- (uint64_t)_accessibilityPostValueChangedNotificationWithInsertedText:()AXPrivCategory
{
  return [a1 _accessibilityPostValueChangedNotificationWithChangeType:*MEMORY[0x1E4F48DC8] insertedText:a3 keyInputDelegate:0];
}

- (uint64_t)_accessibilityPostValueChangedNotificationWithChangeType:()AXPrivCategory
{
  return [a1 _accessibilityPostValueChangedNotificationWithChangeType:a3 insertedText:0 keyInputDelegate:0];
}

- (uint64_t)_accessibilityPostValueChangedNotificationWithInsertedText:()AXPrivCategory keyInputDelegate:
{
  return [a1 _accessibilityPostValueChangedNotificationWithChangeType:*MEMORY[0x1E4F48DC8] insertedText:a3 keyInputDelegate:a4];
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  uint64_t v1 = UIAccessibilityTraitIsEditing | UIAccessibilityTraitTextEntry;
  return (v1 & ~[a1 accessibilityTraits]) == 0;
}

- (uint64_t)_accessibilityElementForTextInsertionAndDeletion
{
  return [a1 _accessibilityTextHandlingAncestorMatchingBlock:&__block_literal_global_1812];
}

- (uint64_t)_accessibilityElementForFindSessionResult
{
  return 0;
}

- (uint64_t)_accessibilityUIViewAccessibilityFrame
{
  return 0;
}

- (uint64_t)_accessibilityShowContextMenuForElement:()AXPrivCategory targetPointValue:
{
  return 0;
}

- (uint64_t)_accessibilityCanAppearInContextMenuPreview
{
  return 1;
}

- (id)_accessibilityHandwritingElement
{
  uint64_t v2 = [a1 accessibilityTraits];
  if ((*MEMORY[0x1E4F48C30] & v2) != 0
    || ([a1 _accessibilityTextHandlingAncestorMatchingBlock:&__block_literal_global_1814],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v3 = [a1 _accessibilityFirstResponderForKeyWindow];
    id v4 = v3;
    if (v3 == a1)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [v3 _accessibilityHandwritingElement];
    }
  }

  return v5;
}

- (id)_accessibilityTextHandlingAncestorMatchingBlock:()AXPrivCategory
{
  id v4 = a3;
  id v5 = a1;
  id v6 = v5;
  if (!v5) {
    goto LABEL_9;
  }
  id v7 = v5;
  while (1)
  {
    if (v4[2](v4, v7))
    {
      id v8 = v7;
      goto LABEL_16;
    }
    id v8 = [v7 _accessibilityViewController];
    if (v4[2](v4, v8)) {
      break;
    }
    uint64_t v9 = [v7 accessibilityContainer];

    id v7 = (void *)v9;
    if (!v9) {
      goto LABEL_9;
    }
  }

  if (!v8)
  {
LABEL_9:
    NSUInteger v10 = [v6 _accessibilityWindow];
    uint64_t v11 = [v10 firstResponder];

    if (v11)
    {
      while (1)
      {
        if (v4[2](v4, v11))
        {
          id v8 = v11;
          goto LABEL_16;
        }
        id v8 = [v11 _accessibilityViewController];
        if (v4[2](v4, v8)) {
          break;
        }
        uint64_t v12 = [v11 accessibilityContainer];

        uint64_t v11 = (void *)v12;
        if (!v12) {
          goto LABEL_13;
        }
      }
    }
    else
    {
LABEL_13:
      id v8 = 0;
    }
  }
LABEL_16:

  return v8;
}

- (uint64_t)_accessibilitySupportsHandwriting
{
  uint64_t v2 = UIAccessibilityTraitLaunchIcon | UIAccessibilityTraitWebContent | UIAccessibilityTraitFolderIcon | UIAccessibilityTraitSecureTextField | UIAccessibilityTraitTableIndex;
  if (([a1 accessibilityTraits] & v2) != 0) {
    return 1;
  }

  return [a1 _accessibilitySupportsTextInsertionAndDeletion];
}

- (id)_accessibilityHandwritingAttributes
{
  v14[7] = *MEMORY[0x1E4F143B8];
  if ([a1 _accessibilitySupportsHandwriting])
  {
    v13[0] = *MEMORY[0x1E4F49400];
    uint64_t v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "_accessibilityHandwritingAttributePreferredCharacterSet"));
    v14[0] = v2;
    v13[1] = *MEMORY[0x1E4F493F0];
    id v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_accessibilityHasDeletableText"));
    v14[1] = v3;
    v13[2] = *MEMORY[0x1E4F49408];
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_accessibilityHandwritingAttributeShouldEchoCharacter"));
    v14[2] = v4;
    v13[3] = *MEMORY[0x1E4F49410];
    id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_accessibilityHandwritingAttributeShouldPlayKeyboardSecureClickSound"));
    v14[3] = v5;
    v13[4] = *MEMORY[0x1E4F493E0];
    id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_accessibilitySupportsTextInsertionAndDeletion"));
    v14[4] = v6;
    v13[5] = *MEMORY[0x1E4F493E8];
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "_accessibilityHandwritingAttributeAllowedCharacterSets"));
    v14[5] = v7;
    v13[6] = *MEMORY[0x1E4F493D8];
    id v8 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "_accessibilityHandwritingAttributeAcceptsContractedBraille"));
    v14[6] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:7];

    NSUInteger v10 = [a1 _accessibilityHandwritingAttributeLanguage];
    if (v10)
    {
      uint64_t v11 = (void *)[v9 mutableCopy];
      [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F493F8]];

      uint64_t v9 = v11;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)_accessibilityRequiresLaTeXInput
{
  return 0;
}

- (uint64_t)_accessibilityHandwritingAttributePreferredCharacterSetForKeyboardType:()AXPrivCategory
{
  if ((unint64_t)(a3 - 2) > 6) {
    return 1;
  }
  else {
    return qword_19F349138[a3 - 2];
  }
}

- (uint64_t)_accessibilityHandwritingAttributePreferredCharacterSet
{
  uint64_t v2 = [MEMORY[0x1E4F42B08] activeKeyboard];
  id v3 = [v2 defaultTextInputTraits];

  uint64_t v4 = objc_msgSend(a1, "_accessibilityHandwritingAttributePreferredCharacterSetForKeyboardType:", objc_msgSend(v3, "keyboardType"));
  return v4;
}

- (uint64_t)_accessibilityHandwritingAttributeAllowedCharacterSetsForKeyboardType:()AXPrivCategory
{
  if ((unint64_t)(a3 - 2) > 6) {
    return 15;
  }
  else {
    return qword_19F349170[a3 - 2];
  }
}

- (uint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets
{
  uint64_t v2 = [MEMORY[0x1E4F42B08] activeKeyboard];
  id v3 = [v2 defaultTextInputTraits];

  if (v3) {
    uint64_t v4 = objc_msgSend(a1, "_accessibilityHandwritingAttributeAllowedCharacterSetsForKeyboardType:", objc_msgSend(v3, "keyboardType"));
  }
  else {
    uint64_t v4 = 15;
  }

  return v4;
}

- (uint64_t)_accessibilityHasDeletableText
{
  if (![a1 conformsToProtocol:&unk_1EF1BCF68]) {
    return 1;
  }

  return [a1 hasText];
}

- (BOOL)_accessibilityHandwritingAttributeShouldEchoCharacter
{
  uint64_t v1 = [a1 accessibilityTraits];
  return (UIAccessibilityTraitSecureTextField & v1) == 0;
}

- (BOOL)_accessibilityHandwritingAttributeShouldPlayKeyboardSecureClickSound
{
  uint64_t v1 = [a1 accessibilityTraits];
  return (UIAccessibilityTraitSecureTextField & ~v1) == 0;
}

- (BOOL)_accessibilityHandwritingAttributeAcceptsContractedBraille
{
  uint64_t v1 = [a1 accessibilityTraits];
  return (UIAccessibilityTraitTextEntry & v1) != 0;
}

- (id)_accessibilityHandwritingAttributeLanguage
{
  id v0 = [MEMORY[0x1E4F42B08] activeKeyboard];

  if (v0)
  {
    uint64_t v1 = [MEMORY[0x1E4F42B30] sharedInputModeController];
    uint64_t v2 = [v1 currentInputMode];
    id v0 = [v2 primaryLanguage];
  }

  return v0;
}

- (uint64_t)_accessibilityReplaceTextInRange:()AXPrivCategory withString:
{
  id v8 = a5;
  if ([a1 conformsToProtocol:&unk_1EF1BE0D8])
  {
    id v9 = a1;
    NSUInteger v10 = [v9 beginningOfDocument];
    uint64_t v11 = [v9 positionFromPosition:v10 offset:a3];

    uint64_t v12 = [v9 beginningOfDocument];
    uint64_t v13 = [v9 positionFromPosition:v12 offset:a3 + a4];

    long long v14 = [v9 textRangeFromPosition:v11 toPosition:v13];
    [v9 replaceRange:v14 withText:v8];

    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)_accessibilityReplaceCharactersAtCursor:()AXPrivCategory withString:
{
  id v6 = a4;
  if (_accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserDeleteTextMethod) {
    BOOL v7 = _accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserInsertTextMethod == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = (objc_class *)objc_opt_class();
    _accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserDeleteTextMethod = (uint64_t)class_getInstanceMethod(v8, sel_browserAccessibilityDeleteTextAtCursor_);
    id v9 = (objc_class *)objc_opt_class();
    _accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserInsertTextMethod = (uint64_t)class_getInstanceMethod(v9, sel_browserAccessibilityInsertTextAtCursor_);
  }
  NSUInteger v10 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v10, sel_browserAccessibilityDeleteTextAtCursor_);
  uint64_t v12 = (objc_class *)objc_opt_class();
  Method v13 = class_getInstanceMethod(v12, sel_browserAccessibilityInsertTextAtCursor_);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (Method)_accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserDeleteTextMethod == InstanceMethod
    || (Method)_accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserInsertTextMethod == v13)
  {
    objc_opt_class();
    uint64_t v15 = __UIAccessibilityCastAsClass();
    int v16 = [v15 isFirstResponder];

    if (v16)
    {
      NSUInteger v17 = [MEMORY[0x1E4F42B20] sharedInstance];
      _UIAccessibilityBlockPostingOfAllNotifications();
      for (; a3; --a3)
        [v17 deleteFromInputWithFlags:128];
      if ([v6 length]) {
        [v17 addInputString:v6 withFlags:128];
      }
      AXPerformBlockAsynchronouslyOnMainThread();
    }
    else
    {
      NSUInteger v18 = AXLogAppAccessibility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[NSObject(AXPrivCategory) _accessibilityReplaceCharactersAtCursor:withString:]();
      }

      if (![a1 conformsToProtocol:&unk_1EF1BCF68]) {
        goto LABEL_30;
      }
      for (; a3; --a3)
        [a1 deleteBackward];
      if ([v6 length]) {
        [a1 insertText:v6];
      }
      NSUInteger v17 = [MEMORY[0x1E4F42B20] sharedInstance];
      [v17 updateReturnKey:0];
    }

LABEL_30:
    NSRange v19 = [MEMORY[0x1E4F42B20] sharedInstance];
    id v20 = [v19 safeValueForKey:@"taskQueue"];

    id v21 = v20;
    AXPerformSafeBlock();

    goto LABEL_31;
  }
  if (a3 >= 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v14 = a3;
  }
  [a1 browserAccessibilityDeleteTextAtCursor:v14];
  [a1 browserAccessibilityInsertTextAtCursor:v6];
LABEL_31:
}

- (void)_accessibilityInsertText:()AXPrivCategory atPosition:
{
  if (a4 < 0) {
    return objc_msgSend(a1, "_accessibilityInsertText:");
  }
  return a1;
}

- (void)_accessibilityInsertText:()AXPrivCategory
{
  id v4 = a3;
  if (v4)
  {
    _UIAccessibilityBlockPostingOfAllNotifications();
    objc_opt_class();
    id v5 = __UIAccessibilityCastAsClass();
    if ([v5 isFirstResponder])
    {
    }
    else
    {
      objc_opt_class();
      id v6 = [a1 _accessibilityTextViewTextOperationResponder];
      BOOL v7 = __UIAccessibilityCastAsClass();

      LODWORD(v6) = [v7 isFirstResponder];
      if (!v6)
      {
        NSUInteger v10 = AXLogAppAccessibility();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[NSObject(AXPrivCategory) _accessibilityInsertText:]();
        }

        if (![a1 conformsToProtocol:&unk_1EF1BCF68]) {
          goto LABEL_7;
        }
        [a1 insertText:v4];
        id v8 = [MEMORY[0x1E4F42B20] sharedInstance];
        [v8 updateReturnKey:0];
LABEL_6:

LABEL_7:
        id v9 = AXUIKeyboardEntryNotificationBlockTimer();
        [v9 afterDelay:&__block_literal_global_1826 processBlock:0.15];

        goto LABEL_8;
      }
    }
    id v8 = [MEMORY[0x1E4F42B20] sharedInstance];
    [v8 addInputString:v4 withFlags:128];
    goto LABEL_6;
  }
LABEL_8:
}

- (uint64_t)_accessibilityInsertTextWithAlternatives:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityAlternativesForTextAtPosition:()AXPrivCategory
{
  return 0;
}

- (BOOL)_accessibilityActivateKeyboardReturnKey
{
  id v0 = UIAccessibilityGetKeyboardLayoutStar();
  uint64_t v1 = [v0 _accessibilityKeyboardKeyForString:@"\n"];

  if (v1) {
    [v1 accessibilityActivate];
  }

  return v1 != 0;
}

- (uint64_t)_accessibilityActivateKeyboardDeleteKey
{
  id v0 = [MEMORY[0x1E4F42B20] activeInstance];
  uint64_t v1 = v0;
  if (v0)
  {
    uint64_t v2 = [v0 safeValueForKey:@"_layout"];
    uint64_t v3 = [v2 safeValueForKey:@"window"];

    if (v3)
    {
      NSClassFromString(&cfstr_Uikeyboardlayo.isa);
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        _AXAssert();
      }
      id v4 = [v2 _accessibilityKeyboardKeyForString:@"\b"];
      id v5 = v4;
      uint64_t v3 = v4 != 0;
      if (v4) {
        [v4 accessibilityActivate];
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityDispatchKeyboardAction:()AXPrivCategory
{
  return objc_msgSend((id)*MEMORY[0x1E4F43630], "_accessibilityDispatchKeyboardAction:");
}

- (uint64_t)_accessibilityDismissAlternativeKeyPicker
{
  return 0;
}

- (double)_accessibilityMinScrubberPosition
{
  return *MEMORY[0x1E4F1DAD8];
}

- (double)_accessibilityMaxScrubberPosition
{
  return *MEMORY[0x1E4F1DAD8];
}

- (uint64_t)_accessibilityUserTestingVisibleCells
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingVisibleSections
{
  return 0;
}

- (uint64_t)_accessibilityIndexForPickerString:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityBackingElementIsValid
{
  return 1;
}

- (uint64_t)accessibilityInvalidStatus
{
  return 0;
}

- (id)accessibilitySortDirection
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([a1 safeValueForKey:@"_browserAccessibilityStoredValueSortDirection"],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    uint64_t v3 = [a1 safeStringForKey:@"browserAccessibilitySortDirection"];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)accessibilityExpandedTextValue
{
  return 0;
}

- (uint64_t)_accessibilityIsRealtimeElement
{
  uint64_t v1 = [a1 _accessibilityGetBlockForAttribute:20];
  uint64_t v2 = (void *)v1;
  if (v1) {
    uint64_t v3 = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [a1 _accessibilityGetBlockForAttribute:29];
  uint64_t v2 = (void *)v1;
  if (v1)
  {
    uint64_t v3 = (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
  else
  {
    v6[0] = *MEMORY[0x1E4F43758];
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  id v4 = (void *)v3;

  return v4;
}

- (uint64_t)_accessibilityIsInJindo
{
  uint64_t v1 = [a1 _accessibilityWindow];
  uint64_t v2 = [v1 windowScene];
  char v3 = objc_opt_respondsToSelector();

  char v4 = [v1 _accessibilityIsInJindo];
  char v5 = v3 | v4;
  if ((v3 & 1) != 0 && (v4 & 1) == 0)
  {
    id v6 = [v1 windowScene];
    char v5 = objc_msgSend(v6, "SBUI_isHostedBySystemAperture");
  }
  return v5 & 1;
}

- (uint64_t)_accessibilityIsJindo
{
  return 0;
}

- (uint64_t)_accessibilityIsInWidgetStack
{
  return 0;
}

- (uint64_t)accessibilityIsInDescriptionListTerm
{
  return 0;
}

- (uint64_t)accessibilityIsInDescriptionListDefinition
{
  return 0;
}

- (uint64_t)accessibilityIsComboBox
{
  return 0;
}

- (uint64_t)accessibilityHasPopup
{
  return 0;
}

- (uint64_t)accessibilityPopupValue
{
  return 0;
}

- (uint64_t)_accessibilityWebSearchResultsActive
{
  return 0;
}

- (uint64_t)_accessibilityActiveURL
{
  return 0;
}

- (uint64_t)_accessibilityWebViewIsLoading
{
  return 0;
}

- (uint64_t)_accessibilityDateTimePickerValues
{
  return 0;
}

- (double)_accessibilityGesturePracticeRegion
{
  return *MEMORY[0x1E4F1DB28];
}

- (uint64_t)_accessibilityPickerType
{
  return 0;
}

- (uint64_t)_accessibilityDatePickerComponentType
{
  return 0;
}

- (uint64_t)_accessibilityAutomaticIdentifier
{
  return 0;
}

- (uint64_t)_accessibilityHorizontalSizeClass
{
  return 0;
}

- (uint64_t)_accessibilityVerticalSizeClass
{
  return 0;
}

- (uint64_t)_accessibilityHitTestsStatusBar
{
  return 1;
}

- (uint64_t)_accessibilityShouldHitTestStatusBarWindow
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingVisibleAncestor
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingProxyView
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingActions
{
  return 0;
}

- (uint64_t)_accessibilityPerformUserTestingAction:()AXPrivCategory
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count]
    && ([v4 objectAtIndexedSubscript:0],
        char v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    BOOL v7 = [v4 objectAtIndexedSubscript:0];
    id v8 = 0;
    if ((unint64_t)[v4 count] >= 2)
    {
      id v8 = [v4 objectAtIndexedSubscript:1];
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = [a1 _accessibilityUserTestingActions];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      double v25 = v8;
      uint64_t v12 = *(void *)v27;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * v13);
        uint64_t v15 = [v14 identifier];
        int v16 = [v15 isEqualToString:v7];

        if (v16) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v11) {
            goto LABEL_7;
          }
          goto LABEL_22;
        }
      }
      NSUInteger v18 = (objc_class *)objc_opt_class();
      Method InstanceMethod = class_getInstanceMethod(v18, (SEL)[v14 selector]);
      if (!InstanceMethod)
      {
LABEL_22:
        uint64_t v17 = 0;
        id v8 = v25;
        goto LABEL_23;
      }
      id v20 = method_copyReturnType(InstanceMethod);
      id v8 = v25;
      if (!v20 || (id v21 = v20, v22 = strcmp(v20, "B"), free(v21), v22))
      {
        NSRange v23 = NSStringFromSelector((SEL)[v14 selector]);
        NSLog(&cfstr_ShouldReturnAB_0.isa, a1, v23);

        int v22 = 1;
      }
      [v14 selector];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v17 = v22 | ((unsigned int (*)(void *, uint64_t, void *))objc_msgSend(a1, "methodForSelector:", objc_msgSend(v14, "selector")))(a1, objc_msgSend(v14, "selector"), v25);
        goto LABEL_23;
      }
    }
    uint64_t v17 = 0;
LABEL_23:
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (id)_accessibilityUserTestingActionIdentifiers
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = [a1 _accessibilityUserTestingActions];
  if ([v3 count])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v11 = [v10 identifier];
          uint64_t v12 = [v11 length];

          if (!v12)
          {
            uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
            [v14 handleFailureInMethod:a2 object:a1 file:@"NSObjectAccessibility.m" lineNumber:16227 description:@"UIAccessibilityAutomationAction must have an identifier."];
          }
          if (![v10 selector])
          {
            uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
            [v15 handleFailureInMethod:a2 object:a1 file:@"NSObjectAccessibility.m" lineNumber:16228 description:@"UIAccessibilityAutomationAction must have a selector."];
          }
          uint64_t v13 = [v10 identifier];
          [v4 addObject:v13];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (uint64_t)_accessibilityShouldApplySemanticGroupContainerType
{
  Method InstanceMethod = (objc_method *)_accessibilityShouldApplySemanticGroupContainerType_BaseTouchContainer;
  if (!_accessibilityShouldApplySemanticGroupContainerType_BaseTouchContainer)
  {
    char v3 = (objc_class *)objc_opt_class();
    Method InstanceMethod = class_getInstanceMethod(v3, sel__accessibilityIsTouchContainer);
    _accessibilityShouldApplySemanticGroupContainerType_BaseTouchContainer = (uint64_t)InstanceMethod;
  }
  id v4 = (objc_class *)objc_opt_class();
  if (InstanceMethod == class_getInstanceMethod(v4, sel__accessibilityIsTouchContainer)) {
    return 0;
  }

  return [a1 _accessibilityIsTouchContainer];
}

- (uint64_t)accessibilityDatetimeValue
{
  return 0;
}

- (uint64_t)accessibilityVisibleText
{
  return 0;
}

- (uint64_t)accessibilityURL
{
  return 0;
}

- (uint64_t)_accessibilityWebAreaURL
{
  return 0;
}

- (uint64_t)accessibilitySpeechHint
{
  return 0;
}

- (uint64_t)_accessibilityLanguageOverriddesUser
{
  return 0;
}

- (id)_accessibilityString:()AXPrivCategory withSpeechHint:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  int v24 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v7 = (id)[objc_alloc(MEMORY[0x1E4F488F0]) initWithCFAttributedString:v5];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F488F0] axAttributedStringWithString:v5];
    }
  }
  uint64_t v8 = v7;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    uint64_t v13 = *MEMORY[0x1E4F1CFD0];
    uint64_t v14 = (void *)MEMORY[0x1E4F48A38];
    uint64_t v15 = (void *)MEMORY[0x1E4F48B00];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        char v18 = [v17 isEqualToString:@"spell-out"];
        long long v19 = v14;
        if ((v18 & 1) == 0)
        {
          char v20 = [v17 isEqualToString:@"digits"];
          long long v19 = v15;
          if ((v20 & 1) == 0)
          {
            char v21 = [v17 isEqualToString:@"literal-punctuation"];
            long long v19 = (void *)MEMORY[0x1E4F48B08];
            if ((v21 & 1) == 0)
            {
              int v22 = [v17 isEqualToString:@"no-punctuation"];
              long long v19 = (void *)MEMORY[0x1E4F48B10];
              if (!v22) {
                continue;
              }
            }
          }
        }
        [v8 setAttribute:v13 forKey:*v19];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  return v8;
}

- (uint64_t)_accessibilitySupportsSemanticContext
{
  return 1;
}

- (id)_accessibilitySemanticContext
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    char v3 = v1;
    while (1)
    {
      uint64_t v4 = [v3 _accessibilitySemanticContextForElement:v2];
      if (v4) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [MEMORY[0x1E4F42FF8] viewControllerForView:v3];
        id v6 = [v5 _accessibilitySemanticContextForElement:v2];

        if (v6) {
          goto LABEL_10;
        }
      }
      uint64_t v7 = [v3 accessibilityContainer];

      char v3 = (void *)v7;
      if (!v7) {
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    uint64_t v8 = (id *)MEMORY[0x1E4F43630];
    id v6 = [(id)*MEMORY[0x1E4F43630] _accessibilitySemanticContextForElement:v2];
    if (v6) {
      goto LABEL_11;
    }
    char v3 = [*v8 delegate];
    uint64_t v4 = [v3 _accessibilitySemanticContextForElement:v2];
  }
  id v6 = (void *)v4;
LABEL_10:

LABEL_11:

  return v6;
}

- (uint64_t)_accessibilitySemanticContextForElement:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityApplicationSemanticContext
{
  return 0;
}

+ (void)_accessibilitySetUnitTestingOrientation:()AXPrivCategory
{
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_UnitTestingOrientationStorageKey, v2, (void *)0x301);
}

+ (void)_accessibilityUnsetUnitTestingOrientation
{
}

+ (BOOL)_accessibilityHasUnitTestingOrientation
{
  id v1 = objc_getAssociatedObject(a1, &_UnitTestingOrientationStorageKey);
  BOOL v2 = v1 != 0;

  return v2;
}

+ (uint64_t)_accessibilityUnitTestingOrientation
{
  id v1 = objc_getAssociatedObject(a1, &_UnitTestingOrientationStorageKey);
  uint64_t v2 = [v1 integerValue];

  return v2;
}

- (id)_axSuperviews
{
  uint64_t v2 = [MEMORY[0x1E4F28E78] string];
  id v3 = a1;
  if (v3)
  {
    uint64_t v4 = v3;
    char v20 = v2;
    do
    {
      [v2 appendFormat:@"%@ [%p]", objc_opt_class(), v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = v4;
        id v6 = &stru_1EF1680E8;
        if (objc_opt_respondsToSelector())
        {
          uint64_t v7 = NSString;
          uint64_t v8 = [v5 delegate];
          uint64_t v9 = objc_opt_class();
          uint64_t v10 = [v5 delegate];
          id v6 = [v7 stringWithFormat:@"Delegate:[%@:%p] ", v9, v10];
        }
        uint64_t v11 = [MEMORY[0x1E4F42FF8] viewControllerForView:v5];
        uint64_t v23 = v6;
        if (v11)
        {
          char v21 = [NSString stringWithFormat:@"VC:[%@] ", v11];
        }
        else
        {
          char v21 = &stru_1EF1680E8;
        }
        unsigned int v22 = [v5 accessibilityIgnoresInvertColors];
        uint64_t v12 = [v5 layer];
        uint64_t v13 = [v12 filters];
        unsigned int v14 = objc_msgSend(v13, "ax_containsObjectUsingBlock:", &__block_literal_global_1892);
        uint64_t v15 = [v5 backgroundColor];
        int v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v19 = v14;
        uint64_t v2 = v20;
        [v20 appendFormat:@"[INV:%d(L:%d), BG:{%@}] %@%@ {%@}\n", v22, v19, v15, v21, v23, v16];
      }
      else
      {
        [v2 appendString:@"\n"];
      }
      uint64_t v17 = [v4 accessibilityContainer];

      uint64_t v4 = (void *)v17;
    }
    while (v17);
  }

  return v2;
}

- (id)_axDebugTraits
{
  [a1 accessibilityTraits];
  id v1 = (void *)_AXTraitsAsString();

  return v1;
}

- (uint64_t)_accessibilityRoadContainsTrackingPoint:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityMapDetailedInfoAtPoint:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityUpcomingRoadsForPoint:()AXPrivCategory forAngle:
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationCurrentRoadsWithAngles
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationCurrentLocation
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationCurrentIntersectionDescription
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationIncreaseVerbosity
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationDecreaseVerbosity
{
  return 0;
}

- (double)_accessibilityDistance:()AXPrivCategory forAngle:toRoad:
{
  return 0.0;
}

- (float)_accessibilityDistanceFromEndOfRoad:()AXPrivCategory forAngle:
{
  return -1.0;
}

- (uint64_t)_accessibilityMapFeatureType
{
  return 0;
}

- (uint64_t)accessibilityRequired
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v2 = [a1 safeValueForKey:@"_browserAccessibilityStoredValueIsRequired"];

  if (!v2) {
    return 0;
  }

  return [a1 safeBoolForKey:@"browserAccessibilityIsRequired"];
}

- (id)_accessibilitySupportedLanguages
{
  if (_accessibilitySupportedLanguages_onceToken != -1) {
    dispatch_once(&_accessibilitySupportedLanguages_onceToken, &__block_literal_global_1911);
  }
  id v0 = (void *)_accessibilitySupportedLanguages_Supported;

  return v0;
}

- (void)_accessibilitySetVoiceOverRTLOverride:()AXPrivCategory
{
  LocalDirectionModeValue = a3;
}

- (uint64_t)_accessibilityIsRTL
{
  uint64_t v2 = LocalDirectionModeValue;
  if (UIAccessibilityIsVoiceOverRunning() && v2) {
    return v2 == 1;
  }

  return [a1 _accessibilityHierarchyIsRTL];
}

- (BOOL)_accessibilityHierarchyIsRTL
{
  id v1 = [a1 _accessibilityParentView];
  BOOL v2 = [v1 effectiveUserInterfaceLayoutDirection] == 1;

  return v2;
}

- (BOOL)_accessibilityApplicationIsRTL
{
  return [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1;
}

- (uint64_t)_accessibilityRecentlyActivatedApplicationBundleIdentifiers
{
  return [MEMORY[0x1E4F1CAD0] set];
}

- (void)_accessibilityAnnouncementComplete:()AXPrivCategory
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = *MEMORY[0x1E4F433F0];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"String"];
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E4F433F8];
  id v5 = [v3 objectForKey:@"DidFinish"];

  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:*MEMORY[0x1E4F433E8] object:0 userInfo:v6];
}

- (uint64_t)_accessibilityIgnoreNextNotification:()AXPrivCategory
{
  return _UIAccessibilityIgnoreNextNotification(a3);
}

- (void)_accessibilityHandleATFocused:()AXPrivCategory assistiveTech:
{
  id v8 = a4;
  uint64_t v6 = objc_msgSend((id)__UIAccessibilityFocusedElements, "objectForKeyedSubscript:");
  uint64_t v7 = (void *)v6;
  if (a3)
  {
    if ((void *)v6 == a1) {
      goto LABEL_6;
    }
    _UIAccessibilitySetFocusedElement(a1, v8);
    [v7 accessibilityElementDidLoseFocus];
    _UIAccessibilityIsSettingFocus = 1;
    [a1 accessibilityElementDidBecomeFocused];
  }
  else
  {
    _UIAccessibilitySetFocusedElement(0, v8);
    [v7 accessibilityElementDidLoseFocus];
    a1 = 0;
  }
  [MEMORY[0x1E4FBA8A8] _accessibilityUpdateOpaqueFocusStateForTechnology:v8 oldElement:v7 newElement:a1];
LABEL_6:
  _UIAccessibilityIsSettingFocus = 0;
}

- (void)accessibilityPostNotification:()AXPrivCategory withObject:afterDelay:
{
  id v12 = a5;
  id v8 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v9 = [NSNumber numberWithInteger:a4];
  if (v12)
  {
    uint64_t v10 = objc_msgSend(v8, "arrayWithObjects:", v9, v12, 0);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v10 = objc_msgSend(v8, "arrayWithObjects:", v9, v11, 0);
  }
  [a1 performSelector:sel__accessibilityPostNotificationHelper_ withObject:v10 afterDelay:a2];
}

- (void)_accessibilityPostNotificationHelper:()AXPrivCategory
{
  id v3 = a3;
  uint64_t v4 = [v3 objectAtIndex:0];
  UIAccessibilityNotifications v5 = [v4 unsignedIntValue];

  id v8 = [v3 objectAtIndex:1];

  id v6 = [MEMORY[0x1E4F1CA98] null];
  if (v8 == v6) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v8;
  }
  UIAccessibilityPostNotification(v5, v7);
}

- (void)_accessibilityPostAnnouncement:()AXPrivCategory
{
}

- (void)_accessibilityIgnoreNextPostPasteboardTextOperation:()AXPrivCategory
{
}

- (void)_accessibilityPostPasteboardTextForOperation:()AXPrivCategory associatedObject:
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:*MEMORY[0x1E4F48D40]]) {
    UIAccessibilityPostNotification(UIAccessibilityPasteOperationOccurredNotification, 0);
  }
  if ([v5 isEqualToString:_Operation])
  {
    uint64_t v7 = (void *)_Operation;
    _Operatiouint64_t n = 0;
  }
  else
  {
    if (_accessibilityPostPasteboardTextForOperation_associatedObject__onceToken != -1) {
      dispatch_once(&_accessibilityPostPasteboardTextForOperation_associatedObject__onceToken, &__block_literal_global_1922);
    }
    id v8 = _accessibilityPostPasteboardTextForOperation_associatedObject__pasteBoardQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__NSObject_AXPrivCategory___accessibilityPostPasteboardTextForOperation_associatedObject___block_invoke_2;
    void v9[3] = &unk_1E59B8E58;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, v9);

    uint64_t v7 = v10;
  }
}

- (uint64_t)_accessibilityPostPasteboardTextForOperation:()AXPrivCategory
{
  return [a1 _accessibilityPostPasteboardTextForOperation:a3 associatedObject:0];
}

- (BOOL)_accessibilityShouldPerformIncrementOrDecrement
{
  uint64_t v1 = [a1 accessibilityTraits];
  return (*MEMORY[0x1E4F43528] & ~v1) != 0;
}

- (uint64_t)_accessibilityScannerShouldUseActivateInPointMode
{
  return 0;
}

- (uint64_t)_accessibilityShouldIncludeRemoteParentCustomActions
{
  return 1;
}

- (uint64_t)_accessibilityShouldIncludeRegionDescription
{
  return 1;
}

- (uint64_t)_accessibilityHasDragSources
{
  if (([a1 isAccessibilityElement] & 1) == 0
    && ([a1 _accessibilityIsGroupedParent] & 1) != 0)
  {
    return 0;
  }
  id v3 = [a1 _accessibilityParentView];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v2 = [v3 _accessibilityCanDrag];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)_accessibilityHasDragDestinations
{
  if (([a1 isAccessibilityElement] & 1) == 0
    && ([a1 _accessibilityIsGroupedParent] & 1) != 0)
  {
    return 0;
  }
  id v3 = [a1 _accessibilityParentView];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v2 = [v3 _accessibilityCanDrop];
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

- (BOOL)_accessibilityIsDraggableElementAttribute
{
  if (![a1 isAccessibilityElement]) {
    return 0;
  }
  BOOL v2 = 1;
  id v3 = [a1 _accessibilityFindAncestor:&__block_literal_global_1932 startWithSelf:1];
  if (!v3)
  {
    uint64_t v4 = [a1 _accessibilityFindDescendant:&__block_literal_global_1934];
    BOOL v2 = v4 != 0;
  }
  return v2;
}

- (uint64_t)_accessibilityCustomActionGroupIdentifier
{
  return 0;
}

- (uint64_t)accessibilityIsAttachmentElement
{
  return 0;
}

- (uint64_t)accessibilityIsMediaPlaying
{
  return 0;
}

- (uint64_t)_accessibilityRealtimeCompleted
{
  return 0;
}

- (uint64_t)_accessibilityRealtimeHasUnread
{
  return 0;
}

- (uint64_t)_accessibilityShouldIncludeParentCustomContent
{
  return 1;
}

- (uint64_t)_accessibilityShouldIncludeParentCustomActions
{
  return 1;
}

- (uint64_t)_accessibilityFilterInteractionLocationDescriptorsForVisible:()AXPrivCategory
{
  return [a3 axFilterObjectsUsingBlock:&__block_literal_global_1937];
}

- (id)_accessibilityAllDragSourceDescriptors
{
  uint64_t v1 = [a1 accessibilityDragSourceDescriptors];
  BOOL v2 = v1;
  if (!v1) {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v3 = v1;

  return v3;
}

- (uint64_t)_accessibilityDragSourceDescriptorAuxiliaryDictionary
{
  return 0;
}

- (id)_accessibilityDragSourceDescriptorDictionaryRepresentations
{
  BOOL v2 = [a1 _accessibilityAllDragSourceDescriptors];
  uint64_t v3 = [a1 accessibilityTraits];
  if ((*MEMORY[0x1E4F48DE8] & ~v3) != 0
    || ([a1 _accessibilityRemoteParent],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    uint64_t v5 = [a1 _accessibilityFilterInteractionLocationDescriptorsForVisible:v2];

    BOOL v2 = (void *)v5;
  }
  id v6 = [v2 axFilterObjectsUsingBlock:&__block_literal_global_1939];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__NSObject_AXPrivCategory___accessibilityDragSourceDescriptorDictionaryRepresentations__block_invoke_2;
  void v9[3] = &unk_1E59B9678;
  void v9[4] = a1;
  uint64_t v7 = [v6 axMapObjectsUsingBlock:v9];

  return v7;
}

- (id)_accessibilityAllDropPointDescriptors
{
  uint64_t v1 = [a1 accessibilityDropPointDescriptors];
  BOOL v2 = v1;
  if (!v1) {
    uint64_t v1 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v3 = v1;

  return v3;
}

- (uint64_t)_accessibilityDropPointDescriptorAuxiliaryDictionary
{
  return 0;
}

- (id)_accessibilityDropPointDescriptorDictionaryRepresentations
{
  BOOL v2 = [a1 _accessibilityAllDropPointDescriptors];
  id v3 = [a1 _accessibilityFilterInteractionLocationDescriptorsForVisible:v2];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __86__NSObject_AXPrivCategory___accessibilityDropPointDescriptorDictionaryRepresentations__block_invoke;
  v6[3] = &unk_1E59B9678;
  v6[4] = a1;
  uint64_t v4 = [v3 axMapObjectsUsingBlock:v6];

  return v4;
}

- (UIAccessibilityAddToDragSessionCustomAction)_accessibilityAddToDragSessionCustomAction
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "__accessibilitySupportsActivateAction"))
  {
    BOOL v2 = [a1 _accessibilityAllDragSourceDescriptors];
    id v3 = [a1 _accessibilityFilterInteractionLocationDescriptorsForVisible:v2];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = v3;
    uint64_t v5 = (UIAccessibilityAddToDragSessionCustomAction *)[v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (UIAccessibilityAddToDragSessionCustomAction *)((char *)i + 1))
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v9 = objc_msgSend(v8, "view", (void)v18);
          char v10 = [v9 _accessibilityCanAddItemsToDragSession];

          if (v10)
          {
            id v11 = [UIAccessibilityAddToDragSessionCustomAction alloc];
            [v8 point];
            double v13 = v12;
            double v15 = v14;
            int v16 = [v8 view];
            uint64_t v5 = -[UIAccessibilityAddToDragSessionCustomAction initWithPoint:inSourceView:](v11, "initWithPoint:inSourceView:", v16, v13, v15);

            goto LABEL_13;
          }
        }
        uint64_t v5 = (UIAccessibilityAddToDragSessionCustomAction *)[v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (uint64_t)_accessibilityUseContextlessPassthroughForDrag
{
  BOOL v2 = [a1 _accessibilityAllDragSourceDescriptors];
  uint64_t v3 = [v2 count];

  if (v3) {
    return 1;
  }
  uint64_t v5 = [a1 _accessibilityFindAncestor:&__block_literal_global_1943 startWithSelf:1];
  BOOL v4 = v5 != 0;

  return v4;
}

- (uint64_t)isAccessibilityUserDefinedScrollAncestor
{
  return [a1 _accessibilityValueForKey:@"_AX_IsScrollAncestor"];
}

- (uint64_t)accessibilityUserDefinedWindowVisible
{
  return [a1 _accessibilityValueForKey:@"_AX_WindowVisible"];
}

- (uint64_t)accessibilityUserDefinedIsMainWindow
{
  return [a1 _accessibilityValueForKey:@"_AX_WindowIsMain"];
}

- (uint64_t)accessibilityUserDefinedServesAsFirstElement
{
  return [a1 _accessibilityValueForKey:@"_AX_ServesAsFirstElement"];
}

- (uint64_t)accessibilityUserDefinedNotFirstElement
{
  return [a1 _accessibilityValueForKey:@"_AX_NotFirstElement"];
}

- (uint64_t)accessibilityUserDefinedSize
{
  return [a1 _accessibilityValueForKey:@"_AX_Size"];
}

- (id)accessibilityUserDefinedOpaqueElementScrollsContentIntoView
{
  return objc_getAssociatedObject(a1, &__NSObject__accessibilityUserDefinedOpaqueElementScrollsContentIntoView);
}

- (uint64_t)accessibilitySetUserDefinedOpaqueElementScrollsContentIntoView:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilityBaseScrollToVisible
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "Scrolling %{private}@ to visible...", v2, v3, v4, v5, v6);
}

- (void)_accessibilityIsSpeakThisElement
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_19F2DB000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ had speak this element property set: %i", v2, 0x12u);
}

- (void)_accessibilityChildrenForContinuityDisplay
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315651;
  __int16 v3 = "-[NSObject(AXPrivCategory) _accessibilityChildrenForContinuityDisplay]";
  OUTLINED_FUNCTION_1_0();
  __int16 v4 = 2113;
  uint64_t v5 = v0;
  _os_log_debug_impl(&dword_19F2DB000, v1, OS_LOG_TYPE_DEBUG, "%s: Returning {%@} children elements: %{private}@", (uint8_t *)&v2, 0x20u);
}

- (void)_accessibilityProcessChildrenForParameter:()AXPrivCategory .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19F2DB000, v0, v1, "Returning {%@} children elements: %{private}@");
}

- (void)_iosAccessibilityAttributeValue:()AXPrivCategory forParameter:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "Failed retrieving the NSRange for %{public}@", v2, v3, v4, v5, v6);
}

- (void)_iosAccessibilityAttributeValue:()AXPrivCategory forParameter:.cold.2(int a1, NSRange range)
{
  uint64_t v2 = NSStringFromRange(range);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v3, v4, "NSRange for text rects in %{public}@ was %{public}@", v5, v6, v7, v8, 2u);
}

- (void)_iosAccessibilityAttributeValue:()AXPrivCategory .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19F2DB000, v0, v1, "Could not archive: %@", v2, v3, v4, v5, v6);
}

- (void)_accessibilityStatusBar
{
  OUTLINED_FUNCTION_15();
  _os_log_fault_impl(&dword_19F2DB000, v0, OS_LOG_TYPE_FAULT, "Stop calling _accessibilityStatusBar (kAXStatusBarAttribute)", v1, 2u);
}

- (void)_accessibilityNextOpaqueElementsForTechnology:()AXPrivCategory startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:.cold.1(void *a1)
{
  uint64_t v1 = [a1 accessibilityLabel];
  OUTLINED_FUNCTION_12(&dword_19F2DB000, v2, v3, "Going with %{public}@ (%{public}@) from %{public}@", v4, v5, v6, v7, 2u);
}

- (void)_accessibilityNextOpaqueElementsForTechnology:()AXPrivCategory startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19F2DB000, v0, v1, "We did not find any ancestors for startElement=(%{public}@) so using self=(%{public}@) instead. This could be the results of reloading the currently selected element but otherwise a bug.");
}

- (void)_accessibilityNextOpaqueElementsForTechnology:()AXPrivCategory startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:.cold.3(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessibilityLabel];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_12(&dword_19F2DB000, v3, v4, "Asking for opaque element: %{public}@\nStart: %{public}@ (%{public}@)", v5, v6, v7, v8, 2u);
}

- (void)_accessibilityFindElementInDirection:()AXPrivCategory searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "Looking for leaf descendant in tree rooted at %{public}@", v2, v3, v4, v5, v6);
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "Child element was self, so using first opaque element: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "Updated container to %@.", v2, v3, v4, v5, v6);
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "Unable to find siblings of %@.", v2, v3, v4, v5, v6);
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19F2DB000, v0, v1, "Searching by header in %{public}@. Custom implementation result: %{public}@");
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.5()
{
  OUTLINED_FUNCTION_15();
  _os_log_fault_impl(&dword_19F2DB000, v0, OS_LOG_TYPE_FAULT, "Should only have attempted to search subtrees of an ordered container or opaque element provider (which must be a view).", v1, 2u);
}

- (void)_accessibilitySetAnimationsInProgress:()AXPrivCategory .cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1 & 1;
  __int16 v3 = 1024;
  int v4 = _AXAnimationsInProgressCount;
  _os_log_debug_impl(&dword_19F2DB000, a2, OS_LOG_TYPE_DEBUG, "Set animation in progress:%d - count: %d", (uint8_t *)v2, 0xEu);
}

- (void)_accessibilityReplaceCharactersAtCursor:()AXPrivCategory withString:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19F2DB000, v0, v1, "Attempted to replace text on object that was not first responder: %@", v2, v3, v4, v5, v6);
}

- (void)_accessibilityInsertText:()AXPrivCategory .cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19F2DB000, v0, v1, "Attempted to insert text on object that was not first responder: %@", v2, v3, v4, v5, v6);
}

@end