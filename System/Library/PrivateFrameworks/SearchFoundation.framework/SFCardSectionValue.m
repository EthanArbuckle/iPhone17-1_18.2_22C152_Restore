@interface SFCardSectionValue
+ (BOOL)supportsSecureCoding;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (RFBinaryButtonCardSection)rfBinaryButtonCardSection;
- (RFButtonCardSection)rfButtonCardSection;
- (RFDisambiguationTitleCardSection)rfDisambiguationTitleCardSection;
- (RFExpandableStandardCardSection)rfExpandableStandardCardSection;
- (RFFactItemButtonCardSection)rfFactItemButtonCardSection;
- (RFFactItemDetailedNumberCardSection)rfFactItemDetailedNumberCardSection;
- (RFFactItemHeroButtonCardSection)rfFactItemHeroButtonCardSection;
- (RFFactItemHeroNumberCardSection)rfFactItemHeroNumberCardSection;
- (RFFactItemImageRightCardSection)rfFactItemImageRightCardSection;
- (RFFactItemShortHeroNumberCardSection)rfFactItemShortHeroNumberCardSection;
- (RFFactItemShortNumberCardSection)rfFactItemShortNumberCardSection;
- (RFFactItemStandardCardSection)rfFactItemStandardCardSection;
- (RFLongItemStandardCardSection)rfLongItemStandardCardSection;
- (RFMapCardSection)rfMapCardSection;
- (RFMultiButtonCardSection)rfMultiButtonCardSection;
- (RFPrimaryHeaderMarqueeCardSection)rfPrimaryHeaderMarqueeCardSection;
- (RFPrimaryHeaderRichCardSection)rfPrimaryHeaderRichCardSection;
- (RFPrimaryHeaderStackedImageCardSection)rfPrimaryHeaderStackedImageCardSection;
- (RFPrimaryHeaderStandardCardSection)rfPrimaryHeaderStandardCardSection;
- (RFReferenceCenteredCardSection)rfReferenceCenteredCardSection;
- (RFReferenceFootnoteCardSection)rfReferenceFootnoteCardSection;
- (RFReferenceItemButtonCardSection)rfReferenceItemButtonCardSection;
- (RFReferenceItemLogoCardSection)rfReferenceItemLogoCardSection;
- (RFReferenceRichCardSection)rfReferenceRichCardSection;
- (RFReferenceStandardCardSection)rfReferenceStandardCardSection;
- (RFSecondaryHeaderEmphasizedCardSection)rfSecondaryHeaderEmphasizedCardSection;
- (RFSecondaryHeaderStandardCardSection)rfSecondaryHeaderStandardCardSection;
- (RFSimpleItemPlayerCardSection)rfSimpleItemPlayerCardSection;
- (RFSimpleItemReverseRichCardSection)rfSimpleItemReverseRichCardSection;
- (RFSimpleItemRichCardSection)rfSimpleItemRichCardSection;
- (RFSimpleItemRichSearchResultCardSection)rfSimpleItemRichSearchResultCardSection;
- (RFSimpleItemStandardCardSection)rfSimpleItemStandardCardSection;
- (RFSimpleItemVisualElementCardSection)rfSimpleItemVisualElementCardSection;
- (RFSummaryItemAlignedTextCardSection)rfSummaryItemAlignedTextCardSection;
- (RFSummaryItemButtonCardSection)rfSummaryItemButtonCardSection;
- (RFSummaryItemDetailedTextCardSection)rfSummaryItemDetailedTextCardSection;
- (RFSummaryItemImageRightCardSection)rfSummaryItemImageRightCardSection;
- (RFSummaryItemPairCardSection)rfSummaryItemPairCardSection;
- (RFSummaryItemPairNumberCardSection)rfSummaryItemPairNumberCardSection;
- (RFSummaryItemPlayerCardSection)rfSummaryItemPlayerCardSection;
- (RFSummaryItemShortNumberCardSection)rfSummaryItemShortNumberCardSection;
- (RFSummaryItemStandardCardSection)rfSummaryItemStandardCardSection;
- (RFSummaryItemSwitchV2CardSection)rfSummaryItemSwitchV2CardSection;
- (RFSummaryItemTextCardSection)rfSummaryItemTextCardSection;
- (RFTableHeaderCardSection)rfTableHeaderCardSection;
- (RFTableRowCardSection)rfTableRowCardSection;
- (SFActivityIndicatorCardSection)activityIndicatorCardSection;
- (SFAppIconCardSection)appIconCardSection;
- (SFAppLinkCardSection)appLinkCardSection;
- (SFArchiveViewCardSection)archiveViewCardSection;
- (SFAttributionFooterCardSection)attributionFooterCardSection;
- (SFAudioPlaybackCardSection)audioPlaybackCardSection;
- (SFButtonCardSection)buttonCardSection;
- (SFButtonListCardSection)buttonListCardSection;
- (SFCardSectionValue)initWithCoder:(id)a3;
- (SFCardSectionValue)initWithProtobuf:(id)a3;
- (SFCollectionCardSection)collectionCardSection;
- (SFColorBarCardSection)colorBarCardSection;
- (SFCombinedCardSection)combinedCardSection;
- (SFCommandRowCardSection)commandRowCardSection;
- (SFCompactRowCardSection)compactRowCardSection;
- (SFDescriptionCardSection)descriptionCardSection;
- (SFDetailedRowCardSection)detailedRowCardSection;
- (SFFindMyCardSection)findMyCardSection;
- (SFFlightCardSection)flightCardSection;
- (SFGridCardSection)gridCardSection;
- (SFHeroCardSection)heroCardSection;
- (SFHeroTitleCardSection)heroTitleCardSection;
- (SFHorizontalButtonCardSection)horizontalButtonCardSection;
- (SFHorizontalScrollCardSection)horizontalScrollCardSection;
- (SFImagesCardSection)imagesCardSection;
- (SFInfoCardSection)infoCardSection;
- (SFKeyValueDataCardSection)keyValueDataCardSection;
- (SFLargeTitleDetailedRowCardSection)largeTitleDetailedRowCardSection;
- (SFLeadingTrailingCardSection)leadingTrailingCardSection;
- (SFLinkPresentationCardSection)linkPresentationCardSection;
- (SFListenToCardSection)listenToCardSection;
- (SFMapCardSection)mapCardSection;
- (SFMapPlaceCardSection)mapPlaceCardSection;
- (SFMapsDetailedRowCardSection)mapsDetailedRowCardSection;
- (SFMediaInfoCardSection)mediaInfoCardSection;
- (SFMediaPlayerCardSection)mediaPlayerCardSection;
- (SFMediaRemoteControlCardSection)mediaRemoteControlCardSection;
- (SFMessageCardSection)messageCardSection;
- (SFMetaInfoCardSection)metaInfoCardSection;
- (SFMiniCardSection)miniCardSection;
- (SFNewsCardSection)newsCardSection;
- (SFNowPlayingCardSection)nowPlayingCardSection;
- (SFPersonHeaderCardSection)personHeaderCardSection;
- (SFProductCardSection)productCardSection;
- (SFResponseWrapperCardSection)responseWrapperCardSection;
- (SFRichTitleCardSection)richTitleCardSection;
- (SFRowCardSection)rowCardSection;
- (SFSafariTableOfContentsCardSection)safariTableOfContentsCardSection;
- (SFScoreboardCardSection)scoreboardCardSection;
- (SFSectionHeaderCardSection)sectionHeaderCardSection;
- (SFSelectableGridCardSection)selectableGridCardSection;
- (SFSocialMediaPostCardSection)socialMediaPostCardSection;
- (SFSplitCardSection)splitCardSection;
- (SFStockChartCardSection)stockChartCardSection;
- (SFStrokeAnimationCardSection)strokeAnimationCardSection;
- (SFSuggestionCardSection)suggestionCardSection;
- (SFTableHeaderRowCardSection)tableHeaderRowCardSection;
- (SFTableRowCardSection)tableRowCardSection;
- (SFTextColumnsCardSection)textColumnsCardSection;
- (SFTitleCardSection)titleCardSection;
- (SFTrackListCardSection)trackListCardSection;
- (SFVerticalLayoutCardSection)verticalLayoutCardSection;
- (SFWatchListCardSection)watchListCardSection;
- (SFWatchNowCardSection)watchNowCardSection;
- (SFWebCardSection)webCardSection;
- (SFWorldMapCardSection)worldMapCardSection;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityIndicatorCardSection:(id)a3;
- (void)setAppIconCardSection:(id)a3;
- (void)setAppLinkCardSection:(id)a3;
- (void)setArchiveViewCardSection:(id)a3;
- (void)setAttributionFooterCardSection:(id)a3;
- (void)setAudioPlaybackCardSection:(id)a3;
- (void)setButtonCardSection:(id)a3;
- (void)setButtonListCardSection:(id)a3;
- (void)setCollectionCardSection:(id)a3;
- (void)setColorBarCardSection:(id)a3;
- (void)setCombinedCardSection:(id)a3;
- (void)setCommandRowCardSection:(id)a3;
- (void)setCompactRowCardSection:(id)a3;
- (void)setDescriptionCardSection:(id)a3;
- (void)setDetailedRowCardSection:(id)a3;
- (void)setFindMyCardSection:(id)a3;
- (void)setFlightCardSection:(id)a3;
- (void)setGridCardSection:(id)a3;
- (void)setHeroCardSection:(id)a3;
- (void)setHeroTitleCardSection:(id)a3;
- (void)setHorizontalButtonCardSection:(id)a3;
- (void)setHorizontalScrollCardSection:(id)a3;
- (void)setImagesCardSection:(id)a3;
- (void)setInfoCardSection:(id)a3;
- (void)setKeyValueDataCardSection:(id)a3;
- (void)setLargeTitleDetailedRowCardSection:(id)a3;
- (void)setLeadingTrailingCardSection:(id)a3;
- (void)setLinkPresentationCardSection:(id)a3;
- (void)setListenToCardSection:(id)a3;
- (void)setMapCardSection:(id)a3;
- (void)setMapPlaceCardSection:(id)a3;
- (void)setMapsDetailedRowCardSection:(id)a3;
- (void)setMediaInfoCardSection:(id)a3;
- (void)setMediaPlayerCardSection:(id)a3;
- (void)setMediaRemoteControlCardSection:(id)a3;
- (void)setMessageCardSection:(id)a3;
- (void)setMetaInfoCardSection:(id)a3;
- (void)setMiniCardSection:(id)a3;
- (void)setNewsCardSection:(id)a3;
- (void)setNowPlayingCardSection:(id)a3;
- (void)setPersonHeaderCardSection:(id)a3;
- (void)setProductCardSection:(id)a3;
- (void)setResponseWrapperCardSection:(id)a3;
- (void)setRfBinaryButtonCardSection:(id)a3;
- (void)setRfButtonCardSection:(id)a3;
- (void)setRfDisambiguationTitleCardSection:(id)a3;
- (void)setRfExpandableStandardCardSection:(id)a3;
- (void)setRfFactItemButtonCardSection:(id)a3;
- (void)setRfFactItemDetailedNumberCardSection:(id)a3;
- (void)setRfFactItemHeroButtonCardSection:(id)a3;
- (void)setRfFactItemHeroNumberCardSection:(id)a3;
- (void)setRfFactItemImageRightCardSection:(id)a3;
- (void)setRfFactItemShortHeroNumberCardSection:(id)a3;
- (void)setRfFactItemShortNumberCardSection:(id)a3;
- (void)setRfFactItemStandardCardSection:(id)a3;
- (void)setRfLongItemStandardCardSection:(id)a3;
- (void)setRfMapCardSection:(id)a3;
- (void)setRfMultiButtonCardSection:(id)a3;
- (void)setRfPrimaryHeaderMarqueeCardSection:(id)a3;
- (void)setRfPrimaryHeaderRichCardSection:(id)a3;
- (void)setRfPrimaryHeaderStackedImageCardSection:(id)a3;
- (void)setRfPrimaryHeaderStandardCardSection:(id)a3;
- (void)setRfReferenceCenteredCardSection:(id)a3;
- (void)setRfReferenceFootnoteCardSection:(id)a3;
- (void)setRfReferenceItemButtonCardSection:(id)a3;
- (void)setRfReferenceItemLogoCardSection:(id)a3;
- (void)setRfReferenceRichCardSection:(id)a3;
- (void)setRfReferenceStandardCardSection:(id)a3;
- (void)setRfSecondaryHeaderEmphasizedCardSection:(id)a3;
- (void)setRfSecondaryHeaderStandardCardSection:(id)a3;
- (void)setRfSimpleItemPlayerCardSection:(id)a3;
- (void)setRfSimpleItemReverseRichCardSection:(id)a3;
- (void)setRfSimpleItemRichCardSection:(id)a3;
- (void)setRfSimpleItemRichSearchResultCardSection:(id)a3;
- (void)setRfSimpleItemStandardCardSection:(id)a3;
- (void)setRfSimpleItemVisualElementCardSection:(id)a3;
- (void)setRfSummaryItemAlignedTextCardSection:(id)a3;
- (void)setRfSummaryItemButtonCardSection:(id)a3;
- (void)setRfSummaryItemDetailedTextCardSection:(id)a3;
- (void)setRfSummaryItemImageRightCardSection:(id)a3;
- (void)setRfSummaryItemPairCardSection:(id)a3;
- (void)setRfSummaryItemPairNumberCardSection:(id)a3;
- (void)setRfSummaryItemPlayerCardSection:(id)a3;
- (void)setRfSummaryItemShortNumberCardSection:(id)a3;
- (void)setRfSummaryItemStandardCardSection:(id)a3;
- (void)setRfSummaryItemSwitchV2CardSection:(id)a3;
- (void)setRfSummaryItemTextCardSection:(id)a3;
- (void)setRfTableHeaderCardSection:(id)a3;
- (void)setRfTableRowCardSection:(id)a3;
- (void)setRichTitleCardSection:(id)a3;
- (void)setRowCardSection:(id)a3;
- (void)setSafariTableOfContentsCardSection:(id)a3;
- (void)setScoreboardCardSection:(id)a3;
- (void)setSectionHeaderCardSection:(id)a3;
- (void)setSelectableGridCardSection:(id)a3;
- (void)setSocialMediaPostCardSection:(id)a3;
- (void)setSplitCardSection:(id)a3;
- (void)setStockChartCardSection:(id)a3;
- (void)setStrokeAnimationCardSection:(id)a3;
- (void)setSuggestionCardSection:(id)a3;
- (void)setTableHeaderRowCardSection:(id)a3;
- (void)setTableRowCardSection:(id)a3;
- (void)setTextColumnsCardSection:(id)a3;
- (void)setTitleCardSection:(id)a3;
- (void)setTrackListCardSection:(id)a3;
- (void)setVerticalLayoutCardSection:(id)a3;
- (void)setWatchListCardSection:(id)a3;
- (void)setWatchNowCardSection:(id)a3;
- (void)setWebCardSection:(id)a3;
- (void)setWorldMapCardSection:(id)a3;
@end

@implementation SFCardSectionValue

