@interface TransitSignViewState
- (BOOL)isEqual:(id)a3;
- (MKArtworkImageSource)imageSource;
- (NSArray)clusteredRouteOptionLabelItems;
- (NSArray)incidents;
- (NSAttributedString)incidentAttributedString;
- (NSAttributedString)majorAttributedString;
- (NSAttributedString)minorAttributedString;
- (NSAttributedString)tertiaryAttributedString;
- (void)setClusteredRouteOptionLabelItems:(id)a3;
- (void)setImageSource:(id)a3;
- (void)setIncidentAttributedString:(id)a3;
- (void)setIncidents:(id)a3;
- (void)setMajorAttributedString:(id)a3;
- (void)setMinorAttributedString:(id)a3;
- (void)setTertiaryAttributedString:(id)a3;
@end

@implementation TransitSignViewState

- (BOOL)isEqual:(id)a3
{
  v4 = (TransitSignViewState *)a3;
  if (self == v4)
  {
    unsigned __int8 v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = [(TransitSignViewState *)v7 imageSource];
      v9 = [(TransitSignViewState *)self imageSource];
      if ([v8 isEqual:v9])
      {
        v10 = [(TransitSignViewState *)v7 majorAttributedString];
        v11 = [(TransitSignViewState *)self majorAttributedString];
        if ([v10 isEqualToAttributedString:v11])
        {
          v12 = [(TransitSignViewState *)v7 minorAttributedString];
          v13 = [(TransitSignViewState *)self minorAttributedString];
          if ([v12 isEqualToAttributedString:v13])
          {
            v14 = [(TransitSignViewState *)v7 tertiaryAttributedString];
            v24 = [(TransitSignViewState *)self tertiaryAttributedString];
            v25 = v14;
            if ([v14 isEqualToAttributedString:v24])
            {
              v15 = [(TransitSignViewState *)v7 incidentAttributedString];
              v22 = [(TransitSignViewState *)self incidentAttributedString];
              v23 = v15;
              if ([v15 isEqualToAttributedString:v22])
              {
                v16 = [(TransitSignViewState *)v7 incidents];
                v20 = [(TransitSignViewState *)self incidents];
                v21 = v16;
                if ([v16 isEqualToArray:v20])
                {
                  v19 = [(TransitSignViewState *)v7 clusteredRouteOptionLabelItems];
                  v17 = [(TransitSignViewState *)self clusteredRouteOptionLabelItems];
                  unsigned __int8 v6 = [v19 isEqualToArray:];
                }
                else
                {
                  unsigned __int8 v6 = 0;
                }
              }
              else
              {
                unsigned __int8 v6 = 0;
              }
            }
            else
            {
              unsigned __int8 v6 = 0;
            }
          }
          else
          {
            unsigned __int8 v6 = 0;
          }
        }
        else
        {
          unsigned __int8 v6 = 0;
        }
      }
      else
      {
        unsigned __int8 v6 = 0;
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }

  return v6;
}

- (MKArtworkImageSource)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(id)a3
{
}

- (NSAttributedString)majorAttributedString
{
  return self->_majorAttributedString;
}

- (void)setMajorAttributedString:(id)a3
{
}

- (NSAttributedString)minorAttributedString
{
  return self->_minorAttributedString;
}

- (void)setMinorAttributedString:(id)a3
{
}

- (NSAttributedString)tertiaryAttributedString
{
  return self->_tertiaryAttributedString;
}

- (void)setTertiaryAttributedString:(id)a3
{
}

- (NSAttributedString)incidentAttributedString
{
  return self->_incidentAttributedString;
}

- (void)setIncidentAttributedString:(id)a3
{
}

- (NSArray)incidents
{
  return self->_incidents;
}

- (void)setIncidents:(id)a3
{
}

- (NSArray)clusteredRouteOptionLabelItems
{
  return self->_clusteredRouteOptionLabelItems;
}

- (void)setClusteredRouteOptionLabelItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusteredRouteOptionLabelItems, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_incidentAttributedString, 0);
  objc_storeStrong((id *)&self->_tertiaryAttributedString, 0);
  objc_storeStrong((id *)&self->_minorAttributedString, 0);
  objc_storeStrong((id *)&self->_majorAttributedString, 0);

  objc_storeStrong((id *)&self->_imageSource, 0);
}

@end