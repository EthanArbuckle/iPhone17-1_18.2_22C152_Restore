@interface GEOFeatureStyleAttributes
+ (id)addStopStyleAttributes;
+ (id)currentLocationStyleAttributes;
+ (id)multipleWaypointsStyleAttributes;
+ (id)shareETAAdvisoryStyleAttributes;
+ (id)styleAttributesForSearchResult:(id)a3;
@end

@implementation GEOFeatureStyleAttributes

+ (id)currentLocationStyleAttributes
{
  id v2 = [objc_alloc((Class)a1) initWithAttributes:65654, 0, 0];

  return v2;
}

+ (id)addStopStyleAttributes
{
  id v2 = [objc_alloc((Class)a1) initWithAttributes:65654, 1, 0];

  return v2;
}

+ (id)multipleWaypointsStyleAttributes
{
  id v2 = [objc_alloc((Class)a1) initWithAttributes:65654, 2, 0];

  return v2;
}

+ (id)shareETAAdvisoryStyleAttributes
{
  id v2 = [objc_alloc((Class)a1) initWithAttributes:65618, 41, 0];

  return v2;
}

+ (id)styleAttributesForSearchResult:(id)a3
{
  id v3 = a3;
  switch((unint64_t)[v3 customizedLocationType])
  {
    case 1uLL:
      uint64_t v4 = +[GEOFeatureStyleAttributes homeStyleAttributes];
      goto LABEL_16;
    case 2uLL:
      uint64_t v4 = +[GEOFeatureStyleAttributes workStyleAttributes];
      goto LABEL_16;
    case 3uLL:
      uint64_t v4 = +[GEOFeatureStyleAttributes schoolStyleAttributes];
      goto LABEL_16;
    case 4uLL:
      uint64_t v4 = +[GEOFeatureStyleAttributes sharedLocationStyleAttributes];
      goto LABEL_16;
    case 5uLL:
      uint64_t v4 = +[GEOFeatureStyleAttributes parkedCarStyleAttributes];
LABEL_16:
      id v12 = (id)v4;
      goto LABEL_17;
    default:
      v5 = [v3 mapItem];
      v6 = [v5 _styleAttributes];
      id v7 = [v6 copy];

      v8 = [v3 locationOfInterest];
      if (v8)
      {
        unsigned __int8 v9 = [v7 hasAttributes];

        if ((v9 & 1) == 0)
        {
          uint64_t v18 = +[GEOFeatureStyleAttributes frequentLocationStyleAttributes];
LABEL_28:
          id v12 = (id)v18;
          goto LABEL_29;
        }
      }
      v10 = [v3 mapItem];
      v11 = [v10 place];

      if (!v11)
      {
        uint64_t v18 = +[GEOFeatureStyleAttributes markerStyleAttributes];
        goto LABEL_28;
      }
      id v12 = v7;
      if (([v12 hasAttributes] & 1) == 0)
      {
        v13 = [v3 place];
        uint64_t v14 = +[GEOFeatureStyleAttributes styleAttributesForPlace:v13];

        id v12 = (id)v14;
      }
      unsigned int v15 = [v12 poiType];
      if ([v3 isFrequentLocation] && (v15 == 348 || v15 == -1))
      {
        uint64_t v16 = +[GEOFeatureStyleAttributes frequentLocationStyleAttributes];
LABEL_24:
        v19 = (void *)v16;

        id v12 = v19;
        goto LABEL_25;
      }
      if ([v12 isLabelPOI] && objc_msgSend(v3, "isPartOfMultipleResultsSet"))
      {
        uint64_t v16 = +[GEOFeatureStyleAttributes markerStyleAttributes];
        goto LABEL_24;
      }
LABEL_25:
      v20 = [v3 mapItem];
      v21 = [v20 _geoMapItem];
      unsigned int v22 = [v21 isDisputed];

      if (v22)
      {
        uint64_t v23 = 0x100000016;
        [v12 replaceAttributes:&v23 count:1];
      }
LABEL_29:

LABEL_17:
      return v12;
  }
}

@end