- (SFCardSectionValue)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v448.receiver = self;
  v448.super_class = (Class)SFCardSectionValue;
  v5 = [(SFCardSectionValue *)&v448 init];

  if (v5)
  {
    v6 = [v4 appLinkCardSection];

    if (v6)
    {
      v7 = [SFAppLinkCardSection alloc];
      v8 = [v4 appLinkCardSection];
      v9 = [(SFAppLinkCardSection *)v7 initWithProtobuf:v8];
      [(SFCardSectionValue *)v5 setAppLinkCardSection:v9];
    }
    v10 = [v4 descriptionCardSection];

    if (v10)
    {
      v11 = [SFDescriptionCardSection alloc];
      v12 = [v4 descriptionCardSection];
      v13 = [(SFDescriptionCardSection *)v11 initWithProtobuf:v12];
      [(SFCardSectionValue *)v5 setDescriptionCardSection:v13];
    }
    v14 = [v4 keyValueDataCardSection];

    if (v14)
    {
      v15 = [SFKeyValueDataCardSection alloc];
      v16 = [v4 keyValueDataCardSection];
      v17 = [(SFKeyValueDataCardSection *)v15 initWithProtobuf:v16];
      [(SFCardSectionValue *)v5 setKeyValueDataCardSection:v17];
    }
    v18 = [v4 mapCardSection];

    if (v18)
    {
      v19 = [SFMapCardSection alloc];
      v20 = [v4 mapCardSection];
      v21 = [(SFMapCardSection *)v19 initWithProtobuf:v20];
      [(SFCardSectionValue *)v5 setMapCardSection:v21];
    }
    v22 = [v4 mediaInfoCardSection];

    if (v22)
    {
      v23 = [SFMediaInfoCardSection alloc];
      v24 = [v4 mediaInfoCardSection];
      v25 = [(SFMediaInfoCardSection *)v23 initWithProtobuf:v24];
      [(SFCardSectionValue *)v5 setMediaInfoCardSection:v25];
    }
    v26 = [v4 mediaPlayerCardSection];

    if (v26)
    {
      v27 = [SFMediaPlayerCardSection alloc];
      v28 = [v4 mediaPlayerCardSection];
      v29 = [(SFMediaPlayerCardSection *)v27 initWithProtobuf:v28];
      [(SFCardSectionValue *)v5 setMediaPlayerCardSection:v29];
    }
    v30 = [v4 nowPlayingCardSection];

    if (v30)
    {
      v31 = [SFNowPlayingCardSection alloc];
      v32 = [v4 nowPlayingCardSection];
      v33 = [(SFNowPlayingCardSection *)v31 initWithProtobuf:v32];
      [(SFCardSectionValue *)v5 setNowPlayingCardSection:v33];
    }
    v34 = [v4 richTitleCardSection];

    if (v34)
    {
      v35 = [SFRichTitleCardSection alloc];
      v36 = [v4 richTitleCardSection];
      v37 = [(SFRichTitleCardSection *)v35 initWithProtobuf:v36];
      [(SFCardSectionValue *)v5 setRichTitleCardSection:v37];
    }
    v38 = [v4 rowCardSection];

    if (v38)
    {
      v39 = [SFRowCardSection alloc];
      v40 = [v4 rowCardSection];
      v41 = [(SFRowCardSection *)v39 initWithProtobuf:v40];
      [(SFCardSectionValue *)v5 setRowCardSection:v41];
    }
    v42 = [v4 scoreboardCardSection];

    if (v42)
    {
      v43 = [SFScoreboardCardSection alloc];
      v44 = [v4 scoreboardCardSection];
      v45 = [(SFScoreboardCardSection *)v43 initWithProtobuf:v44];
      [(SFCardSectionValue *)v5 setScoreboardCardSection:v45];
    }
    v46 = [v4 socialMediaPostCardSection];

    if (v46)
    {
      v47 = [SFSocialMediaPostCardSection alloc];
      v48 = [v4 socialMediaPostCardSection];
      v49 = [(SFSocialMediaPostCardSection *)v47 initWithProtobuf:v48];
      [(SFCardSectionValue *)v5 setSocialMediaPostCardSection:v49];
    }
    v50 = [v4 stockChartCardSection];

    if (v50)
    {
      v51 = [SFStockChartCardSection alloc];
      v52 = [v4 stockChartCardSection];
      v53 = [(SFStockChartCardSection *)v51 initWithProtobuf:v52];
      [(SFCardSectionValue *)v5 setStockChartCardSection:v53];
    }
    v54 = [v4 tableHeaderRowCardSection];

    if (v54)
    {
      v55 = [SFTableHeaderRowCardSection alloc];
      v56 = [v4 tableHeaderRowCardSection];
      v57 = [(SFTableHeaderRowCardSection *)v55 initWithProtobuf:v56];
      [(SFCardSectionValue *)v5 setTableHeaderRowCardSection:v57];
    }
    v58 = [v4 tableRowCardSection];

    if (v58)
    {
      v59 = [SFTableRowCardSection alloc];
      v60 = [v4 tableRowCardSection];
      v61 = [(SFTableRowCardSection *)v59 initWithProtobuf:v60];
      [(SFCardSectionValue *)v5 setTableRowCardSection:v61];
    }
    v62 = [v4 textColumnsCardSection];

    if (v62)
    {
      v63 = [SFTextColumnsCardSection alloc];
      v64 = [v4 textColumnsCardSection];
      v65 = [(SFTextColumnsCardSection *)v63 initWithProtobuf:v64];
      [(SFCardSectionValue *)v5 setTextColumnsCardSection:v65];
    }
    v66 = [v4 titleCardSection];

    if (v66)
    {
      v67 = [SFTitleCardSection alloc];
      v68 = [v4 titleCardSection];
      v69 = [(SFTitleCardSection *)v67 initWithProtobuf:v68];
      [(SFCardSectionValue *)v5 setTitleCardSection:v69];
    }
    v70 = [v4 trackListCardSection];

    if (v70)
    {
      v71 = [SFTrackListCardSection alloc];
      v72 = [v4 trackListCardSection];
      v73 = [(SFTrackListCardSection *)v71 initWithProtobuf:v72];
      [(SFCardSectionValue *)v5 setTrackListCardSection:v73];
    }
    v74 = [v4 audioPlaybackCardSection];

    if (v74)
    {
      v75 = [SFAudioPlaybackCardSection alloc];
      v76 = [v4 audioPlaybackCardSection];
      v77 = [(SFAudioPlaybackCardSection *)v75 initWithProtobuf:v76];
      [(SFCardSectionValue *)v5 setAudioPlaybackCardSection:v77];
    }
    v78 = [v4 flightCardSection];

    if (v78)
    {
      v79 = [SFFlightCardSection alloc];
      v80 = [v4 flightCardSection];
      v81 = [(SFFlightCardSection *)v79 initWithProtobuf:v80];
      [(SFCardSectionValue *)v5 setFlightCardSection:v81];
    }
    v82 = [v4 activityIndicatorCardSection];

    if (v82)
    {
      v83 = [SFActivityIndicatorCardSection alloc];
      v84 = [v4 activityIndicatorCardSection];
      v85 = [(SFActivityIndicatorCardSection *)v83 initWithProtobuf:v84];
      [(SFCardSectionValue *)v5 setActivityIndicatorCardSection:v85];
    }
    v86 = [v4 webCardSection];

    if (v86)
    {
      v87 = [SFWebCardSection alloc];
      v88 = [v4 webCardSection];
      v89 = [(SFWebCardSection *)v87 initWithProtobuf:v88];
      [(SFCardSectionValue *)v5 setWebCardSection:v89];
    }
    v90 = [v4 messageCardSection];

    if (v90)
    {
      v91 = [SFMessageCardSection alloc];
      v92 = [v4 messageCardSection];
      v93 = [(SFMessageCardSection *)v91 initWithProtobuf:v92];
      [(SFCardSectionValue *)v5 setMessageCardSection:v93];
    }
    v94 = [v4 detailedRowCardSection];

    if (v94)
    {
      v95 = [SFDetailedRowCardSection alloc];
      v96 = [v4 detailedRowCardSection];
      v97 = [(SFDetailedRowCardSection *)v95 initWithProtobuf:v96];
      [(SFCardSectionValue *)v5 setDetailedRowCardSection:v97];
    }
    v98 = [v4 imagesCardSection];

    if (v98)
    {
      v99 = [SFImagesCardSection alloc];
      v100 = [v4 imagesCardSection];
      v101 = [(SFImagesCardSection *)v99 initWithProtobuf:v100];
      [(SFCardSectionValue *)v5 setImagesCardSection:v101];
    }
    v102 = [v4 suggestionCardSection];

    if (v102)
    {
      v103 = [SFSuggestionCardSection alloc];
      v104 = [v4 suggestionCardSection];
      v105 = [(SFSuggestionCardSection *)v103 initWithProtobuf:v104];
      [(SFCardSectionValue *)v5 setSuggestionCardSection:v105];
    }
    v106 = [v4 selectableGridCardSection];

    if (v106)
    {
      v107 = [SFSelectableGridCardSection alloc];
      v108 = [v4 selectableGridCardSection];
      v109 = [(SFSelectableGridCardSection *)v107 initWithProtobuf:v108];
      [(SFCardSectionValue *)v5 setSelectableGridCardSection:v109];
    }
    v110 = [v4 sectionHeaderCardSection];

    if (v110)
    {
      v111 = [SFSectionHeaderCardSection alloc];
      v112 = [v4 sectionHeaderCardSection];
      v113 = [(SFSectionHeaderCardSection *)v111 initWithProtobuf:v112];
      [(SFCardSectionValue *)v5 setSectionHeaderCardSection:v113];
    }
    v114 = [v4 metaInfoCardSection];

    if (v114)
    {
      v115 = [SFMetaInfoCardSection alloc];
      v116 = [v4 metaInfoCardSection];
      v117 = [(SFMetaInfoCardSection *)v115 initWithProtobuf:v116];
      [(SFCardSectionValue *)v5 setMetaInfoCardSection:v117];
    }
    v118 = [v4 watchListCardSection];

    if (v118)
    {
      v119 = [SFWatchListCardSection alloc];
      v120 = [v4 watchListCardSection];
      v121 = [(SFWatchListCardSection *)v119 initWithProtobuf:v120];
      [(SFCardSectionValue *)v5 setWatchListCardSection:v121];
    }
    v122 = [v4 mapsDetailedRowCardSection];

    if (v122)
    {
      v123 = [SFMapsDetailedRowCardSection alloc];
      v124 = [v4 mapsDetailedRowCardSection];
      v125 = [(SFMapsDetailedRowCardSection *)v123 initWithProtobuf:v124];
      [(SFCardSectionValue *)v5 setMapsDetailedRowCardSection:v125];
    }
    v126 = [v4 buttonCardSection];

    if (v126)
    {
      v127 = [SFButtonCardSection alloc];
      v128 = [v4 buttonCardSection];
      v129 = [(SFButtonCardSection *)v127 initWithProtobuf:v128];
      [(SFCardSectionValue *)v5 setButtonCardSection:v129];
    }
    v130 = [v4 horizontalButtonCardSection];

    if (v130)
    {
      v131 = [SFHorizontalButtonCardSection alloc];
      v132 = [v4 horizontalButtonCardSection];
      v133 = [(SFHorizontalButtonCardSection *)v131 initWithProtobuf:v132];
      [(SFCardSectionValue *)v5 setHorizontalButtonCardSection:v133];
    }
    v134 = [v4 verticalLayoutCardSection];

    if (v134)
    {
      v135 = [SFVerticalLayoutCardSection alloc];
      v136 = [v4 verticalLayoutCardSection];
      v137 = [(SFVerticalLayoutCardSection *)v135 initWithProtobuf:v136];
      [(SFCardSectionValue *)v5 setVerticalLayoutCardSection:v137];
    }
    v138 = [v4 productCardSection];

    if (v138)
    {
      v139 = [SFProductCardSection alloc];
      v140 = [v4 productCardSection];
      v141 = [(SFProductCardSection *)v139 initWithProtobuf:v140];
      [(SFCardSectionValue *)v5 setProductCardSection:v141];
    }
    v142 = [v4 horizontalScrollCardSection];

    if (v142)
    {
      v143 = [SFHorizontalScrollCardSection alloc];
      v144 = [v4 horizontalScrollCardSection];
      v145 = [(SFHorizontalScrollCardSection *)v143 initWithProtobuf:v144];
      [(SFCardSectionValue *)v5 setHorizontalScrollCardSection:v145];
    }
    v146 = [v4 mediaRemoteControlCardSection];

    if (v146)
    {
      v147 = [SFMediaRemoteControlCardSection alloc];
      v148 = [v4 mediaRemoteControlCardSection];
      v149 = [(SFMediaRemoteControlCardSection *)v147 initWithProtobuf:v148];
      [(SFCardSectionValue *)v5 setMediaRemoteControlCardSection:v149];
    }
    v150 = [v4 mapPlaceCardSection];

    if (v150)
    {
      v151 = [SFMapPlaceCardSection alloc];
      v152 = [v4 mapPlaceCardSection];
      v153 = [(SFMapPlaceCardSection *)v151 initWithProtobuf:v152];
      [(SFCardSectionValue *)v5 setMapPlaceCardSection:v153];
    }
    v154 = [v4 compactRowCardSection];

    if (v154)
    {
      v155 = [SFCompactRowCardSection alloc];
      v156 = [v4 compactRowCardSection];
      v157 = [(SFCompactRowCardSection *)v155 initWithProtobuf:v156];
      [(SFCardSectionValue *)v5 setCompactRowCardSection:v157];
    }
    v158 = [v4 worldMapCardSection];

    if (v158)
    {
      v159 = [SFWorldMapCardSection alloc];
      v160 = [v4 worldMapCardSection];
      v161 = [(SFWorldMapCardSection *)v159 initWithProtobuf:v160];
      [(SFCardSectionValue *)v5 setWorldMapCardSection:v161];
    }
    v162 = [v4 attributionFooterCardSection];

    if (v162)
    {
      v163 = [SFAttributionFooterCardSection alloc];
      v164 = [v4 attributionFooterCardSection];
      v165 = [(SFAttributionFooterCardSection *)v163 initWithProtobuf:v164];
      [(SFCardSectionValue *)v5 setAttributionFooterCardSection:v165];
    }
    v166 = [v4 gridCardSection];

    if (v166)
    {
      v167 = [SFGridCardSection alloc];
      v168 = [v4 gridCardSection];
      v169 = [(SFGridCardSection *)v167 initWithProtobuf:v168];
      [(SFCardSectionValue *)v5 setGridCardSection:v169];
    }
    v170 = [v4 personHeaderCardSection];

    if (v170)
    {
      v171 = [SFPersonHeaderCardSection alloc];
      v172 = [v4 personHeaderCardSection];
      v173 = [(SFPersonHeaderCardSection *)v171 initWithProtobuf:v172];
      [(SFCardSectionValue *)v5 setPersonHeaderCardSection:v173];
    }
    v174 = [v4 colorBarCardSection];

    if (v174)
    {
      v175 = [SFColorBarCardSection alloc];
      v176 = [v4 colorBarCardSection];
      v177 = [(SFColorBarCardSection *)v175 initWithProtobuf:v176];
      [(SFCardSectionValue *)v5 setColorBarCardSection:v177];
    }
    v178 = [v4 splitCardSection];

    if (v178)
    {
      v179 = [SFSplitCardSection alloc];
      v180 = [v4 splitCardSection];
      v181 = [(SFSplitCardSection *)v179 initWithProtobuf:v180];
      [(SFCardSectionValue *)v5 setSplitCardSection:v181];
    }
    v182 = [v4 linkPresentationCardSection];

    if (v182)
    {
      v183 = [SFLinkPresentationCardSection alloc];
      v184 = [v4 linkPresentationCardSection];
      v185 = [(SFLinkPresentationCardSection *)v183 initWithProtobuf:v184];
      [(SFCardSectionValue *)v5 setLinkPresentationCardSection:v185];
    }
    v186 = [v4 findMyCardSection];

    if (v186)
    {
      v187 = [SFFindMyCardSection alloc];
      v188 = [v4 findMyCardSection];
      v189 = [(SFFindMyCardSection *)v187 initWithProtobuf:v188];
      [(SFCardSectionValue *)v5 setFindMyCardSection:v189];
    }
    v190 = [v4 heroCardSection];

    if (v190)
    {
      v191 = [SFHeroCardSection alloc];
      v192 = [v4 heroCardSection];
      v193 = [(SFHeroCardSection *)v191 initWithProtobuf:v192];
      [(SFCardSectionValue *)v5 setHeroCardSection:v193];
    }
    v194 = [v4 newsCardSection];

    if (v194)
    {
      v195 = [SFNewsCardSection alloc];
      v196 = [v4 newsCardSection];
      v197 = [(SFNewsCardSection *)v195 initWithProtobuf:v196];
      [(SFCardSectionValue *)v5 setNewsCardSection:v197];
    }
    v198 = [v4 miniCardSection];

    if (v198)
    {
      v199 = [SFMiniCardSection alloc];
      v200 = [v4 miniCardSection];
      v201 = [(SFMiniCardSection *)v199 initWithProtobuf:v200];
      [(SFCardSectionValue *)v5 setMiniCardSection:v201];
    }
    v202 = [v4 infoCardSection];

    if (v202)
    {
      v203 = [SFInfoCardSection alloc];
      v204 = [v4 infoCardSection];
      v205 = [(SFInfoCardSection *)v203 initWithProtobuf:v204];
      [(SFCardSectionValue *)v5 setInfoCardSection:v205];
    }
    v206 = [v4 collectionCardSection];

    if (v206)
    {
      v207 = [SFCollectionCardSection alloc];
      v208 = [v4 collectionCardSection];
      v209 = [(SFCollectionCardSection *)v207 initWithProtobuf:v208];
      [(SFCardSectionValue *)v5 setCollectionCardSection:v209];
    }
    v210 = [v4 combinedCardSection];

    if (v210)
    {
      v211 = [SFCombinedCardSection alloc];
      v212 = [v4 combinedCardSection];
      v213 = [(SFCombinedCardSection *)v211 initWithProtobuf:v212];
      [(SFCardSectionValue *)v5 setCombinedCardSection:v213];
    }
    v214 = [v4 responseWrapperCardSection];

    if (v214)
    {
      v215 = [SFResponseWrapperCardSection alloc];
      v216 = [v4 responseWrapperCardSection];
      v217 = [(SFResponseWrapperCardSection *)v215 initWithProtobuf:v216];
      [(SFCardSectionValue *)v5 setResponseWrapperCardSection:v217];
    }
    v218 = [v4 listenToCardSection];

    if (v218)
    {
      v219 = [SFListenToCardSection alloc];
      v220 = [v4 listenToCardSection];
      v221 = [(SFListenToCardSection *)v219 initWithProtobuf:v220];
      [(SFCardSectionValue *)v5 setListenToCardSection:v221];
    }
    v222 = [v4 watchNowCardSection];

    if (v222)
    {
      v223 = [SFWatchNowCardSection alloc];
      v224 = [v4 watchNowCardSection];
      v225 = [(SFWatchNowCardSection *)v223 initWithProtobuf:v224];
      [(SFCardSectionValue *)v5 setWatchNowCardSection:v225];
    }
    v226 = [v4 strokeAnimationCardSection];

    if (v226)
    {
      v227 = [SFStrokeAnimationCardSection alloc];
      v228 = [v4 strokeAnimationCardSection];
      v229 = [(SFStrokeAnimationCardSection *)v227 initWithProtobuf:v228];
      [(SFCardSectionValue *)v5 setStrokeAnimationCardSection:v229];
    }
    v230 = [v4 buttonListCardSection];

    if (v230)
    {
      v231 = [SFButtonListCardSection alloc];
      v232 = [v4 buttonListCardSection];
      v233 = [(SFButtonListCardSection *)v231 initWithProtobuf:v232];
      [(SFCardSectionValue *)v5 setButtonListCardSection:v233];
    }
    v234 = [v4 commandRowCardSection];

    if (v234)
    {
      v235 = [SFCommandRowCardSection alloc];
      v236 = [v4 commandRowCardSection];
      v237 = [(SFCommandRowCardSection *)v235 initWithProtobuf:v236];
      [(SFCardSectionValue *)v5 setCommandRowCardSection:v237];
    }
    v238 = [v4 leadingTrailingCardSection];

    if (v238)
    {
      v239 = [SFLeadingTrailingCardSection alloc];
      v240 = [v4 leadingTrailingCardSection];
      v241 = [(SFLeadingTrailingCardSection *)v239 initWithProtobuf:v240];
      [(SFCardSectionValue *)v5 setLeadingTrailingCardSection:v241];
    }
    v242 = [v4 heroTitleCardSection];

    if (v242)
    {
      v243 = [SFHeroTitleCardSection alloc];
      v244 = [v4 heroTitleCardSection];
      v245 = [(SFHeroTitleCardSection *)v243 initWithProtobuf:v244];
      [(SFCardSectionValue *)v5 setHeroTitleCardSection:v245];
    }
    v246 = [v4 archiveViewCardSection];

    if (v246)
    {
      v247 = [SFArchiveViewCardSection alloc];
      v248 = [v4 archiveViewCardSection];
      v249 = [(SFArchiveViewCardSection *)v247 initWithProtobuf:v248];
      [(SFCardSectionValue *)v5 setArchiveViewCardSection:v249];
    }
    v250 = [v4 appIconCardSection];

    if (v250)
    {
      v251 = [SFAppIconCardSection alloc];
      v252 = [v4 appIconCardSection];
      v253 = [(SFAppIconCardSection *)v251 initWithProtobuf:v252];
      [(SFCardSectionValue *)v5 setAppIconCardSection:v253];
    }
    v254 = [v4 largeTitleDetailedRowCardSection];

    if (v254)
    {
      v255 = [SFLargeTitleDetailedRowCardSection alloc];
      v256 = [v4 largeTitleDetailedRowCardSection];
      v257 = [(SFLargeTitleDetailedRowCardSection *)v255 initWithProtobuf:v256];
      [(SFCardSectionValue *)v5 setLargeTitleDetailedRowCardSection:v257];
    }
    v258 = [v4 safariTableOfContentsCardSection];

    if (v258)
    {
      v259 = [SFSafariTableOfContentsCardSection alloc];
      v260 = [v4 safariTableOfContentsCardSection];
      v261 = [(SFSafariTableOfContentsCardSection *)v259 initWithProtobuf:v260];
      [(SFCardSectionValue *)v5 setSafariTableOfContentsCardSection:v261];
    }
    v262 = [v4 rfSummaryItemShortNumberCardSection];

    if (v262)
    {
      v263 = [RFSummaryItemShortNumberCardSection alloc];
      v264 = [v4 rfSummaryItemShortNumberCardSection];
      v265 = [(RFSummaryItemShortNumberCardSection *)v263 initWithProtobuf:v264];
      [(SFCardSectionValue *)v5 setRfSummaryItemShortNumberCardSection:v265];
    }
    v266 = [v4 rfSummaryItemTextCardSection];

    if (v266)
    {
      v267 = [RFSummaryItemTextCardSection alloc];
      v268 = [v4 rfSummaryItemTextCardSection];
      v269 = [(RFSummaryItemTextCardSection *)v267 initWithProtobuf:v268];
      [(SFCardSectionValue *)v5 setRfSummaryItemTextCardSection:v269];
    }
    v270 = [v4 rfSummaryItemStandardCardSection];

    if (v270)
    {
      v271 = [RFSummaryItemStandardCardSection alloc];
      v272 = [v4 rfSummaryItemStandardCardSection];
      v273 = [(RFSummaryItemStandardCardSection *)v271 initWithProtobuf:v272];
      [(SFCardSectionValue *)v5 setRfSummaryItemStandardCardSection:v273];
    }
    v274 = [v4 rfFactItemShortNumberCardSection];

    if (v274)
    {
      v275 = [RFFactItemShortNumberCardSection alloc];
      v276 = [v4 rfFactItemShortNumberCardSection];
      v277 = [(RFFactItemShortNumberCardSection *)v275 initWithProtobuf:v276];
      [(SFCardSectionValue *)v5 setRfFactItemShortNumberCardSection:v277];
    }
    v278 = [v4 rfFactItemStandardCardSection];

    if (v278)
    {
      v279 = [RFFactItemStandardCardSection alloc];
      v280 = [v4 rfFactItemStandardCardSection];
      v281 = [(RFFactItemStandardCardSection *)v279 initWithProtobuf:v280];
      [(SFCardSectionValue *)v5 setRfFactItemStandardCardSection:v281];
    }
    v282 = [v4 rfLongItemStandardCardSection];

    if (v282)
    {
      v283 = [RFLongItemStandardCardSection alloc];
      v284 = [v4 rfLongItemStandardCardSection];
      v285 = [(RFLongItemStandardCardSection *)v283 initWithProtobuf:v284];
      [(SFCardSectionValue *)v5 setRfLongItemStandardCardSection:v285];
    }
    v286 = [v4 rfPrimaryHeaderRichCardSection];

    if (v286)
    {
      v287 = [RFPrimaryHeaderRichCardSection alloc];
      v288 = [v4 rfPrimaryHeaderRichCardSection];
      v289 = [(RFPrimaryHeaderRichCardSection *)v287 initWithProtobuf:v288];
      [(SFCardSectionValue *)v5 setRfPrimaryHeaderRichCardSection:v289];
    }
    v290 = [v4 rfPrimaryHeaderStandardCardSection];

    if (v290)
    {
      v291 = [RFPrimaryHeaderStandardCardSection alloc];
      v292 = [v4 rfPrimaryHeaderStandardCardSection];
      v293 = [(RFPrimaryHeaderStandardCardSection *)v291 initWithProtobuf:v292];
      [(SFCardSectionValue *)v5 setRfPrimaryHeaderStandardCardSection:v293];
    }
    v294 = [v4 rfReferenceFootnoteCardSection];

    if (v294)
    {
      v295 = [RFReferenceFootnoteCardSection alloc];
      v296 = [v4 rfReferenceFootnoteCardSection];
      v297 = [(RFReferenceFootnoteCardSection *)v295 initWithProtobuf:v296];
      [(SFCardSectionValue *)v5 setRfReferenceFootnoteCardSection:v297];
    }
    v298 = [v4 rfReferenceRichCardSection];

    if (v298)
    {
      v299 = [RFReferenceRichCardSection alloc];
      v300 = [v4 rfReferenceRichCardSection];
      v301 = [(RFReferenceRichCardSection *)v299 initWithProtobuf:v300];
      [(SFCardSectionValue *)v5 setRfReferenceRichCardSection:v301];
    }
    v302 = [v4 rfSimpleItemRichCardSection];

    if (v302)
    {
      v303 = [RFSimpleItemRichCardSection alloc];
      v304 = [v4 rfSimpleItemRichCardSection];
      v305 = [(RFSimpleItemRichCardSection *)v303 initWithProtobuf:v304];
      [(SFCardSectionValue *)v5 setRfSimpleItemRichCardSection:v305];
    }
    v306 = [v4 rfSimpleItemStandardCardSection];

    if (v306)
    {
      v307 = [RFSimpleItemStandardCardSection alloc];
      v308 = [v4 rfSimpleItemStandardCardSection];
      v309 = [(RFSimpleItemStandardCardSection *)v307 initWithProtobuf:v308];
      [(SFCardSectionValue *)v5 setRfSimpleItemStandardCardSection:v309];
    }
    v310 = [v4 rfSummaryItemAlignedTextCardSection];

    if (v310)
    {
      v311 = [RFSummaryItemAlignedTextCardSection alloc];
      v312 = [v4 rfSummaryItemAlignedTextCardSection];
      v313 = [(RFSummaryItemAlignedTextCardSection *)v311 initWithProtobuf:v312];
      [(SFCardSectionValue *)v5 setRfSummaryItemAlignedTextCardSection:v313];
    }
    v314 = [v4 rfExpandableStandardCardSection];

    if (v314)
    {
      v315 = [RFExpandableStandardCardSection alloc];
      v316 = [v4 rfExpandableStandardCardSection];
      v317 = [(RFExpandableStandardCardSection *)v315 initWithProtobuf:v316];
      [(SFCardSectionValue *)v5 setRfExpandableStandardCardSection:v317];
    }
    v318 = [v4 rfFactItemButtonCardSection];

    if (v318)
    {
      v319 = [RFFactItemButtonCardSection alloc];
      v320 = [v4 rfFactItemButtonCardSection];
      v321 = [(RFFactItemButtonCardSection *)v319 initWithProtobuf:v320];
      [(SFCardSectionValue *)v5 setRfFactItemButtonCardSection:v321];
    }
    v322 = [v4 rfFactItemHeroNumberCardSection];

    if (v322)
    {
      v323 = [RFFactItemHeroNumberCardSection alloc];
      v324 = [v4 rfFactItemHeroNumberCardSection];
      v325 = [(RFFactItemHeroNumberCardSection *)v323 initWithProtobuf:v324];
      [(SFCardSectionValue *)v5 setRfFactItemHeroNumberCardSection:v325];
    }
    v326 = [v4 rfPrimaryHeaderMarqueeCardSection];

    if (v326)
    {
      v327 = [RFPrimaryHeaderMarqueeCardSection alloc];
      v328 = [v4 rfPrimaryHeaderMarqueeCardSection];
      v329 = [(RFPrimaryHeaderMarqueeCardSection *)v327 initWithProtobuf:v328];
      [(SFCardSectionValue *)v5 setRfPrimaryHeaderMarqueeCardSection:v329];
    }
    v330 = [v4 rfSummaryItemDetailedTextCardSection];

    if (v330)
    {
      v331 = [RFSummaryItemDetailedTextCardSection alloc];
      v332 = [v4 rfSummaryItemDetailedTextCardSection];
      v333 = [(RFSummaryItemDetailedTextCardSection *)v331 initWithProtobuf:v332];
      [(SFCardSectionValue *)v5 setRfSummaryItemDetailedTextCardSection:v333];
    }
    v334 = [v4 rfSimpleItemPlayerCardSection];

    if (v334)
    {
      v335 = [RFSimpleItemPlayerCardSection alloc];
      v336 = [v4 rfSimpleItemPlayerCardSection];
      v337 = [(RFSimpleItemPlayerCardSection *)v335 initWithProtobuf:v336];
      [(SFCardSectionValue *)v5 setRfSimpleItemPlayerCardSection:v337];
    }
    v338 = [v4 rfSummaryItemPairCardSection];

    if (v338)
    {
      v339 = [RFSummaryItemPairCardSection alloc];
      v340 = [v4 rfSummaryItemPairCardSection];
      v341 = [(RFSummaryItemPairCardSection *)v339 initWithProtobuf:v340];
      [(SFCardSectionValue *)v5 setRfSummaryItemPairCardSection:v341];
    }
    v342 = [v4 rfSummaryItemPairNumberCardSection];

    if (v342)
    {
      v343 = [RFSummaryItemPairNumberCardSection alloc];
      v344 = [v4 rfSummaryItemPairNumberCardSection];
      v345 = [(RFSummaryItemPairNumberCardSection *)v343 initWithProtobuf:v344];
      [(SFCardSectionValue *)v5 setRfSummaryItemPairNumberCardSection:v345];
    }
    v346 = [v4 rfFactItemShortHeroNumberCardSection];

    if (v346)
    {
      v347 = [RFFactItemShortHeroNumberCardSection alloc];
      v348 = [v4 rfFactItemShortHeroNumberCardSection];
      v349 = [(RFFactItemShortHeroNumberCardSection *)v347 initWithProtobuf:v348];
      [(SFCardSectionValue *)v5 setRfFactItemShortHeroNumberCardSection:v349];
    }
    v350 = [v4 rfFactItemDetailedNumberCardSection];

    if (v350)
    {
      v351 = [RFFactItemDetailedNumberCardSection alloc];
      v352 = [v4 rfFactItemDetailedNumberCardSection];
      v353 = [(RFFactItemDetailedNumberCardSection *)v351 initWithProtobuf:v352];
      [(SFCardSectionValue *)v5 setRfFactItemDetailedNumberCardSection:v353];
    }
    v354 = [v4 rfFactItemHeroButtonCardSection];

    if (v354)
    {
      v355 = [RFFactItemHeroButtonCardSection alloc];
      v356 = [v4 rfFactItemHeroButtonCardSection];
      v357 = [(RFFactItemHeroButtonCardSection *)v355 initWithProtobuf:v356];
      [(SFCardSectionValue *)v5 setRfFactItemHeroButtonCardSection:v357];
    }
    v358 = [v4 rfFactItemImageRightCardSection];

    if (v358)
    {
      v359 = [RFFactItemImageRightCardSection alloc];
      v360 = [v4 rfFactItemImageRightCardSection];
      v361 = [(RFFactItemImageRightCardSection *)v359 initWithProtobuf:v360];
      [(SFCardSectionValue *)v5 setRfFactItemImageRightCardSection:v361];
    }
    v362 = [v4 rfSummaryItemSwitchV2CardSection];

    if (v362)
    {
      v363 = [RFSummaryItemSwitchV2CardSection alloc];
      v364 = [v4 rfSummaryItemSwitchV2CardSection];
      v365 = [(RFSummaryItemSwitchV2CardSection *)v363 initWithProtobuf:v364];
      [(SFCardSectionValue *)v5 setRfSummaryItemSwitchV2CardSection:v365];
    }
    v366 = [v4 rfTableHeaderCardSection];

    if (v366)
    {
      v367 = [RFTableHeaderCardSection alloc];
      v368 = [v4 rfTableHeaderCardSection];
      v369 = [(RFTableHeaderCardSection *)v367 initWithProtobuf:v368];
      [(SFCardSectionValue *)v5 setRfTableHeaderCardSection:v369];
    }
    v370 = [v4 rfTableRowCardSection];

    if (v370)
    {
      v371 = [RFTableRowCardSection alloc];
      v372 = [v4 rfTableRowCardSection];
      v373 = [(RFTableRowCardSection *)v371 initWithProtobuf:v372];
      [(SFCardSectionValue *)v5 setRfTableRowCardSection:v373];
    }
    v374 = [v4 rfSimpleItemVisualElementCardSection];

    if (v374)
    {
      v375 = [RFSimpleItemVisualElementCardSection alloc];
      v376 = [v4 rfSimpleItemVisualElementCardSection];
      v377 = [(RFSimpleItemVisualElementCardSection *)v375 initWithProtobuf:v376];
      [(SFCardSectionValue *)v5 setRfSimpleItemVisualElementCardSection:v377];
    }
    v378 = [v4 rfSummaryItemPlayerCardSection];

    if (v378)
    {
      v379 = [RFSummaryItemPlayerCardSection alloc];
      v380 = [v4 rfSummaryItemPlayerCardSection];
      v381 = [(RFSummaryItemPlayerCardSection *)v379 initWithProtobuf:v380];
      [(SFCardSectionValue *)v5 setRfSummaryItemPlayerCardSection:v381];
    }
    v382 = [v4 rfSummaryItemImageRightCardSection];

    if (v382)
    {
      v383 = [RFSummaryItemImageRightCardSection alloc];
      v384 = [v4 rfSummaryItemImageRightCardSection];
      v385 = [(RFSummaryItemImageRightCardSection *)v383 initWithProtobuf:v384];
      [(SFCardSectionValue *)v5 setRfSummaryItemImageRightCardSection:v385];
    }
    v386 = [v4 rfSummaryItemButtonCardSection];

    if (v386)
    {
      v387 = [RFSummaryItemButtonCardSection alloc];
      v388 = [v4 rfSummaryItemButtonCardSection];
      v389 = [(RFSummaryItemButtonCardSection *)v387 initWithProtobuf:v388];
      [(SFCardSectionValue *)v5 setRfSummaryItemButtonCardSection:v389];
    }
    v390 = [v4 rfSimpleItemReverseRichCardSection];

    if (v390)
    {
      v391 = [RFSimpleItemReverseRichCardSection alloc];
      v392 = [v4 rfSimpleItemReverseRichCardSection];
      v393 = [(RFSimpleItemReverseRichCardSection *)v391 initWithProtobuf:v392];
      [(SFCardSectionValue *)v5 setRfSimpleItemReverseRichCardSection:v393];
    }
    v394 = [v4 rfSimpleItemRichSearchResultCardSection];

    if (v394)
    {
      v395 = [RFSimpleItemRichSearchResultCardSection alloc];
      v396 = [v4 rfSimpleItemRichSearchResultCardSection];
      v397 = [(RFSimpleItemRichSearchResultCardSection *)v395 initWithProtobuf:v396];
      [(SFCardSectionValue *)v5 setRfSimpleItemRichSearchResultCardSection:v397];
    }
    v398 = [v4 rfPrimaryHeaderStackedImageCardSection];

    if (v398)
    {
      v399 = [RFPrimaryHeaderStackedImageCardSection alloc];
      v400 = [v4 rfPrimaryHeaderStackedImageCardSection];
      v401 = [(RFPrimaryHeaderStackedImageCardSection *)v399 initWithProtobuf:v400];
      [(SFCardSectionValue *)v5 setRfPrimaryHeaderStackedImageCardSection:v401];
    }
    v402 = [v4 rfReferenceItemLogoCardSection];

    if (v402)
    {
      v403 = [RFReferenceItemLogoCardSection alloc];
      v404 = [v4 rfReferenceItemLogoCardSection];
      v405 = [(RFReferenceItemLogoCardSection *)v403 initWithProtobuf:v404];
      [(SFCardSectionValue *)v5 setRfReferenceItemLogoCardSection:v405];
    }
    v406 = [v4 rfReferenceItemButtonCardSection];

    if (v406)
    {
      v407 = [RFReferenceItemButtonCardSection alloc];
      v408 = [v4 rfReferenceItemButtonCardSection];
      v409 = [(RFReferenceItemButtonCardSection *)v407 initWithProtobuf:v408];
      [(SFCardSectionValue *)v5 setRfReferenceItemButtonCardSection:v409];
    }
    v410 = [v4 rfButtonCardSection];

    if (v410)
    {
      v411 = [RFButtonCardSection alloc];
      v412 = [v4 rfButtonCardSection];
      v413 = [(RFButtonCardSection *)v411 initWithProtobuf:v412];
      [(SFCardSectionValue *)v5 setRfButtonCardSection:v413];
    }
    v414 = [v4 rfBinaryButtonCardSection];

    if (v414)
    {
      v415 = [RFBinaryButtonCardSection alloc];
      v416 = [v4 rfBinaryButtonCardSection];
      v417 = [(RFBinaryButtonCardSection *)v415 initWithProtobuf:v416];
      [(SFCardSectionValue *)v5 setRfBinaryButtonCardSection:v417];
    }
    v418 = [v4 rfReferenceCenteredCardSection];

    if (v418)
    {
      v419 = [RFReferenceCenteredCardSection alloc];
      v420 = [v4 rfReferenceCenteredCardSection];
      v421 = [(RFReferenceCenteredCardSection *)v419 initWithProtobuf:v420];
      [(SFCardSectionValue *)v5 setRfReferenceCenteredCardSection:v421];
    }
    v422 = [v4 rfSecondaryHeaderStandardCardSection];

    if (v422)
    {
      v423 = [RFSecondaryHeaderStandardCardSection alloc];
      v424 = [v4 rfSecondaryHeaderStandardCardSection];
      v425 = [(RFSecondaryHeaderStandardCardSection *)v423 initWithProtobuf:v424];
      [(SFCardSectionValue *)v5 setRfSecondaryHeaderStandardCardSection:v425];
    }
    v426 = [v4 rfSecondaryHeaderEmphasizedCardSection];

    if (v426)
    {
      v427 = [RFSecondaryHeaderEmphasizedCardSection alloc];
      v428 = [v4 rfSecondaryHeaderEmphasizedCardSection];
      v429 = [(RFSecondaryHeaderEmphasizedCardSection *)v427 initWithProtobuf:v428];
      [(SFCardSectionValue *)v5 setRfSecondaryHeaderEmphasizedCardSection:v429];
    }
    v430 = [v4 rfMapCardSection];

    if (v430)
    {
      v431 = [RFMapCardSection alloc];
      v432 = [v4 rfMapCardSection];
      v433 = [(RFMapCardSection *)v431 initWithProtobuf:v432];
      [(SFCardSectionValue *)v5 setRfMapCardSection:v433];
    }
    v434 = [v4 rfReferenceStandardCardSection];

    if (v434)
    {
      v435 = [RFReferenceStandardCardSection alloc];
      v436 = [v4 rfReferenceStandardCardSection];
      v437 = [(RFReferenceStandardCardSection *)v435 initWithProtobuf:v436];
      [(SFCardSectionValue *)v5 setRfReferenceStandardCardSection:v437];
    }
    v438 = [v4 rfMultiButtonCardSection];

    if (v438)
    {
      v439 = [RFMultiButtonCardSection alloc];
      v440 = [v4 rfMultiButtonCardSection];
      v441 = [(RFMultiButtonCardSection *)v439 initWithProtobuf:v440];
      [(SFCardSectionValue *)v5 setRfMultiButtonCardSection:v441];
    }
    v442 = [v4 rfDisambiguationTitleCardSection];

    if (v442)
    {
      v443 = [RFDisambiguationTitleCardSection alloc];
      v444 = [v4 rfDisambiguationTitleCardSection];
      v445 = [(RFDisambiguationTitleCardSection *)v443 initWithProtobuf:v444];
      [(SFCardSectionValue *)v5 setRfDisambiguationTitleCardSection:v445];
    }
    v446 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rfDisambiguationTitleCardSection, 0);
  objc_storeStrong((id *)&self->_rfMultiButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfMapCardSection, 0);
  objc_storeStrong((id *)&self->_rfSecondaryHeaderEmphasizedCardSection, 0);
  objc_storeStrong((id *)&self->_rfSecondaryHeaderStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceCenteredCardSection, 0);
  objc_storeStrong((id *)&self->_rfBinaryButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceItemButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceItemLogoCardSection, 0);
  objc_storeStrong((id *)&self->_rfPrimaryHeaderStackedImageCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemRichSearchResultCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemReverseRichCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemImageRightCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemPlayerCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemVisualElementCardSection, 0);
  objc_storeStrong((id *)&self->_rfTableRowCardSection, 0);
  objc_storeStrong((id *)&self->_rfTableHeaderCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemSwitchV2CardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemImageRightCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemHeroButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemDetailedNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemShortHeroNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemPairNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemPairCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemPlayerCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemDetailedTextCardSection, 0);
  objc_storeStrong((id *)&self->_rfPrimaryHeaderMarqueeCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemHeroNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemButtonCardSection, 0);
  objc_storeStrong((id *)&self->_rfExpandableStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemAlignedTextCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfSimpleItemRichCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceRichCardSection, 0);
  objc_storeStrong((id *)&self->_rfReferenceFootnoteCardSection, 0);
  objc_storeStrong((id *)&self->_rfPrimaryHeaderStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfPrimaryHeaderRichCardSection, 0);
  objc_storeStrong((id *)&self->_rfLongItemStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfFactItemShortNumberCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemStandardCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemTextCardSection, 0);
  objc_storeStrong((id *)&self->_rfSummaryItemShortNumberCardSection, 0);
  objc_storeStrong((id *)&self->_safariTableOfContentsCardSection, 0);
  objc_storeStrong((id *)&self->_largeTitleDetailedRowCardSection, 0);
  objc_storeStrong((id *)&self->_appIconCardSection, 0);
  objc_storeStrong((id *)&self->_archiveViewCardSection, 0);
  objc_storeStrong((id *)&self->_heroTitleCardSection, 0);
  objc_storeStrong((id *)&self->_leadingTrailingCardSection, 0);
  objc_storeStrong((id *)&self->_commandRowCardSection, 0);
  objc_storeStrong((id *)&self->_buttonListCardSection, 0);
  objc_storeStrong((id *)&self->_strokeAnimationCardSection, 0);
  objc_storeStrong((id *)&self->_watchNowCardSection, 0);
  objc_storeStrong((id *)&self->_listenToCardSection, 0);
  objc_storeStrong((id *)&self->_responseWrapperCardSection, 0);
  objc_storeStrong((id *)&self->_combinedCardSection, 0);
  objc_storeStrong((id *)&self->_collectionCardSection, 0);
  objc_storeStrong((id *)&self->_infoCardSection, 0);
  objc_storeStrong((id *)&self->_miniCardSection, 0);
  objc_storeStrong((id *)&self->_newsCardSection, 0);
  objc_storeStrong((id *)&self->_heroCardSection, 0);
  objc_storeStrong((id *)&self->_findMyCardSection, 0);
  objc_storeStrong((id *)&self->_linkPresentationCardSection, 0);
  objc_storeStrong((id *)&self->_splitCardSection, 0);
  objc_storeStrong((id *)&self->_colorBarCardSection, 0);
  objc_storeStrong((id *)&self->_personHeaderCardSection, 0);
  objc_storeStrong((id *)&self->_gridCardSection, 0);
  objc_storeStrong((id *)&self->_attributionFooterCardSection, 0);
  objc_storeStrong((id *)&self->_worldMapCardSection, 0);
  objc_storeStrong((id *)&self->_compactRowCardSection, 0);
  objc_storeStrong((id *)&self->_mapPlaceCardSection, 0);
  objc_storeStrong((id *)&self->_mediaRemoteControlCardSection, 0);
  objc_storeStrong((id *)&self->_horizontalScrollCardSection, 0);
  objc_storeStrong((id *)&self->_productCardSection, 0);
  objc_storeStrong((id *)&self->_verticalLayoutCardSection, 0);
  objc_storeStrong((id *)&self->_horizontalButtonCardSection, 0);
  objc_storeStrong((id *)&self->_buttonCardSection, 0);
  objc_storeStrong((id *)&self->_mapsDetailedRowCardSection, 0);
  objc_storeStrong((id *)&self->_watchListCardSection, 0);
  objc_storeStrong((id *)&self->_metaInfoCardSection, 0);
  objc_storeStrong((id *)&self->_sectionHeaderCardSection, 0);
  objc_storeStrong((id *)&self->_selectableGridCardSection, 0);
  objc_storeStrong((id *)&self->_suggestionCardSection, 0);
  objc_storeStrong((id *)&self->_imagesCardSection, 0);
  objc_storeStrong((id *)&self->_detailedRowCardSection, 0);
  objc_storeStrong((id *)&self->_messageCardSection, 0);
  objc_storeStrong((id *)&self->_webCardSection, 0);
  objc_storeStrong((id *)&self->_activityIndicatorCardSection, 0);
  objc_storeStrong((id *)&self->_flightCardSection, 0);
  objc_storeStrong((id *)&self->_audioPlaybackCardSection, 0);
  objc_storeStrong((id *)&self->_trackListCardSection, 0);
  objc_storeStrong((id *)&self->_titleCardSection, 0);
  objc_storeStrong((id *)&self->_textColumnsCardSection, 0);
  objc_storeStrong((id *)&self->_tableRowCardSection, 0);
  objc_storeStrong((id *)&self->_tableHeaderRowCardSection, 0);
  objc_storeStrong((id *)&self->_stockChartCardSection, 0);
  objc_storeStrong((id *)&self->_socialMediaPostCardSection, 0);
  objc_storeStrong((id *)&self->_scoreboardCardSection, 0);
  objc_storeStrong((id *)&self->_rowCardSection, 0);
  objc_storeStrong((id *)&self->_richTitleCardSection, 0);
  objc_storeStrong((id *)&self->_nowPlayingCardSection, 0);
  objc_storeStrong((id *)&self->_mediaPlayerCardSection, 0);
  objc_storeStrong((id *)&self->_mediaInfoCardSection, 0);
  objc_storeStrong((id *)&self->_mapCardSection, 0);
  objc_storeStrong((id *)&self->_keyValueDataCardSection, 0);
  objc_storeStrong((id *)&self->_descriptionCardSection, 0);
  objc_storeStrong((id *)&self->_appLinkCardSection, 0);
}

