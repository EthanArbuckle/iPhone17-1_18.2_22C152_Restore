@interface POIAnnotation
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (AddressBookAddress)address;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLabelPOI;
- (BOOL)isMarkedLocation;
- (BOOL)isVenueOrBuilding;
- (BOOL)showsBalloonCallout;
- (MKMapItem)mapItem;
- (NSSet)keys;
- (NSString)subtitle;
- (NSString)title;
- (POIAnnotation)initWithItem:(id)a3 defaultLocale:(id)a4;
- (ParkedCar)parkedCar;
- (PersonalizedCompoundItem)compoundItem;
- (PersonalizedItem)personalizedItem;
- (PersonalizedItemStyleAttributesAdornment)styleAttributes;
- (SearchDotPlace)searchDotPlace;
- (SearchResult)searchResult;
- (VKLabelMarker)sourceLabelMarker;
- (id)debugDictionary;
- (id)feature;
- (unint64_t)presentationAttributesHash;
- (void)setCoordinate:(id)a3;
@end

@implementation POIAnnotation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundItem, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_subtextLocale, 0);
  objc_storeStrong((id *)&self->_subtext, 0);
  objc_storeStrong((id *)&self->_textLocale, 0);
  objc_storeStrong((id *)&self->_text, 0);

  objc_storeStrong((id *)&self->_customFeature, 0);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (POIAnnotation *)a3;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(POIAnnotation *)self keys];
      v7 = [(POIAnnotation *)v5 keys];

      unsigned __int8 v8 = [v6 intersectsSet:v7];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (POIAnnotation)initWithItem:(id)a3 defaultLocale:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v139.receiver = self;
  v139.super_class = (Class)POIAnnotation;
  v9 = [(POIAnnotation *)&v139 init];
  v10 = v9;
  if (!v9) {
    goto LABEL_46;
  }
  objc_storeStrong((id *)&v9->_compoundItem, a3);
  v10->_presentationAttributesHash = sub_1000ED07C(v7);
  [v7 coordinate];
  double v12 = v11;
  [v7 coordinate];
  v10->_coordinate.double latitude = v12;
  v10->_coordinate.double longitude = v13;
  v10->_showsBalloonCallout = [v7 showsBalloonCallout];
  v10->_sortOrder = (unint64_t)[v7 sortOrder];
  v14 = [v7 title];
  v15 = [v7 subtitle];
  if ([(id)qword_101610F48 length])
  {
    id v16 = (id)qword_101610F48;

    id v8 = v16;
  }
  v17 = [v14 value];
  v18 = [v7 prefix];
  v19 = [v18 value];

  if ([v19 length])
  {
    v20 = +[NSBundle mainBundle];
    v21 = [v20 localizedStringForKey:@"Custom POI title with prefix" value:@"localized string not found" table:0];
    uint64_t v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v21, v19, v17);

    v17 = (void *)v22;
  }
  objc_storeStrong((id *)&v10->_text, v17);
  v23 = [v14 locale];
  if (v23)
  {
    v24 = [v14 locale];
  }
  else
  {
    v24 = (NSString *)v8;
  }
  textLocale = v10->_textLocale;
  v10->_textLocale = v24;

  uint64_t v26 = [v15 value];
  subtext = v10->_subtext;
  v10->_subtext = (NSString *)v26;

  v28 = [v15 locale];
  if (v28)
  {
    v29 = [v15 locale];
  }
  else
  {
    v29 = (NSString *)v8;
  }
  subtextLocale = v10->_subtextLocale;
  v10->_subtextLocale = v29;

  v31 = [v7 labelGeometry];
  v32 = [v31 labelShape];
  id v33 = [v32 count];

  v137 = v15;
  v138 = v14;
  v135 = v19;
  v136 = v17;
  if (v33)
  {
    v34 = [v7 labelGeometry];
    v35 = [v34 labelShape];
    id v36 = [v35 count];

    v37 = malloc_type_malloc(24 * (void)v36, 0x1000040504FFAC1uLL);
    v38 = v37;
    if (v36)
    {
      v39 = 0;
      v40 = v37 + 2;
      do
      {
        v41 = [v7 labelGeometry];
        v42 = [v41 labelShape];
        v43 = [v42 objectAtIndex:v39];

        [v43 lat];
        *(v40 - 2) = v44;
        [v43 lng];
        *(v40 - 1) = v45;
        [v43 elevationM];
        void *v40 = v46;
        v40 += 3;

        ++v39;
      }
      while (v36 != v39);
    }
    v47 = (VKCustomFeature *)[objc_alloc((Class)VKCustomFeature) initLineWithCoordinates:v38 count:v36];
    customFeature = v10->_customFeature;
    v10->_customFeature = v47;

    free(v38);
    goto LABEL_17;
  }
  v53 = [v7 enhancedPlacement];

  if (v53)
  {
    v54 = [v7 enhancedPlacement];
    v55 = [v54 elevationInMeters];

    if (v55)
    {
      double latitude = v10->_coordinate.latitude;
      double longitude = v10->_coordinate.longitude;
      v58 = [v7 enhancedPlacement];
      v59 = [v58 elevationInMeters];
      [v59 doubleValue];
      double v61 = v60;

      v62 = [objc_alloc((Class)VKCustomFeature) initWithCoordinate3D:latitude longitude:longitude v61];
    }
    else
    {
      v62 = [objc_alloc((Class)VKCustomFeature) initWithCoordinate:v10->_coordinate.latitude, v10->_coordinate.longitude];
    }
    v96 = v10->_customFeature;
    v10->_customFeature = v62;

    v97 = [v7 enhancedPlacement];
    v98 = [v97 buildingHeightInMeters];

    if (v98)
    {
      v99 = v10->_customFeature;
      v100 = [v7 enhancedPlacement];
      v101 = [v100 buildingHeightInMeters];
      [v101 floatValue];
      -[VKCustomFeature setBuildingHeight:](v99, "setBuildingHeight:");
    }
    v102 = [v7 enhancedPlacement];
    v103 = [v102 buildingFaceAzimuth];

    if (v103)
    {
      v104 = v10->_customFeature;
      v105 = [v7 enhancedPlacement];
      v106 = [v105 buildingFaceAzimuth];
      [v106 floatValue];
      -[VKCustomFeature setBuildingFaceAzimuth:](v104, "setBuildingFaceAzimuth:");
    }
    goto LABEL_17;
  }
  if (VKLocationCoordinate2DIsValid())
  {
    v87 = [objc_alloc((Class)VKCustomFeature) initWithCoordinate:v10->_coordinate.latitude, v10->_coordinate.longitude];
    v88 = v10->_customFeature;
    v10->_customFeature = v87;

    v89 = [v7 searchResult];
    v90 = [v89 findMyHandle];
    if (v90)
    {

LABEL_50:
      v91 = [v7 searchResult];
      v92 = [v91 findMyHandle];
      v93 = [v92 identifier];
      v94 = v93;
      if (v93)
      {
        id v95 = v93;
      }
      else
      {
        v133 = [v7 searchResult];
        v113 = [v133 autocompletePerson];
        v114 = [v113 handle];
        v115 = [v114 handle];
        uint64_t v116 = [v115 handleIdentifier];

        id v95 = (id)v116;
      }

      v117 = [v7 searchResult];
      v118 = [v117 findMyHandle];
      v119 = [v118 contact];
      v120 = v119;
      if (v119)
      {
        id v121 = v119;
      }
      else
      {
        id v122 = v95;
        v134 = [v7 searchResult];
        v123 = [v134 autocompletePerson];
        v124 = [v123 contact];
        v125 = v124;
        if (v124)
        {
          id v126 = v124;
        }
        else
        {
          id v126 = +[CNContact contactWithDisplayName:0 emailOrPhoneNumber:v122];
        }
        id v121 = v126;

        id v95 = v122;
      }

      if (!v121)
      {
        v129 = sub_1005762E4();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)v142 = "-[POIAnnotation initWithItem:defaultLocale:]";
          *(_WORD *)&v142[8] = 2080;
          *(void *)&v142[10] = "CustomPOIsController.m";
          __int16 v143 = 1024;
          int v144 = 173;
          __int16 v145 = 2080;
          v146 = "contact != nil";
          _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
        }

        if (sub_100BB36BC())
        {
          v130 = sub_1005762E4();
          if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          {
            v131 = +[NSThread callStackSymbols];
            *(_DWORD *)buf = 138412290;
            *(void *)v142 = v131;
            _os_log_impl((void *)&_mh_execute_header, v130, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
      }
      v127 = v10->_customFeature;
      v128 = [v121 identifier];
      [(VKCustomFeature *)v127 setImageProvider:v121 withKey:v128];

      goto LABEL_17;
    }
    v107 = [v7 searchResult];
    v108 = [v107 autocompletePerson];
    uint64_t v109 = [v108 handle];
    if (v109)
    {
      v110 = (void *)v109;
      v111 = [v7 searchResult];
      unsigned int v112 = [v111 locationType];

      if (v112 == 4) {
        goto LABEL_50;
      }
    }
    else
    {
    }
  }
LABEL_17:
  [(VKCustomFeature *)v10->_customFeature setText:v10->_text locale:v10->_textLocale];
  [(VKCustomFeature *)v10->_customFeature setAnnotationText:v10->_subtext locale:v10->_subtextLocale];
  v49 = [v7 styleAttributes];
  v50 = [v49 styleAttributes];
  v51 = v50;
  if (byte_101610F40) {
    id v52 = [v50 copyWithAirportStyleAttributes];
  }
  else {
    id v52 = [v50 copy];
  }
  v63 = v52;

  int v64 = 1;
  if (objc_opt_respondsToSelector())
  {
    if ([v7 isRouteStartOrEnd]) {
      int v64 = 2;
    }
    else {
      int v64 = 1;
    }
  }
  *(_DWORD *)buf = 65567;
  *(_DWORD *)v142 = v64;
  *(void *)&v142[4] = 0x100010024;
  [v63 replaceAttributes:buf count:2];
  v65 = [v7 labelGeometry];
  v66 = [v65 labelShape];
  id v67 = [v66 count];

  if (v67)
  {
    uint64_t v140 = 0x1500000005;
    [v63 replaceAttributes:&v140 count:1];
  }
  objc_storeStrong((id *)&v10->_styleAttributes, v63);
  if (GEOConfigGetBOOL() && [v63 isTransit])
  {
    uint64_t v140 = 0x7F00000006;
    [v63 replaceAttributes:&v140 count:1];
  }
  [(VKCustomFeature *)v10->_customFeature setStyleAttributes:v63];
  if ([v63 isCustomPOI])
  {
    v68 = [v7 clientFeatureID];
    -[VKCustomFeature setClientFeatureID:](v10->_customFeature, "setClientFeatureID:", [v68 clientFeatureID]);
  }
  v10->_isLabelPOI = [v63 isLabelPOI];
  v69 = [v7 mapItem];
  v70 = v69;
  if (v69)
  {
    -[VKCustomFeature setBusinessID:](v10->_customFeature, "setBusinessID:", [v69 _muid]);
    -[VKCustomFeature setFeatureID:](v10->_customFeature, "setFeatureID:", [v70 _customIconID]);
    if ([v70 _hasAreaHighlightId]) {
      -[VKCustomFeature setFeatureID:](v10->_customFeature, "setFeatureID:", [v70 _areaHighlightId]);
    }
    -[VKCustomFeature setSortKey:](v10->_customFeature, "setSortKey:", [v7 sortOrder]);
    v71 = [v70 _venueInfo];
    v72 = v10->_customFeature;
    v73 = [v71 venueIdentifier];
    -[VKCustomFeature setVenueID:](v72, "setVenueID:", [v73 venueID]);

    v132 = v71;
    v74 = [v71 venueIdentifier];
    v75 = [v74 componentIdentifiers];
    v76 = [v75 firstObject];

    -[VKCustomFeature setVenueBuildingID:](v10->_customFeature, "setVenueBuildingID:", [v76 buildingID]);
    v77 = v10->_customFeature;
    v78 = [v76 floorInfo];
    -[VKCustomFeature setVenueLevelID:](v77, "setVenueLevelID:", [v78 levelID]);

    -[VKCustomFeature setVenueComponentID:](v10->_customFeature, "setVenueComponentID:", [v76 unitID]);
    v79 = [v7 searchResult];
    if ([v79 type] == 3 && objc_msgSend(v79, "hasFloorOrdinal"))
    {
      -[VKCustomFeature setVenueFloorOrdinal:](v10->_customFeature, "setVenueFloorOrdinal:", (__int16)[v79 floorOrdinal]);
    }
    else
    {
      v80 = v10->_customFeature;
      [v76 floorInfo];
      v81 = v49;
      v83 = id v82 = v8;
      -[VKCustomFeature setVenueFloorOrdinal:](v80, "setVenueFloorOrdinal:", [v83 ordinal]);

      id v8 = v82;
      v49 = v81;
    }
    BOOL v84 = [v70 _venueFeatureType] == (id)1 || [v70 _venueFeatureType] == (id)2;
    v10->_isVenueOrBuilding = v84;
  }
  v85 = v10;

LABEL_46:
  return v10;
}

