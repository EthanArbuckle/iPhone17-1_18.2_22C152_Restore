@interface TCStringLocalizedMessages
+ (void)initialize;
@end

@implementation TCStringLocalizedMessages

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kErrorMessageOutOfMemory = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Out of memory." value:&stru_46D7E8 table:@"TCCompatibility"];
    kErrorMessageUnknown = (uint64_t)[(id)TCBundle() localizedStringForKey:@"An unknown error occurred." value:&stru_46D7E8 table:@"TCCompatibility"];
    kErrorMessageInvalid = (uint64_t)[(id)TCBundle() localizedStringForKey:@"The file format is invalid." value:&stru_46D7E8 table:@"TCCompatibility"];
    kErrorMessageTooManyCells = (uint64_t)[(id)TCBundle() localizedStringForKey:@"The spreadsheet has too many table cells." value:&stru_46D7E8 table:@"TCCompatibility"];
    kErrorMessageDecryptionFailed = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Decryption failed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kErrorMessageUnsupportedEncryption = (uint64_t)[(id)TCBundle() localizedStringForKey:@"The document can\\U2019t be opened because it uses an unsupported method of encryption." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageChartsGroupedPieWedgesUngrouped = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Grouped wedges in pie charts were ungrouped." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageChartsCustomNumerFormatRemoved = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Custom number formats were removed from charts." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageChartsInteractiveTypesDowngraded = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Interactive charts were converted to regular charts." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageChartsBubbleReplacedWithScatter = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Bubble charts were converted to scatter charts." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageUnsupportedMediaTypes = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Unsupported media were removed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageNoKeynoteHyperlinks = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Links to other Keynote files were removed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageUndisplayableMedia = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Some media won\\U2019t display on iOS." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageMissingFills = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Image fills may be missing from shapes, charts, or other objects.", &stru_46D7E8, @"TCCompatibility" value table];
    kWarningMessageMissingFillsBecauseNetworkNotReachable = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Image fills may be missing from shapes, charts, or other objects because you are not connected to the Internet.", &stru_46D7E8, @"TCCompatibility" value table];
    kWarningMessageMissingImagesBecauseUserCancelledDownload = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Placeholder images are missing because they weren\\U2019t downloaded." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageMissingImagesBecauseNetworkNotReachable = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Placeholder images are missing because your iOS device isn\\U2019t connected to the Internet." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageMissingImagesBecauseOfDownloadError = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Placeholder images are missing because they couldn\\U2019t be downloaded." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageMovieExportFailureLockedDocumentKeynote = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Some movies may not play correctly. When exporting password-protected presentations to Keynote \\U201909, movies must be in .mov format.", &stru_46D7E8, @"TCCompatibility" value table];
    kWarningMessageMovieExportFailureLockedDocumentNumbers = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Some movies may not play correctly. When exporting password-protected spreadsheets to Numbers \\U201909, movies must be in .mov format.", &stru_46D7E8, @"TCCompatibility" value table];
    kWarningMessageMovieExportFailureLockedDocumentPages = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Some movies may not play correctly. When exporting password-protected documents to Pages \\U201909, movies must be in .mov format.", &stru_46D7E8, @"TCCompatibility" value table];
    kWarningMessageNoBuildsOnMasters = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Builds on master slides were removed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageNoSmartBuilds = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Smart builds were removed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageNoEmphasisBuilds = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Emphasis builds were removed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageNoTrackChangesButBody = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Change tracking is only supported for body text. Other tracked changes were accepted as final." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageUnsupportedFormulas = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Unsupported formulas were removed. The last calculated values were imported." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageNoCategories = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Table categories were removed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageNoConditionalFormats = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Unsupported conditional formats were removed from table cells." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageNoTableImageFill = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Table fills were removed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageTooManyStrokesSomeDropped = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Some cell borders were removed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageTooManyPopupOptionsSomeDropped = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Pop-up menu cells with more than 250 list items were converted to text cells." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageChangedAndFiltersToOrFilters = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Some AND filters were changed to OR." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageRemovedDurationFiltersAndConditionalHighlightings = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Duration-based filters and conditional highlights were removed." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageRTLNotFullySupported = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Right-to-left text isn\\U2019t fully supported in iWork \\U201909." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageRemovedUnsupportedFormulas = (uint64_t)[(id)TCBundle() localizedStringForKey:@"Unsupported formulas were removed. The last calculated values were exported." value:&stru_46D7E8 table:@"TCCompatibility"];
    kWarningMessageFontReplaced = (uint64_t)[(id)TCBundle() localizedStringForKey:@"The font %@ isn’t available on iOS. It was replaced with %@." value:&stru_46D7E8 table:@"TCCompatibility"];
  }
}

@end