- (void)setRfDisambiguationTitleCardSection:(id)a3
{
}

- (RFDisambiguationTitleCardSection)rfDisambiguationTitleCardSection
{
  return self->_rfDisambiguationTitleCardSection;
}

- (void)setRfMultiButtonCardSection:(id)a3
{
}

- (RFMultiButtonCardSection)rfMultiButtonCardSection
{
  return self->_rfMultiButtonCardSection;
}

- (void)setRfReferenceStandardCardSection:(id)a3
{
}

- (RFReferenceStandardCardSection)rfReferenceStandardCardSection
{
  return self->_rfReferenceStandardCardSection;
}

- (void)setRfMapCardSection:(id)a3
{
}

- (RFMapCardSection)rfMapCardSection
{
  return self->_rfMapCardSection;
}

- (void)setRfSecondaryHeaderEmphasizedCardSection:(id)a3
{
}

- (RFSecondaryHeaderEmphasizedCardSection)rfSecondaryHeaderEmphasizedCardSection
{
  return self->_rfSecondaryHeaderEmphasizedCardSection;
}

- (void)setRfSecondaryHeaderStandardCardSection:(id)a3
{
}

- (RFSecondaryHeaderStandardCardSection)rfSecondaryHeaderStandardCardSection
{
  return self->_rfSecondaryHeaderStandardCardSection;
}