- (NSSet)keys
{
  v3 = [(PersonalizedCompoundItem *)self->_compoundItem keys];
  if (v3) {
    [(PersonalizedCompoundItem *)self->_compoundItem keys];
  }
  else {
  v4 = +[NSSet set];
  }

  return (NSSet *)v4;
}

- (unint64_t)presentationAttributesHash
{
  return self->_presentationAttributesHash;
}

- (PersonalizedCompoundItem)compoundItem
{
  return self->_compoundItem;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (id)feature
{
  self->_featureGivenToVectorKit = 1;
  return self->_customFeature;
}

- (MKMapItem)mapItem
{
  return [(PersonalizedCompoundItem *)self->_compoundItem mapItem];
}

- (ParkedCar)parkedCar
{
  return [(PersonalizedCompoundItem *)self->_compoundItem parkedCar];
}

- (SearchResult)searchResult
{
  return [(PersonalizedCompoundItem *)self->_compoundItem searchResult];
}

- (VKLabelMarker)sourceLabelMarker
{
  return [(PersonalizedCompoundItem *)self->_compoundItem sourceLabelMarker];
}

- (AddressBookAddress)address
{
  return [(PersonalizedCompoundItem *)self->_compoundItem address];
}

- (SearchDotPlace)searchDotPlace
{
  return [(PersonalizedCompoundItem *)self->_compoundItem searchDotPlace];
}

- (PersonalizedItemStyleAttributesAdornment)styleAttributes
{
  return [(PersonalizedCompoundItem *)self->_compoundItem styleAttributes];
}

- (PersonalizedItem)personalizedItem
{
  return (PersonalizedItem *)self->_compoundItem;
}

- (BOOL)isMarkedLocation
{
  uint64_t v2 = [(PersonalizedCompoundItem *)self->_compoundItem keys];
  v3 = [(id)v2 anyObject];

  objc_opt_class();
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

- (id)debugDictionary
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = [(POIAnnotation *)self description];
  [v3 setObject:v4 forKeyedSubscript:@"self"];

  [v3 setObject:self->_text forKeyedSubscript:@"title"];
  [v3 setObject:self->_subtext forKeyedSubscript:@"subtitle"];
  v5 = [(GEOFeatureStyleAttributes *)self->_styleAttributes description];
  [v3 setObject:v5 forKeyedSubscript:@"styleAttributes"];

  v6 = [(POIAnnotation *)self address];
  id v7 = [v6 addressValue];
  uint64_t v8 = [v7 description];
  v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"(null)";
  }
  [v3 setObject:v10 forKeyedSubscript:@"address"];

  id v11 = [v3 copy];

  return v11;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (BOOL)showsBalloonCallout
{
  return self->_showsBalloonCallout;
}

- (NSString)title
{
  return self->_text;
}

- (NSString)subtitle
{
  return self->_subtext;
}

- (BOOL)isLabelPOI
{
  return self->_isLabelPOI;
}

- (BOOL)isVenueOrBuilding
{
  return self->_isVenueOrBuilding;
}

@end