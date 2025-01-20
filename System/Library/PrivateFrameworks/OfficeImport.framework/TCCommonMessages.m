@interface TCCommonMessages
+ (void)initialize;
@end

@implementation TCCommonMessages

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_opt_class();
    v2 = [TCTaggedMessage alloc];
    uint64_t v3 = [(TCTaggedMessage *)v2 initWithMessageText:kErrorMessageOutOfMemory];
    v4 = (void *)TCOutOfMemoryMessage;
    TCOutOfMemoryMessage = v3;

    v5 = [TCTaggedMessage alloc];
    uint64_t v6 = [(TCTaggedMessage *)v5 initWithMessageText:kErrorMessageUnknown];
    v7 = (void *)TCUnknownProblemMessage;
    TCUnknownProblemMessage = v6;

    v8 = [TCTaggedMessage alloc];
    uint64_t v9 = [(TCTaggedMessage *)v8 initWithMessageText:kErrorMessageInvalid];
    v10 = (void *)TCInvalidFileFormatMessage;
    TCInvalidFileFormatMessage = v9;

    v11 = [TCTaggedMessage alloc];
    uint64_t v12 = [(TCTaggedMessage *)v11 initWithMessageText:kErrorMessageDecryptionFailed];
    v13 = (void *)TCDecryptionFailedMessage;
    TCDecryptionFailedMessage = v12;

    v14 = [TCTaggedMessage alloc];
    uint64_t v15 = [(TCTaggedMessage *)v14 initWithMessageText:kWarningMessageNoTrackChangesButBody];
    v16 = (void *)TCNoImportOfNonBodyTrackedChangesMsg;
    TCNoImportOfNonBodyTrackedChangesMsg = v15;

    v17 = [TCTaggedMessage alloc];
    uint64_t v18 = [(TCTaggedMessage *)v17 initWithMessageText:kWarningMessageChangedAndFiltersToOrFilters];
    v19 = (void *)TCChangedAndFiltersToOrFiltersMessage;
    TCChangedAndFiltersToOrFiltersMessage = v18;

    v20 = [TCTaggedMessage alloc];
    uint64_t v21 = [(TCTaggedMessage *)v20 initWithMessageText:kWarningMessageRemovedDurationFiltersAndConditionalHighlightings];
    v22 = (void *)TCRemovedDurationFiltersAndConditionalHighlightingsMessage;
    TCRemovedDurationFiltersAndConditionalHighlightingsMessage = v21;

    v23 = [TCTaggedMessage alloc];
    uint64_t v24 = [(TCTaggedMessage *)v23 initWithMessageText:kWarningMessageRTLNotFullySupported];
    v25 = (void *)TCExportRTLNotFullySupportedMessage;
    TCExportRTLNotFullySupportedMessage = v24;

    v26 = [TCTaggedMessage alloc];
    uint64_t v27 = [(TCTaggedMessage *)v26 initWithMessageText:kWarningMessageRemovedUnsupportedFormulas];
    v28 = (void *)TCRemovedUnsupportedFormulasMessage;
    TCRemovedUnsupportedFormulasMessage = v27;

    v29 = [TCTaggedMessage alloc];
    uint64_t v30 = [(TCTaggedMessage *)v29 initWithMessageText:kWarningMessageCSVExportFailureNoTables];
    v31 = (void *)TCExportDocumentHasNoTablesMessage;
    TCExportDocumentHasNoTablesMessage = v30;

    v32 = [TCTaggedMessage alloc];
    uint64_t v33 = [(TCTaggedMessage *)v32 initWithMessageText:kErrorMessageChartUnsupportedContent];
    v34 = (void *)TCChartUnsupportedContent;
    TCChartUnsupportedContent = v33;

    v35 = [TCTaggedMessage alloc];
    uint64_t v36 = [(TCTaggedMessage *)v35 initWithMessageText:kWarningMessageChartsInteractiveTypesDowngraded];
    v37 = (void *)TCChartsInteractiveTypesDowngradedMessage;
    TCChartsInteractiveTypesDowngradedMessage = v36;

    v38 = [TCTaggedMessage alloc];
    uint64_t v39 = [(TCTaggedMessage *)v38 initWithMessageText:kWarningMessageChartsBubbleReplacedWithScatter];
    v40 = (void *)TCChartsBubbleReplacedWithScatterMessage;
    TCChartsBubbleReplacedWithScatterMessage = v39;

    v41 = [TCTaggedMessage alloc];
    uint64_t v42 = [(TCTaggedMessage *)v41 initWithMessageText:kWarningMessageChartsReferenceLinesRemoved];
    v43 = (void *)TCChartsReferenceLinesRemovedMessage;
    TCChartsReferenceLinesRemovedMessage = v42;

    v44 = [TCTaggedMessage alloc];
    uint64_t v45 = [(TCTaggedMessage *)v44 initWithMessageText:kWarningMessageNoEmphasisBuilds];
    v46 = (void *)TCKeynoteRemovedBuild;
    TCKeynoteRemovedBuild = v45;
  }
}

@end