- (void)setRfReferenceCenteredCardSection:(id)a3
{
}

- (RFReferenceCenteredCardSection)rfReferenceCenteredCardSection
{
  return self->_rfReferenceCenteredCardSection;
}

- (void)setRfBinaryButtonCardSection:(id)a3
{
}

- (RFBinaryButtonCardSection)rfBinaryButtonCardSection
{
  return self->_rfBinaryButtonCardSection;
}

- (void)setRfButtonCardSection:(id)a3
{
}

- (RFButtonCardSection)rfButtonCardSection
{
  return self->_rfButtonCardSection;
}

- (void)setRfReferenceItemButtonCardSection:(id)a3
{
}

- (RFReferenceItemButtonCardSection)rfReferenceItemButtonCardSection
{
  return self->_rfReferenceItemButtonCardSection;
}

- (void)setRfReferenceItemLogoCardSection:(id)a3
{
}

- (RFReferenceItemLogoCardSection)rfReferenceItemLogoCardSection
{
  return self->_rfReferenceItemLogoCardSection;
}

- (void)setRfPrimaryHeaderStackedImageCardSection:(id)a3
{
}

- (RFPrimaryHeaderStackedImageCardSection)rfPrimaryHeaderStackedImageCardSection
{
  return self->_rfPrimaryHeaderStackedImageCardSection;
}

