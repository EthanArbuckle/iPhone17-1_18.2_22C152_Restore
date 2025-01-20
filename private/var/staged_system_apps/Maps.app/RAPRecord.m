@interface RAPRecord
- (GEORPRapResponse)rapResponse;
- (MKMapItem)mapItem;
- (NSDate)dateOfReportCreation;
- (NSString)communityIdentifier;
- (NSString)countryCodeUponCreation;
- (NSString)reportID;
- (NSString)reportSummary;
- (NSString)reportTitle;
- (RAPRecord)initWithReportID:(id)a3 reportType:(int)a4 reportSummary:(id)a5 reportTitle:(id)a6 dateOfReportCreation:(id)a7 countryCodeUponCreation:(id)a8 reportStatus:(signed __int16)a9 contentData:(id)a10 communityIdentifier:(id)a11 rapResponse:(id)a12;
- (RapUserProfileRecord)contentData;
- (id)debugDescription;
- (int)clientRevision;
- (int)reportType;
- (signed)reportStatus;
- (void)setClientRevision:(int)a3;
- (void)setContentData:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setRapResponse:(id)a3;
- (void)setReportStatus:(signed __int16)a3;
@end

@implementation RAPRecord

- (RAPRecord)initWithReportID:(id)a3 reportType:(int)a4 reportSummary:(id)a5 reportTitle:(id)a6 dateOfReportCreation:(id)a7 countryCodeUponCreation:(id)a8 reportStatus:(signed __int16)a9 contentData:(id)a10 communityIdentifier:(id)a11 rapResponse:(id)a12
{
  id v34 = a3;
  id v35 = a5;
  id v18 = a6;
  id v33 = a7;
  id v19 = a8;
  id v32 = a10;
  id v31 = a11;
  id v20 = a12;
  v36.receiver = self;
  v36.super_class = (Class)RAPRecord;
  v21 = [(RAPRecord *)&v36 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_reportID, a3);
    v22->_reportType = a4;
    v23 = (NSString *)[v35 copy];
    reportSummary = v22->_reportSummary;
    v22->_reportSummary = v23;

    v25 = (NSString *)[v18 copy];
    reportTitle = v22->_reportTitle;
    v22->_reportTitle = v25;

    objc_storeStrong((id *)&v22->_dateOfReportCreation, a7);
    v27 = (NSString *)[v19 copy];
    countryCodeUponCreation = v22->_countryCodeUponCreation;
    v22->_countryCodeUponCreation = v27;

    v22->_reportStatus = a9;
    objc_storeStrong((id *)&v22->_contentData, a10);
    objc_storeStrong((id *)&v22->_communityIdentifier, a11);
    objc_storeStrong((id *)&v22->_rapResponse, a12);
    v22->_clientRevision = 1;
  }

  return v22;
}

- (id)debugDescription
{
  v3 = [(RAPRecord *)self reportID];
  uint64_t v4 = [(RAPRecord *)self reportType];
  if (v4 >= 0x16)
  {
    v5 = +[NSString stringWithFormat:@"(unknown: %i)", v4];
  }
  else
  {
    v5 = off_1012EC710[(int)v4];
  }
  v6 = [(RAPRecord *)self reportSummary];
  v7 = [(RAPRecord *)self reportTitle];
  v8 = [(RAPRecord *)self dateOfReportCreation];
  v9 = [(RAPRecord *)self countryCodeUponCreation];
  v10 = +[NSNumber numberWithShort:[(RAPRecord *)self reportStatus]];
  v11 = +[NSString stringWithFormat:@"Report ID: %@, Report type: %@, Report summary: %@, Report title: %@, Report creation cate: %@, Report country code: %@, Report status: %@", v3, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (int)reportType
{
  return self->_reportType;
}

- (NSString)reportID
{
  return self->_reportID;
}

- (NSString)reportSummary
{
  return self->_reportSummary;
}

- (NSString)reportTitle
{
  return self->_reportTitle;
}

- (NSDate)dateOfReportCreation
{
  return self->_dateOfReportCreation;
}

- (NSString)countryCodeUponCreation
{
  return self->_countryCodeUponCreation;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (RapUserProfileRecord)contentData
{
  return self->_contentData;
}

- (void)setContentData:(id)a3
{
}

- (signed)reportStatus
{
  return self->_reportStatus;
}

- (void)setReportStatus:(signed __int16)a3
{
  self->_reportStatus = a3;
}

- (int)clientRevision
{
  return self->_clientRevision;
}

- (void)setClientRevision:(int)a3
{
  self->_clientRevision = a3;
}

- (NSString)communityIdentifier
{
  return self->_communityIdentifier;
}

- (GEORPRapResponse)rapResponse
{
  return self->_rapResponse;
}

- (void)setRapResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapResponse, 0);
  objc_storeStrong((id *)&self->_communityIdentifier, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_countryCodeUponCreation, 0);
  objc_storeStrong((id *)&self->_dateOfReportCreation, 0);
  objc_storeStrong((id *)&self->_reportTitle, 0);
  objc_storeStrong((id *)&self->_reportSummary, 0);

  objc_storeStrong((id *)&self->_reportID, 0);
}

@end