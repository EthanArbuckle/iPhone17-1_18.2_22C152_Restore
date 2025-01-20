@interface TCStringLocalizedMessages
+ (void)initialize;
@end

@implementation TCStringLocalizedMessages

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    TCBundle();
    id v86 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v86 localizedStringForKey:@"Out of memory." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v3 = (void *)kErrorMessageOutOfMemory;
    kErrorMessageOutOfMemory = v2;

    TCBundle();
    id v87 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v87 localizedStringForKey:@"An unknown error occurred." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v5 = (void *)kErrorMessageUnknown;
    kErrorMessageUnknown = v4;

    TCBundle();
    id v88 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v88 localizedStringForKey:@"The file format is invalid." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v7 = (void *)kErrorMessageInvalid;
    kErrorMessageInvalid = v6;

    TCBundle();
    id v89 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v89 localizedStringForKey:@"The spreadsheet has too many table cells." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v9 = (void *)kErrorMessageTooManyCells;
    kErrorMessageTooManyCells = v8;

    TCBundle();
    id v90 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v90 localizedStringForKey:@"Decryption failed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v11 = (void *)kErrorMessageDecryptionFailed;
    kErrorMessageDecryptionFailed = v10;

    TCBundle();
    id v91 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v91 localizedStringForKey:@"The document can\\U2019t be opened because it uses an unsupported method of encryption." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v13 = (void *)kErrorMessageUnsupportedEncryption;
    kErrorMessageUnsupportedEncryption = v12;

    TCBundle();
    id v92 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v92 localizedStringForKey:@"Charts of unsupported type or size were either imported as an image or removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v15 = (void *)kErrorMessageChartUnsupportedContent;
    kErrorMessageChartUnsupportedContent = v14;

    TCBundle();
    id v93 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v93 localizedStringForKey:@"Grouped wedges in pie charts were ungrouped." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v17 = (void *)kWarningMessageChartsGroupedPieWedgesUngrouped;
    kWarningMessageChartsGroupedPieWedgesUngrouped = v16;

    TCBundle();
    id v94 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = [v94 localizedStringForKey:@"Custom number formats were removed from charts." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v19 = (void *)kWarningMessageChartsCustomNumerFormatRemoved;
    kWarningMessageChartsCustomNumerFormatRemoved = v18;

    TCBundle();
    id v95 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [v95 localizedStringForKey:@"Interactive charts were converted to regular charts." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v21 = (void *)kWarningMessageChartsInteractiveTypesDowngraded;
    kWarningMessageChartsInteractiveTypesDowngraded = v20;

    TCBundle();
    id v96 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = [v96 localizedStringForKey:@"Bubble charts were converted to scatter charts." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v23 = (void *)kWarningMessageChartsBubbleReplacedWithScatter;
    kWarningMessageChartsBubbleReplacedWithScatter = v22;

    TCBundle();
    id v97 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v97 localizedStringForKey:@"Reference Lines were removed from charts." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v25 = (void *)kWarningMessageChartsReferenceLinesRemoved;
    kWarningMessageChartsReferenceLinesRemoved = v24;

    TCBundle();
    id v98 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = [v98 localizedStringForKey:@"Unsupported media were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v27 = (void *)kWarningMessageUnsupportedMediaTypes;
    kWarningMessageUnsupportedMediaTypes = v26;

    TCBundle();
    id v99 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v99 localizedStringForKey:@"Links to other Keynote files were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v29 = (void *)kWarningMessageNoKeynoteHyperlinks;
    kWarningMessageNoKeynoteHyperlinks = v28;

    TCBundle();
    id v100 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v100 localizedStringForKey:@"Image fills may be missing from shapes, charts, or other objects.", &stru_26EBF24D8, @"TCCompatibility" value table];
    v31 = (void *)kWarningMessageMissingFills;
    kWarningMessageMissingFills = v30;

    TCBundle();
    id v101 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v32 = [v101 localizedStringForKey:@"Image fills may be missing from shapes, charts, or other objects because you are not connected to the Internet.", &stru_26EBF24D8, @"TCCompatibility" value table];
    v33 = (void *)kWarningMessageMissingFillsBecauseNetworkNotReachable;
    kWarningMessageMissingFillsBecauseNetworkNotReachable = v32;

    TCBundle();
    id v102 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = [v102 localizedStringForKey:@"Rotation was removed from tables and charts." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v35 = (void *)kWarningMessageChartsAndTablesUnrotated;
    kWarningMessageChartsAndTablesUnrotated = v34;

    TCBundle();
    id v103 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = [v103 localizedStringForKey:@"Some movies may not play correctly. When exporting password-protected presentations to Keynote \\U201909, movies must be in .mov format.", &stru_26EBF24D8, @"TCCompatibility" value table];
    v37 = (void *)kWarningMessageMovieExportFailureLockedDocumentKeynote;
    kWarningMessageMovieExportFailureLockedDocumentKeynote = v36;

    TCBundle();
    id v104 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = [v104 localizedStringForKey:@"Some movies may not play correctly. When exporting password-protected spreadsheets to Numbers \\U201909, movies must be in .mov format.", &stru_26EBF24D8, @"TCCompatibility" value table];
    v39 = (void *)kWarningMessageMovieExportFailureLockedDocumentNumbers;
    kWarningMessageMovieExportFailureLockedDocumentNumbers = v38;

    TCBundle();
    id v105 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v40 = [v105 localizedStringForKey:@"Some movies may not play correctly. When exporting password-protected documents to Pages \\U201909, movies must be in .mov format.", &stru_26EBF24D8, @"TCCompatibility" value table];
    v41 = (void *)kWarningMessageMovieExportFailureLockedDocumentPages;
    kWarningMessageMovieExportFailureLockedDocumentPages = v40;

    TCBundle();
    id v106 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v42 = [v106 localizedStringForKey:@"Builds on master slides were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v43 = (void *)kWarningMessageNoBuildsOnMasters;
    kWarningMessageNoBuildsOnMasters = v42;

    TCBundle();
    id v107 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v44 = [v107 localizedStringForKey:@"Smart builds were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v45 = (void *)kWarningMessageNoSmartBuilds;
    kWarningMessageNoSmartBuilds = v44;

    TCBundle();
    id v108 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v46 = [v108 localizedStringForKey:@"Emphasis builds were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v47 = (void *)kWarningMessageNoEmphasisBuilds;
    kWarningMessageNoEmphasisBuilds = v46;

    TCBundle();
    id v109 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = [v109 localizedStringForKey:@"Change tracking is only supported for body text. Other tracked changes were accepted as final." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v49 = (void *)kWarningMessageNoTrackChangesButBody;
    kWarningMessageNoTrackChangesButBody = v48;

    TCBundle();
    id v110 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v50 = [v110 localizedStringForKey:@"Unsupported formulas were replaced by the last calculated value." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v51 = (void *)kWarningMessageUnsupportedFormulas;
    kWarningMessageUnsupportedFormulas = v50;

    TCBundle();
    id v111 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v52 = [v111 localizedStringForKey:@"Table categories were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v53 = (void *)kWarningMessageNoCategories;
    kWarningMessageNoCategories = v52;

    TCBundle();
    id v112 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v54 = [v112 localizedStringForKey:@"Unsupported conditional highlighting rules were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v55 = (void *)kWarningMessageNoConditionalFormats;
    kWarningMessageNoConditionalFormats = v54;

    TCBundle();
    id v113 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v56 = [v113 localizedStringForKey:@"Table fills were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v57 = (void *)kWarningMessageNoTableImageFill;
    kWarningMessageNoTableImageFill = v56;

    TCBundle();
    id v114 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v58 = [v114 localizedStringForKey:@"Pop-up menu cells with more than 250 list items were converted to text cells." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v59 = (void *)kWarningMessageTooManyPopupOptionsSomeDropped;
    kWarningMessageTooManyPopupOptionsSomeDropped = v58;

    TCBundle();
    id v115 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v60 = [v115 localizedStringForKey:@"Some AND filters were changed to OR." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v61 = (void *)kWarningMessageChangedAndFiltersToOrFilters;
    kWarningMessageChangedAndFiltersToOrFilters = v60;

    TCBundle();
    id v116 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v62 = [v116 localizedStringForKey:@"Duration-based filters and conditional highlights were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v63 = (void *)kWarningMessageRemovedDurationFiltersAndConditionalHighlightings;
    kWarningMessageRemovedDurationFiltersAndConditionalHighlightings = v62;

    TCBundle();
    id v117 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v64 = [v117 localizedStringForKey:@"Right-to-left text isn\\U2019t fully supported in iWork \\U201909." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v65 = (void *)kWarningMessageRTLNotFullySupported;
    kWarningMessageRTLNotFullySupported = v64;

    TCBundle();
    id v118 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v66 = [v118 localizedStringForKey:@"Unsupported formulas were removed. The last calculated values were exported." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v67 = (void *)kWarningMessageRemovedUnsupportedFormulas;
    kWarningMessageRemovedUnsupportedFormulas = v66;

    TCBundle();
    id v119 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v68 = [v119 localizedStringForKey:@"No tables" value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v69 = (void *)kWarningMessageCSVExportFailureNoTables;
    kWarningMessageCSVExportFailureNoTables = v68;

    TCBundle();
    id v120 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v70 = [v120 localizedStringForKey:@"Numbers creates a CSV file for each table in your spreadsheet." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v71 = (void *)kWarningMessageCSVExportFailureNoTablesAdditionalInfo;
    kWarningMessageCSVExportFailureNoTablesAdditionalInfo = v70;

    TCBundle();
    id v121 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v72 = [v121 localizedStringForKey:@"Charts in headers and footers were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v73 = (void *)kWarningMessagePagesChartsInHeaderFooterNotSupported;
    kWarningMessagePagesChartsInHeaderFooterNotSupported = v72;

    TCBundle();
    id v122 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v74 = [v122 localizedStringForKey:@"Tables in headers and footers were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v75 = (void *)kWarningMessagePagesTablesInHeaderFooterNotSupported;
    kWarningMessagePagesTablesInHeaderFooterNotSupported = v74;

    TCBundle();
    id v123 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v76 = [v123 localizedStringForKey:@"Objects in headers and footers were removed." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v77 = (void *)kWarningMessagePagesObjectsInHeaderFooterNotSupported;
    kWarningMessagePagesObjectsInHeaderFooterNotSupported = v76;

    TCBundle();
    id v124 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v78 = [v124 localizedStringForKey:@"Inline objects that cause text wrap were removed from headers and footers." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v79 = (void *)kWarningMessagePagesObjectsWithWrapInHeaderFooterNotSupported;
    kWarningMessagePagesObjectsWithWrapInHeaderFooterNotSupported = v78;

    TCBundle();
    id v125 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v80 = [v125 localizedStringForKey:@"Outline view isn\\U2019t supported. Your document will appear as a regular word processing document." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v81 = (void *)kWarningMessagePagesOutlineViewNotSupported;
    kWarningMessagePagesOutlineViewNotSupported = v80;

    TCBundle();
    id v126 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v82 = [v126 localizedStringForKey:@"Mail merge isn\\U2019t supported. Merge fields were converted to text." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v83 = (void *)kWarningMessagePagesMailMergeNotSupported;
    kWarningMessagePagesMailMergeNotSupported = v82;

    TCBundle();
    id v127 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v84 = [v127 localizedStringForKey:@"The font %@ is missing. Your text might look different." value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v85 = (void *)kWarningMessageFontReplaced;
    kWarningMessageFontReplaced = v84;
  }
}

@end