- (void)setRfSimpleItemRichSearchResultCardSection:(id)a3
{
}

- (RFSimpleItemRichSearchResultCardSection)rfSimpleItemRichSearchResultCardSection
{
  return self->_rfSimpleItemRichSearchResultCardSection;
}

- (void)setRfSimpleItemReverseRichCardSection:(id)a3
{
}

- (RFSimpleItemReverseRichCardSection)rfSimpleItemReverseRichCardSection
{
  return self->_rfSimpleItemReverseRichCardSection;
}

- (void)setRfSummaryItemButtonCardSection:(id)a3
{
}

- (RFSummaryItemButtonCardSection)rfSummaryItemButtonCardSection
{
  return self->_rfSummaryItemButtonCardSection;
}

- (void)setRfSummaryItemImageRightCardSection:(id)a3
{
}

- (RFSummaryItemImageRightCardSection)rfSummaryItemImageRightCardSection
{
  return self->_rfSummaryItemImageRightCardSection;
}

- (void)setRfSummaryItemPlayerCardSection:(id)a3
{
}

- (RFSummaryItemPlayerCardSection)rfSummaryItemPlayerCardSection
{
  return self->_rfSummaryItemPlayerCardSection;
}

- (void)setRfSimpleItemVisualElementCardSection:(id)a3
{
}

- (RFSimpleItemVisualElementCardSection)rfSimpleItemVisualElementCardSection
{
  return self->_rfSimpleItemVisualElementCardSection;
}

- (void)setRfTableRowCardSection:(id)a3
{
}

- (RFTableRowCardSection)rfTableRowCardSection
{
  return self->_rfTableRowCardSection;
}

- (void)setRfTableHeaderCardSection:(id)a3
{
}

- (RFTableHeaderCardSection)rfTableHeaderCardSection
{
  return self->_rfTableHeaderCardSection;
}

- (void)setRfSummaryItemSwitchV2CardSection:(id)a3
{
}

- (RFSummaryItemSwitchV2CardSection)rfSummaryItemSwitchV2CardSection
{
  return self->_rfSummaryItemSwitchV2CardSection;
}

- (void)setRfFactItemImageRightCardSection:(id)a3
{
}

- (RFFactItemImageRightCardSection)rfFactItemImageRightCardSection
{
  return self->_rfFactItemImageRightCardSection;
}

- (void)setRfFactItemHeroButtonCardSection:(id)a3
{
}

- (RFFactItemHeroButtonCardSection)rfFactItemHeroButtonCardSection
{
  return self->_rfFactItemHeroButtonCardSection;
}

- (void)setRfFactItemDetailedNumberCardSection:(id)a3
{
}

- (RFFactItemDetailedNumberCardSection)rfFactItemDetailedNumberCardSection
{
  return self->_rfFactItemDetailedNumberCardSection;
}

- (void)setRfFactItemShortHeroNumberCardSection:(id)a3
{
}

- (RFFactItemShortHeroNumberCardSection)rfFactItemShortHeroNumberCardSection
{
  return self->_rfFactItemShortHeroNumberCardSection;
}

- (void)setRfSummaryItemPairNumberCardSection:(id)a3
{
}

- (RFSummaryItemPairNumberCardSection)rfSummaryItemPairNumberCardSection
{
  return self->_rfSummaryItemPairNumberCardSection;
}

- (void)setRfSummaryItemPairCardSection:(id)a3
{
}

- (RFSummaryItemPairCardSection)rfSummaryItemPairCardSection
{
  return self->_rfSummaryItemPairCardSection;
}

- (void)setRfSimpleItemPlayerCardSection:(id)a3
{
}

- (RFSimpleItemPlayerCardSection)rfSimpleItemPlayerCardSection
{
  return self->_rfSimpleItemPlayerCardSection;
}

- (void)setRfSummaryItemDetailedTextCardSection:(id)a3
{
}

- (RFSummaryItemDetailedTextCardSection)rfSummaryItemDetailedTextCardSection
{
  return self->_rfSummaryItemDetailedTextCardSection;
}

- (void)setRfPrimaryHeaderMarqueeCardSection:(id)a3
{
}

- (RFPrimaryHeaderMarqueeCardSection)rfPrimaryHeaderMarqueeCardSection
{
  return self->_rfPrimaryHeaderMarqueeCardSection;
}

- (void)setRfFactItemHeroNumberCardSection:(id)a3
{
}

- (RFFactItemHeroNumberCardSection)rfFactItemHeroNumberCardSection
{
  return self->_rfFactItemHeroNumberCardSection;
}

- (void)setRfFactItemButtonCardSection:(id)a3
{
}

- (RFFactItemButtonCardSection)rfFactItemButtonCardSection
{
  return self->_rfFactItemButtonCardSection;
}

- (void)setRfExpandableStandardCardSection:(id)a3
{
}

- (RFExpandableStandardCardSection)rfExpandableStandardCardSection
{
  return self->_rfExpandableStandardCardSection;
}

- (void)setRfSummaryItemAlignedTextCardSection:(id)a3
{
}

- (RFSummaryItemAlignedTextCardSection)rfSummaryItemAlignedTextCardSection
{
  return self->_rfSummaryItemAlignedTextCardSection;
}

- (void)setRfSimpleItemStandardCardSection:(id)a3
{
}

- (RFSimpleItemStandardCardSection)rfSimpleItemStandardCardSection
{
  return self->_rfSimpleItemStandardCardSection;
}

- (void)setRfSimpleItemRichCardSection:(id)a3
{
}

- (RFSimpleItemRichCardSection)rfSimpleItemRichCardSection
{
  return self->_rfSimpleItemRichCardSection;
}

- (void)setRfReferenceRichCardSection:(id)a3
{
}

- (RFReferenceRichCardSection)rfReferenceRichCardSection
{
  return self->_rfReferenceRichCardSection;
}

- (void)setRfReferenceFootnoteCardSection:(id)a3
{
}

- (RFReferenceFootnoteCardSection)rfReferenceFootnoteCardSection
{
  return self->_rfReferenceFootnoteCardSection;
}

- (void)setRfPrimaryHeaderStandardCardSection:(id)a3
{
}

- (RFPrimaryHeaderStandardCardSection)rfPrimaryHeaderStandardCardSection
{
  return self->_rfPrimaryHeaderStandardCardSection;
}

- (void)setRfPrimaryHeaderRichCardSection:(id)a3
{
}

- (RFPrimaryHeaderRichCardSection)rfPrimaryHeaderRichCardSection
{
  return self->_rfPrimaryHeaderRichCardSection;
}

- (void)setRfLongItemStandardCardSection:(id)a3
{
}

- (RFLongItemStandardCardSection)rfLongItemStandardCardSection
{
  return self->_rfLongItemStandardCardSection;
}

- (void)setRfFactItemStandardCardSection:(id)a3
{
}

- (RFFactItemStandardCardSection)rfFactItemStandardCardSection
{
  return self->_rfFactItemStandardCardSection;
}

- (void)setRfFactItemShortNumberCardSection:(id)a3
{
}

- (RFFactItemShortNumberCardSection)rfFactItemShortNumberCardSection
{
  return self->_rfFactItemShortNumberCardSection;
}

- (void)setRfSummaryItemStandardCardSection:(id)a3
{
}

- (RFSummaryItemStandardCardSection)rfSummaryItemStandardCardSection
{
  return self->_rfSummaryItemStandardCardSection;
}

- (void)setRfSummaryItemTextCardSection:(id)a3
{
}

- (RFSummaryItemTextCardSection)rfSummaryItemTextCardSection
{
  return self->_rfSummaryItemTextCardSection;
}

- (void)setRfSummaryItemShortNumberCardSection:(id)a3
{
}

- (RFSummaryItemShortNumberCardSection)rfSummaryItemShortNumberCardSection
{
  return self->_rfSummaryItemShortNumberCardSection;
}

- (void)setSafariTableOfContentsCardSection:(id)a3
{
}

- (SFSafariTableOfContentsCardSection)safariTableOfContentsCardSection
{
  return self->_safariTableOfContentsCardSection;
}

- (void)setLargeTitleDetailedRowCardSection:(id)a3
{
}

- (SFLargeTitleDetailedRowCardSection)largeTitleDetailedRowCardSection
{
  return self->_largeTitleDetailedRowCardSection;
}

- (void)setAppIconCardSection:(id)a3
{
}

- (SFAppIconCardSection)appIconCardSection
{
  return self->_appIconCardSection;
}

- (void)setArchiveViewCardSection:(id)a3
{
}

- (SFArchiveViewCardSection)archiveViewCardSection
{
  return self->_archiveViewCardSection;
}

- (void)setHeroTitleCardSection:(id)a3
{
}

- (SFHeroTitleCardSection)heroTitleCardSection
{
  return self->_heroTitleCardSection;
}

- (void)setLeadingTrailingCardSection:(id)a3
{
}

- (SFLeadingTrailingCardSection)leadingTrailingCardSection
{
  return self->_leadingTrailingCardSection;
}

- (void)setCommandRowCardSection:(id)a3
{
}

- (SFCommandRowCardSection)commandRowCardSection
{
  return self->_commandRowCardSection;
}

- (void)setButtonListCardSection:(id)a3
{
}

- (SFButtonListCardSection)buttonListCardSection
{
  return self->_buttonListCardSection;
}

- (void)setStrokeAnimationCardSection:(id)a3
{
}

- (SFStrokeAnimationCardSection)strokeAnimationCardSection
{
  return self->_strokeAnimationCardSection;
}

- (void)setWatchNowCardSection:(id)a3
{
}

- (SFWatchNowCardSection)watchNowCardSection
{
  return self->_watchNowCardSection;
}

- (void)setListenToCardSection:(id)a3
{
}

- (SFListenToCardSection)listenToCardSection
{
  return self->_listenToCardSection;
}

- (void)setResponseWrapperCardSection:(id)a3
{
}

- (SFResponseWrapperCardSection)responseWrapperCardSection
{
  return self->_responseWrapperCardSection;
}

- (void)setCombinedCardSection:(id)a3
{
}

- (SFCombinedCardSection)combinedCardSection
{
  return self->_combinedCardSection;
}

- (void)setCollectionCardSection:(id)a3
{
}

- (SFCollectionCardSection)collectionCardSection
{
  return self->_collectionCardSection;
}

- (void)setInfoCardSection:(id)a3
{
}

- (SFInfoCardSection)infoCardSection
{
  return self->_infoCardSection;
}

- (void)setMiniCardSection:(id)a3
{
}

- (SFMiniCardSection)miniCardSection
{
  return self->_miniCardSection;
}

- (void)setNewsCardSection:(id)a3
{
}

- (SFNewsCardSection)newsCardSection
{
  return self->_newsCardSection;
}

- (void)setHeroCardSection:(id)a3
{
}

- (SFHeroCardSection)heroCardSection
{
  return self->_heroCardSection;
}

- (void)setFindMyCardSection:(id)a3
{
}

- (SFFindMyCardSection)findMyCardSection
{
  return self->_findMyCardSection;
}

- (void)setLinkPresentationCardSection:(id)a3
{
}

- (SFLinkPresentationCardSection)linkPresentationCardSection
{
  return self->_linkPresentationCardSection;
}

- (void)setSplitCardSection:(id)a3
{
}

- (SFSplitCardSection)splitCardSection
{
  return self->_splitCardSection;
}

- (void)setColorBarCardSection:(id)a3
{
}

- (SFColorBarCardSection)colorBarCardSection
{
  return self->_colorBarCardSection;
}

- (void)setPersonHeaderCardSection:(id)a3
{
}

- (SFPersonHeaderCardSection)personHeaderCardSection
{
  return self->_personHeaderCardSection;
}

- (void)setGridCardSection:(id)a3
{
}

- (SFGridCardSection)gridCardSection
{
  return self->_gridCardSection;
}

- (void)setAttributionFooterCardSection:(id)a3
{
}

- (SFAttributionFooterCardSection)attributionFooterCardSection
{
  return self->_attributionFooterCardSection;
}

- (void)setWorldMapCardSection:(id)a3
{
}

- (SFWorldMapCardSection)worldMapCardSection
{
  return self->_worldMapCardSection;
}

- (void)setCompactRowCardSection:(id)a3
{
}

- (SFCompactRowCardSection)compactRowCardSection
{
  return self->_compactRowCardSection;
}

- (void)setMapPlaceCardSection:(id)a3
{
}

- (SFMapPlaceCardSection)mapPlaceCardSection
{
  return self->_mapPlaceCardSection;
}

- (void)setMediaRemoteControlCardSection:(id)a3
{
}

- (SFMediaRemoteControlCardSection)mediaRemoteControlCardSection
{
  return self->_mediaRemoteControlCardSection;
}

- (void)setHorizontalScrollCardSection:(id)a3
{
}

- (SFHorizontalScrollCardSection)horizontalScrollCardSection
{
  return self->_horizontalScrollCardSection;
}

- (void)setProductCardSection:(id)a3
{
}

- (SFProductCardSection)productCardSection
{
  return self->_productCardSection;
}

- (void)setVerticalLayoutCardSection:(id)a3
{
}

- (SFVerticalLayoutCardSection)verticalLayoutCardSection
{
  return self->_verticalLayoutCardSection;
}

- (void)setHorizontalButtonCardSection:(id)a3
{
}

- (SFHorizontalButtonCardSection)horizontalButtonCardSection
{
  return self->_horizontalButtonCardSection;
}

- (void)setButtonCardSection:(id)a3
{
}

- (SFButtonCardSection)buttonCardSection
{
  return self->_buttonCardSection;
}

- (void)setMapsDetailedRowCardSection:(id)a3
{
}

- (SFMapsDetailedRowCardSection)mapsDetailedRowCardSection
{
  return self->_mapsDetailedRowCardSection;
}

- (void)setWatchListCardSection:(id)a3
{
}

- (SFWatchListCardSection)watchListCardSection
{
  return self->_watchListCardSection;
}

- (void)setMetaInfoCardSection:(id)a3
{
}

- (SFMetaInfoCardSection)metaInfoCardSection
{
  return self->_metaInfoCardSection;
}

- (void)setSectionHeaderCardSection:(id)a3
{
}

- (SFSectionHeaderCardSection)sectionHeaderCardSection
{
  return self->_sectionHeaderCardSection;
}

- (void)setSelectableGridCardSection:(id)a3
{
}

- (SFSelectableGridCardSection)selectableGridCardSection
{
  return self->_selectableGridCardSection;
}

- (void)setSuggestionCardSection:(id)a3
{
}

- (SFSuggestionCardSection)suggestionCardSection
{
  return self->_suggestionCardSection;
}

- (void)setImagesCardSection:(id)a3
{
}

- (SFImagesCardSection)imagesCardSection
{
  return self->_imagesCardSection;
}

- (void)setDetailedRowCardSection:(id)a3
{
}

- (SFDetailedRowCardSection)detailedRowCardSection
{
  return self->_detailedRowCardSection;
}

- (void)setMessageCardSection:(id)a3
{
}

- (SFMessageCardSection)messageCardSection
{
  return self->_messageCardSection;
}

- (void)setWebCardSection:(id)a3
{
}

- (SFWebCardSection)webCardSection
{
  return self->_webCardSection;
}

- (void)setActivityIndicatorCardSection:(id)a3
{
}

- (SFActivityIndicatorCardSection)activityIndicatorCardSection
{
  return self->_activityIndicatorCardSection;
}

- (void)setFlightCardSection:(id)a3
{
}

- (SFFlightCardSection)flightCardSection
{
  return self->_flightCardSection;
}

- (void)setAudioPlaybackCardSection:(id)a3
{
}

- (SFAudioPlaybackCardSection)audioPlaybackCardSection
{
  return self->_audioPlaybackCardSection;
}

- (void)setTrackListCardSection:(id)a3
{
}

- (SFTrackListCardSection)trackListCardSection
{
  return self->_trackListCardSection;
}

- (void)setTitleCardSection:(id)a3
{
}

- (SFTitleCardSection)titleCardSection
{
  return self->_titleCardSection;
}

- (void)setTextColumnsCardSection:(id)a3
{
}

- (SFTextColumnsCardSection)textColumnsCardSection
{
  return self->_textColumnsCardSection;
}

- (void)setTableRowCardSection:(id)a3
{
}

- (SFTableRowCardSection)tableRowCardSection
{
  return self->_tableRowCardSection;
}

- (void)setTableHeaderRowCardSection:(id)a3
{
}

- (SFTableHeaderRowCardSection)tableHeaderRowCardSection
{
  return self->_tableHeaderRowCardSection;
}

- (void)setStockChartCardSection:(id)a3
{
}

- (SFStockChartCardSection)stockChartCardSection
{
  return self->_stockChartCardSection;
}

- (void)setSocialMediaPostCardSection:(id)a3
{
}

- (SFSocialMediaPostCardSection)socialMediaPostCardSection
{
  return self->_socialMediaPostCardSection;
}

- (void)setScoreboardCardSection:(id)a3
{
}

- (SFScoreboardCardSection)scoreboardCardSection
{
  return self->_scoreboardCardSection;
}

- (void)setRowCardSection:(id)a3
{
}

- (SFRowCardSection)rowCardSection
{
  return self->_rowCardSection;
}

- (void)setRichTitleCardSection:(id)a3
{
}

- (SFRichTitleCardSection)richTitleCardSection
{
  return self->_richTitleCardSection;
}

- (void)setNowPlayingCardSection:(id)a3
{
}

- (SFNowPlayingCardSection)nowPlayingCardSection
{
  return self->_nowPlayingCardSection;
}

- (void)setMediaPlayerCardSection:(id)a3
{
}

- (SFMediaPlayerCardSection)mediaPlayerCardSection
{
  return self->_mediaPlayerCardSection;
}

- (void)setMediaInfoCardSection:(id)a3
{
}

- (SFMediaInfoCardSection)mediaInfoCardSection
{
  return self->_mediaInfoCardSection;
}

- (void)setMapCardSection:(id)a3
{
}

- (SFMapCardSection)mapCardSection
{
  return self->_mapCardSection;
}

- (void)setKeyValueDataCardSection:(id)a3
{
}

- (SFKeyValueDataCardSection)keyValueDataCardSection
{
  return self->_keyValueDataCardSection;
}

- (void)setDescriptionCardSection:(id)a3
{
}

- (SFDescriptionCardSection)descriptionCardSection
{
  return self->_descriptionCardSection;
}

- (void)setAppLinkCardSection:(id)a3
{
}

- (SFAppLinkCardSection)appLinkCardSection
{
  return self->_appLinkCardSection;
}

- (unint64_t)hash
{
  v223 = [(SFCardSectionValue *)self appLinkCardSection];
  uint64_t v3 = [v223 hash];
  v222 = [(SFCardSectionValue *)self descriptionCardSection];
  uint64_t v4 = [v222 hash] ^ v3;
  v221 = [(SFCardSectionValue *)self keyValueDataCardSection];
  uint64_t v5 = [v221 hash];
  v220 = [(SFCardSectionValue *)self mapCardSection];
  uint64_t v6 = v4 ^ v5 ^ [v220 hash];
  v219 = [(SFCardSectionValue *)self mediaInfoCardSection];
  uint64_t v7 = [v219 hash];
  v218 = [(SFCardSectionValue *)self mediaPlayerCardSection];
  uint64_t v8 = v7 ^ [v218 hash];
  v217 = [(SFCardSectionValue *)self nowPlayingCardSection];
  uint64_t v9 = v6 ^ v8 ^ [v217 hash];
  v216 = [(SFCardSectionValue *)self richTitleCardSection];
  uint64_t v10 = [v216 hash];
  v215 = [(SFCardSectionValue *)self rowCardSection];
  uint64_t v11 = v10 ^ [v215 hash];
  v214 = [(SFCardSectionValue *)self scoreboardCardSection];
  uint64_t v12 = v11 ^ [v214 hash];
  v213 = [(SFCardSectionValue *)self socialMediaPostCardSection];
  uint64_t v13 = v9 ^ v12 ^ [v213 hash];
  v212 = [(SFCardSectionValue *)self stockChartCardSection];
  uint64_t v14 = [v212 hash];
  v211 = [(SFCardSectionValue *)self tableHeaderRowCardSection];
  uint64_t v15 = v14 ^ [v211 hash];
  v210 = [(SFCardSectionValue *)self tableRowCardSection];
  uint64_t v16 = v15 ^ [v210 hash];
  v209 = [(SFCardSectionValue *)self textColumnsCardSection];
  uint64_t v17 = v16 ^ [v209 hash];
  v208 = [(SFCardSectionValue *)self titleCardSection];
  uint64_t v18 = v13 ^ v17 ^ [v208 hash];
  v207 = [(SFCardSectionValue *)self trackListCardSection];
  uint64_t v19 = [v207 hash];
  v206 = [(SFCardSectionValue *)self audioPlaybackCardSection];
  uint64_t v20 = v19 ^ [v206 hash];
  v205 = [(SFCardSectionValue *)self flightCardSection];
  uint64_t v21 = v20 ^ [v205 hash];
  v204 = [(SFCardSectionValue *)self activityIndicatorCardSection];
  uint64_t v22 = v21 ^ [v204 hash];
  v203 = [(SFCardSectionValue *)self webCardSection];
  uint64_t v23 = v22 ^ [v203 hash];
  v202 = [(SFCardSectionValue *)self messageCardSection];
  uint64_t v24 = v18 ^ v23 ^ [v202 hash];
  v201 = [(SFCardSectionValue *)self detailedRowCardSection];
  uint64_t v25 = [v201 hash];
  v200 = [(SFCardSectionValue *)self imagesCardSection];
  uint64_t v26 = v25 ^ [v200 hash];
  v199 = [(SFCardSectionValue *)self suggestionCardSection];
  uint64_t v27 = v26 ^ [v199 hash];
  v198 = [(SFCardSectionValue *)self selectableGridCardSection];
  uint64_t v28 = v27 ^ [v198 hash];
  v197 = [(SFCardSectionValue *)self sectionHeaderCardSection];
  uint64_t v29 = v28 ^ [v197 hash];
  v196 = [(SFCardSectionValue *)self metaInfoCardSection];
  uint64_t v30 = v29 ^ [v196 hash];
  v195 = [(SFCardSectionValue *)self watchListCardSection];
  uint64_t v31 = v24 ^ v30 ^ [v195 hash];
  v194 = [(SFCardSectionValue *)self mapsDetailedRowCardSection];
  uint64_t v32 = [v194 hash];
  v193 = [(SFCardSectionValue *)self buttonCardSection];
  uint64_t v33 = v32 ^ [v193 hash];
  v192 = [(SFCardSectionValue *)self horizontalButtonCardSection];
  uint64_t v34 = v33 ^ [v192 hash];
  v191 = [(SFCardSectionValue *)self verticalLayoutCardSection];
  uint64_t v35 = v34 ^ [v191 hash];
  v190 = [(SFCardSectionValue *)self productCardSection];
  uint64_t v36 = v35 ^ [v190 hash];
  v189 = [(SFCardSectionValue *)self horizontalScrollCardSection];
  uint64_t v37 = v36 ^ [v189 hash];
  v188 = [(SFCardSectionValue *)self mediaRemoteControlCardSection];
  uint64_t v38 = v37 ^ [v188 hash];
  v187 = [(SFCardSectionValue *)self mapPlaceCardSection];
  uint64_t v39 = v31 ^ v38 ^ [v187 hash];
  v186 = [(SFCardSectionValue *)self compactRowCardSection];
  uint64_t v40 = [v186 hash];
  v185 = [(SFCardSectionValue *)self worldMapCardSection];
  uint64_t v41 = v40 ^ [v185 hash];
  v184 = [(SFCardSectionValue *)self attributionFooterCardSection];
  uint64_t v42 = v41 ^ [v184 hash];
  v183 = [(SFCardSectionValue *)self gridCardSection];
  uint64_t v43 = v42 ^ [v183 hash];
  v182 = [(SFCardSectionValue *)self personHeaderCardSection];
  uint64_t v44 = v43 ^ [v182 hash];
  v181 = [(SFCardSectionValue *)self colorBarCardSection];
  uint64_t v45 = v44 ^ [v181 hash];
  v180 = [(SFCardSectionValue *)self splitCardSection];
  uint64_t v46 = v45 ^ [v180 hash];
  v179 = [(SFCardSectionValue *)self linkPresentationCardSection];
  uint64_t v47 = v46 ^ [v179 hash];
  v178 = [(SFCardSectionValue *)self findMyCardSection];
  uint64_t v48 = v39 ^ v47 ^ [v178 hash];
  v177 = [(SFCardSectionValue *)self heroCardSection];
  uint64_t v49 = [v177 hash];
  v176 = [(SFCardSectionValue *)self newsCardSection];
  uint64_t v50 = v49 ^ [v176 hash];
  v175 = [(SFCardSectionValue *)self miniCardSection];
  uint64_t v51 = v50 ^ [v175 hash];
  v174 = [(SFCardSectionValue *)self infoCardSection];
  uint64_t v52 = v51 ^ [v174 hash];
  v173 = [(SFCardSectionValue *)self collectionCardSection];
  uint64_t v53 = v52 ^ [v173 hash];
  v172 = [(SFCardSectionValue *)self combinedCardSection];
  uint64_t v54 = v53 ^ [v172 hash];
  v171 = [(SFCardSectionValue *)self responseWrapperCardSection];
  uint64_t v55 = v54 ^ [v171 hash];
  v170 = [(SFCardSectionValue *)self listenToCardSection];
  uint64_t v56 = v55 ^ [v170 hash];
  v169 = [(SFCardSectionValue *)self watchNowCardSection];
  uint64_t v57 = v56 ^ [v169 hash];
  v168 = [(SFCardSectionValue *)self strokeAnimationCardSection];
  uint64_t v58 = v48 ^ v57 ^ [v168 hash];
  v167 = [(SFCardSectionValue *)self buttonListCardSection];
  uint64_t v59 = [v167 hash];
  v166 = [(SFCardSectionValue *)self commandRowCardSection];
  uint64_t v60 = v59 ^ [v166 hash];
  v165 = [(SFCardSectionValue *)self leadingTrailingCardSection];
  uint64_t v61 = v60 ^ [v165 hash];
  v164 = [(SFCardSectionValue *)self heroTitleCardSection];
  uint64_t v62 = v61 ^ [v164 hash];
  v163 = [(SFCardSectionValue *)self archiveViewCardSection];
  uint64_t v63 = v62 ^ [v163 hash];
  v162 = [(SFCardSectionValue *)self appIconCardSection];
  uint64_t v64 = v63 ^ [v162 hash];
  v161 = [(SFCardSectionValue *)self largeTitleDetailedRowCardSection];
  uint64_t v65 = v64 ^ [v161 hash];
  v160 = [(SFCardSectionValue *)self safariTableOfContentsCardSection];
  uint64_t v66 = v65 ^ [v160 hash];
  v159 = [(SFCardSectionValue *)self rfSummaryItemShortNumberCardSection];
  uint64_t v67 = v66 ^ [v159 hash];
  v158 = [(SFCardSectionValue *)self rfSummaryItemTextCardSection];
  uint64_t v68 = v67 ^ [v158 hash];
  v157 = [(SFCardSectionValue *)self rfSummaryItemStandardCardSection];
  uint64_t v69 = v58 ^ v68 ^ [v157 hash];
  v156 = [(SFCardSectionValue *)self rfFactItemShortNumberCardSection];
  uint64_t v70 = [v156 hash];
  v155 = [(SFCardSectionValue *)self rfFactItemStandardCardSection];
  uint64_t v71 = v70 ^ [v155 hash];
  v154 = [(SFCardSectionValue *)self rfLongItemStandardCardSection];
  uint64_t v72 = v71 ^ [v154 hash];
  v153 = [(SFCardSectionValue *)self rfPrimaryHeaderRichCardSection];
  uint64_t v73 = v72 ^ [v153 hash];
  v152 = [(SFCardSectionValue *)self rfPrimaryHeaderStandardCardSection];
  uint64_t v74 = v73 ^ [v152 hash];
  v151 = [(SFCardSectionValue *)self rfReferenceFootnoteCardSection];
  uint64_t v75 = v74 ^ [v151 hash];
  v150 = [(SFCardSectionValue *)self rfReferenceRichCardSection];
  uint64_t v76 = v75 ^ [v150 hash];
  v149 = [(SFCardSectionValue *)self rfSimpleItemRichCardSection];
  uint64_t v77 = v76 ^ [v149 hash];
  v148 = [(SFCardSectionValue *)self rfSimpleItemStandardCardSection];
  uint64_t v78 = v77 ^ [v148 hash];
  v147 = [(SFCardSectionValue *)self rfSummaryItemAlignedTextCardSection];
  uint64_t v79 = v78 ^ [v147 hash];
  v146 = [(SFCardSectionValue *)self rfExpandableStandardCardSection];
  uint64_t v80 = v79 ^ [v146 hash];
  v145 = [(SFCardSectionValue *)self rfFactItemButtonCardSection];
  uint64_t v81 = v69 ^ v80 ^ [v145 hash];
  v144 = [(SFCardSectionValue *)self rfFactItemHeroNumberCardSection];
  uint64_t v82 = [v144 hash];
  v143 = [(SFCardSectionValue *)self rfPrimaryHeaderMarqueeCardSection];
  uint64_t v83 = v82 ^ [v143 hash];
  v142 = [(SFCardSectionValue *)self rfSummaryItemDetailedTextCardSection];
  uint64_t v84 = v83 ^ [v142 hash];
  v141 = [(SFCardSectionValue *)self rfSimpleItemPlayerCardSection];
  uint64_t v85 = v84 ^ [v141 hash];
  v140 = [(SFCardSectionValue *)self rfSummaryItemPairCardSection];
  uint64_t v86 = v85 ^ [v140 hash];
  v139 = [(SFCardSectionValue *)self rfSummaryItemPairNumberCardSection];
  uint64_t v87 = v86 ^ [v139 hash];
  v138 = [(SFCardSectionValue *)self rfFactItemShortHeroNumberCardSection];
  uint64_t v88 = v87 ^ [v138 hash];
  v137 = [(SFCardSectionValue *)self rfFactItemDetailedNumberCardSection];
  uint64_t v89 = v88 ^ [v137 hash];
  v136 = [(SFCardSectionValue *)self rfFactItemHeroButtonCardSection];
  uint64_t v90 = v89 ^ [v136 hash];
  v135 = [(SFCardSectionValue *)self rfFactItemImageRightCardSection];
  uint64_t v91 = v90 ^ [v135 hash];
  v134 = [(SFCardSectionValue *)self rfSummaryItemSwitchV2CardSection];
  uint64_t v92 = v91 ^ [v134 hash];
  v133 = [(SFCardSectionValue *)self rfTableHeaderCardSection];
  uint64_t v93 = v92 ^ [v133 hash];
  v132 = [(SFCardSectionValue *)self rfTableRowCardSection];
  uint64_t v94 = v81 ^ v93 ^ [v132 hash];
  v131 = [(SFCardSectionValue *)self rfSimpleItemVisualElementCardSection];
  uint64_t v95 = [v131 hash];
  v130 = [(SFCardSectionValue *)self rfSummaryItemPlayerCardSection];
  uint64_t v96 = v95 ^ [v130 hash];
  v129 = [(SFCardSectionValue *)self rfSummaryItemImageRightCardSection];
  uint64_t v97 = v96 ^ [v129 hash];
  v128 = [(SFCardSectionValue *)self rfSummaryItemButtonCardSection];
  uint64_t v98 = v97 ^ [v128 hash];
  v127 = [(SFCardSectionValue *)self rfSimpleItemReverseRichCardSection];
  uint64_t v99 = v98 ^ [v127 hash];
  v126 = [(SFCardSectionValue *)self rfSimpleItemRichSearchResultCardSection];
  uint64_t v100 = v99 ^ [v126 hash];
  v125 = [(SFCardSectionValue *)self rfPrimaryHeaderStackedImageCardSection];
  uint64_t v101 = v100 ^ [v125 hash];
  v124 = [(SFCardSectionValue *)self rfReferenceItemLogoCardSection];
  uint64_t v102 = v101 ^ [v124 hash];
  v123 = [(SFCardSectionValue *)self rfReferenceItemButtonCardSection];
  uint64_t v103 = v102 ^ [v123 hash];
  v122 = [(SFCardSectionValue *)self rfButtonCardSection];
  uint64_t v104 = v103 ^ [v122 hash];
  v105 = [(SFCardSectionValue *)self rfBinaryButtonCardSection];
  uint64_t v106 = v104 ^ [v105 hash];
  v107 = [(SFCardSectionValue *)self rfReferenceCenteredCardSection];
  uint64_t v108 = v106 ^ [v107 hash];
  v109 = [(SFCardSectionValue *)self rfSecondaryHeaderStandardCardSection];
  uint64_t v110 = v108 ^ [v109 hash];
  v111 = [(SFCardSectionValue *)self rfSecondaryHeaderEmphasizedCardSection];
  uint64_t v112 = v94 ^ v110 ^ [v111 hash];
  v113 = [(SFCardSectionValue *)self rfMapCardSection];
  uint64_t v114 = [v113 hash];
  v115 = [(SFCardSectionValue *)self rfReferenceStandardCardSection];
  uint64_t v116 = v114 ^ [v115 hash];
  v117 = [(SFCardSectionValue *)self rfMultiButtonCardSection];
  uint64_t v118 = v116 ^ [v117 hash];
  v119 = [(SFCardSectionValue *)self rfDisambiguationTitleCardSection];
  unint64_t v120 = v112 ^ v118 ^ [v119 hash];

  return v120;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFCardSectionValue *)self appLinkCardSection];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setAppLinkCardSection:v6];

  uint64_t v7 = [(SFCardSectionValue *)self descriptionCardSection];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setDescriptionCardSection:v8];

  uint64_t v9 = [(SFCardSectionValue *)self keyValueDataCardSection];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setKeyValueDataCardSection:v10];

  uint64_t v11 = [(SFCardSectionValue *)self mapCardSection];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setMapCardSection:v12];

  uint64_t v13 = [(SFCardSectionValue *)self mediaInfoCardSection];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setMediaInfoCardSection:v14];

  uint64_t v15 = [(SFCardSectionValue *)self mediaPlayerCardSection];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setMediaPlayerCardSection:v16];

  uint64_t v17 = [(SFCardSectionValue *)self nowPlayingCardSection];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setNowPlayingCardSection:v18];

  uint64_t v19 = [(SFCardSectionValue *)self richTitleCardSection];
  uint64_t v20 = (void *)[v19 copy];
  [v4 setRichTitleCardSection:v20];

  uint64_t v21 = [(SFCardSectionValue *)self rowCardSection];
  uint64_t v22 = (void *)[v21 copy];
  [v4 setRowCardSection:v22];

  uint64_t v23 = [(SFCardSectionValue *)self scoreboardCardSection];
  uint64_t v24 = (void *)[v23 copy];
  [v4 setScoreboardCardSection:v24];

  uint64_t v25 = [(SFCardSectionValue *)self socialMediaPostCardSection];
  uint64_t v26 = (void *)[v25 copy];
  [v4 setSocialMediaPostCardSection:v26];

  uint64_t v27 = [(SFCardSectionValue *)self stockChartCardSection];
  uint64_t v28 = (void *)[v27 copy];
  [v4 setStockChartCardSection:v28];

  uint64_t v29 = [(SFCardSectionValue *)self tableHeaderRowCardSection];
  uint64_t v30 = (void *)[v29 copy];
  [v4 setTableHeaderRowCardSection:v30];

  uint64_t v31 = [(SFCardSectionValue *)self tableRowCardSection];
  uint64_t v32 = (void *)[v31 copy];
  [v4 setTableRowCardSection:v32];

  uint64_t v33 = [(SFCardSectionValue *)self textColumnsCardSection];
  uint64_t v34 = (void *)[v33 copy];
  [v4 setTextColumnsCardSection:v34];

  uint64_t v35 = [(SFCardSectionValue *)self titleCardSection];
  uint64_t v36 = (void *)[v35 copy];
  [v4 setTitleCardSection:v36];

  uint64_t v37 = [(SFCardSectionValue *)self trackListCardSection];
  uint64_t v38 = (void *)[v37 copy];
  [v4 setTrackListCardSection:v38];

  uint64_t v39 = [(SFCardSectionValue *)self audioPlaybackCardSection];
  uint64_t v40 = (void *)[v39 copy];
  [v4 setAudioPlaybackCardSection:v40];

  uint64_t v41 = [(SFCardSectionValue *)self flightCardSection];
  uint64_t v42 = (void *)[v41 copy];
  [v4 setFlightCardSection:v42];

  uint64_t v43 = [(SFCardSectionValue *)self activityIndicatorCardSection];
  uint64_t v44 = (void *)[v43 copy];
  [v4 setActivityIndicatorCardSection:v44];

  uint64_t v45 = [(SFCardSectionValue *)self webCardSection];
  uint64_t v46 = (void *)[v45 copy];
  [v4 setWebCardSection:v46];

  uint64_t v47 = [(SFCardSectionValue *)self messageCardSection];
  uint64_t v48 = (void *)[v47 copy];
  [v4 setMessageCardSection:v48];

  uint64_t v49 = [(SFCardSectionValue *)self detailedRowCardSection];
  uint64_t v50 = (void *)[v49 copy];
  [v4 setDetailedRowCardSection:v50];

  uint64_t v51 = [(SFCardSectionValue *)self imagesCardSection];
  uint64_t v52 = (void *)[v51 copy];
  [v4 setImagesCardSection:v52];

  uint64_t v53 = [(SFCardSectionValue *)self suggestionCardSection];
  uint64_t v54 = (void *)[v53 copy];
  [v4 setSuggestionCardSection:v54];

  uint64_t v55 = [(SFCardSectionValue *)self selectableGridCardSection];
  uint64_t v56 = (void *)[v55 copy];
  [v4 setSelectableGridCardSection:v56];

  uint64_t v57 = [(SFCardSectionValue *)self sectionHeaderCardSection];
  uint64_t v58 = (void *)[v57 copy];
  [v4 setSectionHeaderCardSection:v58];

  uint64_t v59 = [(SFCardSectionValue *)self metaInfoCardSection];
  uint64_t v60 = (void *)[v59 copy];
  [v4 setMetaInfoCardSection:v60];

  uint64_t v61 = [(SFCardSectionValue *)self watchListCardSection];
  uint64_t v62 = (void *)[v61 copy];
  [v4 setWatchListCardSection:v62];

  uint64_t v63 = [(SFCardSectionValue *)self mapsDetailedRowCardSection];
  uint64_t v64 = (void *)[v63 copy];
  [v4 setMapsDetailedRowCardSection:v64];

  uint64_t v65 = [(SFCardSectionValue *)self buttonCardSection];
  uint64_t v66 = (void *)[v65 copy];
  [v4 setButtonCardSection:v66];

  uint64_t v67 = [(SFCardSectionValue *)self horizontalButtonCardSection];
  uint64_t v68 = (void *)[v67 copy];
  [v4 setHorizontalButtonCardSection:v68];

  uint64_t v69 = [(SFCardSectionValue *)self verticalLayoutCardSection];
  uint64_t v70 = (void *)[v69 copy];
  [v4 setVerticalLayoutCardSection:v70];

  uint64_t v71 = [(SFCardSectionValue *)self productCardSection];
  uint64_t v72 = (void *)[v71 copy];
  [v4 setProductCardSection:v72];

  uint64_t v73 = [(SFCardSectionValue *)self horizontalScrollCardSection];
  uint64_t v74 = (void *)[v73 copy];
  [v4 setHorizontalScrollCardSection:v74];

  uint64_t v75 = [(SFCardSectionValue *)self mediaRemoteControlCardSection];
  uint64_t v76 = (void *)[v75 copy];
  [v4 setMediaRemoteControlCardSection:v76];

  uint64_t v77 = [(SFCardSectionValue *)self mapPlaceCardSection];
  uint64_t v78 = (void *)[v77 copy];
  [v4 setMapPlaceCardSection:v78];

  uint64_t v79 = [(SFCardSectionValue *)self compactRowCardSection];
  uint64_t v80 = (void *)[v79 copy];
  [v4 setCompactRowCardSection:v80];

  uint64_t v81 = [(SFCardSectionValue *)self worldMapCardSection];
  uint64_t v82 = (void *)[v81 copy];
  [v4 setWorldMapCardSection:v82];

  uint64_t v83 = [(SFCardSectionValue *)self attributionFooterCardSection];
  uint64_t v84 = (void *)[v83 copy];
  [v4 setAttributionFooterCardSection:v84];

  uint64_t v85 = [(SFCardSectionValue *)self gridCardSection];
  uint64_t v86 = (void *)[v85 copy];
  [v4 setGridCardSection:v86];

  uint64_t v87 = [(SFCardSectionValue *)self personHeaderCardSection];
  uint64_t v88 = (void *)[v87 copy];
  [v4 setPersonHeaderCardSection:v88];

  uint64_t v89 = [(SFCardSectionValue *)self colorBarCardSection];
  uint64_t v90 = (void *)[v89 copy];
  [v4 setColorBarCardSection:v90];

  uint64_t v91 = [(SFCardSectionValue *)self splitCardSection];
  uint64_t v92 = (void *)[v91 copy];
  [v4 setSplitCardSection:v92];

  uint64_t v93 = [(SFCardSectionValue *)self linkPresentationCardSection];
  uint64_t v94 = (void *)[v93 copy];
  [v4 setLinkPresentationCardSection:v94];

  uint64_t v95 = [(SFCardSectionValue *)self findMyCardSection];
  uint64_t v96 = (void *)[v95 copy];
  [v4 setFindMyCardSection:v96];

  uint64_t v97 = [(SFCardSectionValue *)self heroCardSection];
  uint64_t v98 = (void *)[v97 copy];
  [v4 setHeroCardSection:v98];

  uint64_t v99 = [(SFCardSectionValue *)self newsCardSection];
  uint64_t v100 = (void *)[v99 copy];
  [v4 setNewsCardSection:v100];

  uint64_t v101 = [(SFCardSectionValue *)self miniCardSection];
  uint64_t v102 = (void *)[v101 copy];
  [v4 setMiniCardSection:v102];

  uint64_t v103 = [(SFCardSectionValue *)self infoCardSection];
  uint64_t v104 = (void *)[v103 copy];
  [v4 setInfoCardSection:v104];

  v105 = [(SFCardSectionValue *)self collectionCardSection];
  uint64_t v106 = (void *)[v105 copy];
  [v4 setCollectionCardSection:v106];

  v107 = [(SFCardSectionValue *)self combinedCardSection];
  uint64_t v108 = (void *)[v107 copy];
  [v4 setCombinedCardSection:v108];

  v109 = [(SFCardSectionValue *)self responseWrapperCardSection];
  uint64_t v110 = (void *)[v109 copy];
  [v4 setResponseWrapperCardSection:v110];

  v111 = [(SFCardSectionValue *)self listenToCardSection];
  uint64_t v112 = (void *)[v111 copy];
  [v4 setListenToCardSection:v112];

  v113 = [(SFCardSectionValue *)self watchNowCardSection];
  uint64_t v114 = (void *)[v113 copy];
  [v4 setWatchNowCardSection:v114];

  v115 = [(SFCardSectionValue *)self strokeAnimationCardSection];
  uint64_t v116 = (void *)[v115 copy];
  [v4 setStrokeAnimationCardSection:v116];

  v117 = [(SFCardSectionValue *)self buttonListCardSection];
  uint64_t v118 = (void *)[v117 copy];
  [v4 setButtonListCardSection:v118];

  v119 = [(SFCardSectionValue *)self commandRowCardSection];
  unint64_t v120 = (void *)[v119 copy];
  [v4 setCommandRowCardSection:v120];

  v121 = [(SFCardSectionValue *)self leadingTrailingCardSection];
  v122 = (void *)[v121 copy];
  [v4 setLeadingTrailingCardSection:v122];

  v123 = [(SFCardSectionValue *)self heroTitleCardSection];
  v124 = (void *)[v123 copy];
  [v4 setHeroTitleCardSection:v124];

  v125 = [(SFCardSectionValue *)self archiveViewCardSection];
  v126 = (void *)[v125 copy];
  [v4 setArchiveViewCardSection:v126];

  v127 = [(SFCardSectionValue *)self appIconCardSection];
  v128 = (void *)[v127 copy];
  [v4 setAppIconCardSection:v128];

  v129 = [(SFCardSectionValue *)self largeTitleDetailedRowCardSection];
  v130 = (void *)[v129 copy];
  [v4 setLargeTitleDetailedRowCardSection:v130];

  v131 = [(SFCardSectionValue *)self safariTableOfContentsCardSection];
  v132 = (void *)[v131 copy];
  [v4 setSafariTableOfContentsCardSection:v132];

  v133 = [(SFCardSectionValue *)self rfSummaryItemShortNumberCardSection];
  v134 = (void *)[v133 copy];
  [v4 setRfSummaryItemShortNumberCardSection:v134];

  v135 = [(SFCardSectionValue *)self rfSummaryItemTextCardSection];
  v136 = (void *)[v135 copy];
  [v4 setRfSummaryItemTextCardSection:v136];

  v137 = [(SFCardSectionValue *)self rfSummaryItemStandardCardSection];
  v138 = (void *)[v137 copy];
  [v4 setRfSummaryItemStandardCardSection:v138];

  v139 = [(SFCardSectionValue *)self rfFactItemShortNumberCardSection];
  v140 = (void *)[v139 copy];
  [v4 setRfFactItemShortNumberCardSection:v140];

  v141 = [(SFCardSectionValue *)self rfFactItemStandardCardSection];
  v142 = (void *)[v141 copy];
  [v4 setRfFactItemStandardCardSection:v142];

  v143 = [(SFCardSectionValue *)self rfLongItemStandardCardSection];
  v144 = (void *)[v143 copy];
  [v4 setRfLongItemStandardCardSection:v144];

  v145 = [(SFCardSectionValue *)self rfPrimaryHeaderRichCardSection];
  v146 = (void *)[v145 copy];
  [v4 setRfPrimaryHeaderRichCardSection:v146];

  v147 = [(SFCardSectionValue *)self rfPrimaryHeaderStandardCardSection];
  v148 = (void *)[v147 copy];
  [v4 setRfPrimaryHeaderStandardCardSection:v148];

  v149 = [(SFCardSectionValue *)self rfReferenceFootnoteCardSection];
  v150 = (void *)[v149 copy];
  [v4 setRfReferenceFootnoteCardSection:v150];

  v151 = [(SFCardSectionValue *)self rfReferenceRichCardSection];
  v152 = (void *)[v151 copy];
  [v4 setRfReferenceRichCardSection:v152];

  v153 = [(SFCardSectionValue *)self rfSimpleItemRichCardSection];
  v154 = (void *)[v153 copy];
  [v4 setRfSimpleItemRichCardSection:v154];

  v155 = [(SFCardSectionValue *)self rfSimpleItemStandardCardSection];
  v156 = (void *)[v155 copy];
  [v4 setRfSimpleItemStandardCardSection:v156];

  v157 = [(SFCardSectionValue *)self rfSummaryItemAlignedTextCardSection];
  v158 = (void *)[v157 copy];
  [v4 setRfSummaryItemAlignedTextCardSection:v158];

  v159 = [(SFCardSectionValue *)self rfExpandableStandardCardSection];
  v160 = (void *)[v159 copy];
  [v4 setRfExpandableStandardCardSection:v160];

  v161 = [(SFCardSectionValue *)self rfFactItemButtonCardSection];
  v162 = (void *)[v161 copy];
  [v4 setRfFactItemButtonCardSection:v162];

  v163 = [(SFCardSectionValue *)self rfFactItemHeroNumberCardSection];
  v164 = (void *)[v163 copy];
  [v4 setRfFactItemHeroNumberCardSection:v164];

  v165 = [(SFCardSectionValue *)self rfPrimaryHeaderMarqueeCardSection];
  v166 = (void *)[v165 copy];
  [v4 setRfPrimaryHeaderMarqueeCardSection:v166];

  v167 = [(SFCardSectionValue *)self rfSummaryItemDetailedTextCardSection];
  v168 = (void *)[v167 copy];
  [v4 setRfSummaryItemDetailedTextCardSection:v168];

  v169 = [(SFCardSectionValue *)self rfSimpleItemPlayerCardSection];
  v170 = (void *)[v169 copy];
  [v4 setRfSimpleItemPlayerCardSection:v170];

  v171 = [(SFCardSectionValue *)self rfSummaryItemPairCardSection];
  v172 = (void *)[v171 copy];
  [v4 setRfSummaryItemPairCardSection:v172];

  v173 = [(SFCardSectionValue *)self rfSummaryItemPairNumberCardSection];
  v174 = (void *)[v173 copy];
  [v4 setRfSummaryItemPairNumberCardSection:v174];

  v175 = [(SFCardSectionValue *)self rfFactItemShortHeroNumberCardSection];
  v176 = (void *)[v175 copy];
  [v4 setRfFactItemShortHeroNumberCardSection:v176];

  v177 = [(SFCardSectionValue *)self rfFactItemDetailedNumberCardSection];
  v178 = (void *)[v177 copy];
  [v4 setRfFactItemDetailedNumberCardSection:v178];

  v179 = [(SFCardSectionValue *)self rfFactItemHeroButtonCardSection];
  v180 = (void *)[v179 copy];
  [v4 setRfFactItemHeroButtonCardSection:v180];

  v181 = [(SFCardSectionValue *)self rfFactItemImageRightCardSection];
  v182 = (void *)[v181 copy];
  [v4 setRfFactItemImageRightCardSection:v182];

  v183 = [(SFCardSectionValue *)self rfSummaryItemSwitchV2CardSection];
  v184 = (void *)[v183 copy];
  [v4 setRfSummaryItemSwitchV2CardSection:v184];

  v185 = [(SFCardSectionValue *)self rfTableHeaderCardSection];
  v186 = (void *)[v185 copy];
  [v4 setRfTableHeaderCardSection:v186];

  v187 = [(SFCardSectionValue *)self rfTableRowCardSection];
  v188 = (void *)[v187 copy];
  [v4 setRfTableRowCardSection:v188];

  v189 = [(SFCardSectionValue *)self rfSimpleItemVisualElementCardSection];
  v190 = (void *)[v189 copy];
  [v4 setRfSimpleItemVisualElementCardSection:v190];

  v191 = [(SFCardSectionValue *)self rfSummaryItemPlayerCardSection];
  v192 = (void *)[v191 copy];
  [v4 setRfSummaryItemPlayerCardSection:v192];

  v193 = [(SFCardSectionValue *)self rfSummaryItemImageRightCardSection];
  v194 = (void *)[v193 copy];
  [v4 setRfSummaryItemImageRightCardSection:v194];

  v195 = [(SFCardSectionValue *)self rfSummaryItemButtonCardSection];
  v196 = (void *)[v195 copy];
  [v4 setRfSummaryItemButtonCardSection:v196];

  v197 = [(SFCardSectionValue *)self rfSimpleItemReverseRichCardSection];
  v198 = (void *)[v197 copy];
  [v4 setRfSimpleItemReverseRichCardSection:v198];

  v199 = [(SFCardSectionValue *)self rfSimpleItemRichSearchResultCardSection];
  v200 = (void *)[v199 copy];
  [v4 setRfSimpleItemRichSearchResultCardSection:v200];

  v201 = [(SFCardSectionValue *)self rfPrimaryHeaderStackedImageCardSection];
  v202 = (void *)[v201 copy];
  [v4 setRfPrimaryHeaderStackedImageCardSection:v202];

  v203 = [(SFCardSectionValue *)self rfReferenceItemLogoCardSection];
  v204 = (void *)[v203 copy];
  [v4 setRfReferenceItemLogoCardSection:v204];

  v205 = [(SFCardSectionValue *)self rfReferenceItemButtonCardSection];
  v206 = (void *)[v205 copy];
  [v4 setRfReferenceItemButtonCardSection:v206];

  v207 = [(SFCardSectionValue *)self rfButtonCardSection];
  v208 = (void *)[v207 copy];
  [v4 setRfButtonCardSection:v208];

  v209 = [(SFCardSectionValue *)self rfBinaryButtonCardSection];
  v210 = (void *)[v209 copy];
  [v4 setRfBinaryButtonCardSection:v210];

  v211 = [(SFCardSectionValue *)self rfReferenceCenteredCardSection];
  v212 = (void *)[v211 copy];
  [v4 setRfReferenceCenteredCardSection:v212];

  v213 = [(SFCardSectionValue *)self rfSecondaryHeaderStandardCardSection];
  v214 = (void *)[v213 copy];
  [v4 setRfSecondaryHeaderStandardCardSection:v214];

  v215 = [(SFCardSectionValue *)self rfSecondaryHeaderEmphasizedCardSection];
  v216 = (void *)[v215 copy];
  [v4 setRfSecondaryHeaderEmphasizedCardSection:v216];

  v217 = [(SFCardSectionValue *)self rfMapCardSection];
  v218 = (void *)[v217 copy];
  [v4 setRfMapCardSection:v218];

  v219 = [(SFCardSectionValue *)self rfReferenceStandardCardSection];
  v220 = (void *)[v219 copy];
  [v4 setRfReferenceStandardCardSection:v220];

  v221 = [(SFCardSectionValue *)self rfMultiButtonCardSection];
  v222 = (void *)[v221 copy];
  [v4 setRfMultiButtonCardSection:v222];

  v223 = [(SFCardSectionValue *)self rfDisambiguationTitleCardSection];
  v224 = (void *)[v223 copy];
  [v4 setRfDisambiguationTitleCardSection:v224];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCardSectionValue alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCardSectionValue *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCardSectionValue alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCardSectionValue *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBCardSectionValue alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCardSectionValue *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCardSectionValue)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBCardSectionValue alloc] initWithData:v5];
  uint64_t v7 = [(SFCardSectionValue *)self initWithProtobuf:v6];

  return v7;
}

@end