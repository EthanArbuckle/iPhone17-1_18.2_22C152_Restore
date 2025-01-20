@interface DMDConfigurationSourceRepresentation
- (DMDConfigurationSourceRepresentation)initWithConfigurationSource:(id)a3;
- (DMFReportingRequirements)reportingRequirements;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)machServiceName;
- (NSString)organizationIdentifier;
- (NSXPCListenerEndpoint)listenerEndpoint;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setListenerEndpoint:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setReportingRequirements:(id)a3;
@end

@implementation DMDConfigurationSourceRepresentation

- (DMDConfigurationSourceRepresentation)initWithConfigurationSource:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DMDConfigurationSourceRepresentation;
  v5 = [(DMDConfigurationSourceRepresentation *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 organizationIdentifier];
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 displayName];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    uint64_t v12 = [v4 machServiceName];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v12;

    uint64_t v14 = [v4 listenerEndpoint];
    listenerEndpoint = v5->_listenerEndpoint;
    v5->_listenerEndpoint = (NSXPCListenerEndpoint *)v14;

    uint64_t v16 = [v4 reportingRequirements];
    reportingRequirements = v5->_reportingRequirements;
    v5->_reportingRequirements = (DMFReportingRequirements *)v16;
  }
  return v5;
}

- (NSString)description
{
  v5[0] = @"identifier";
  v5[1] = @"displayName";
  v5[2] = @"machServiceName";
  v2 = +[NSArray arrayWithObjects:v5 count:3];
  v3 = DMFObjectDescriptionWithProperties();

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v5[0] = @"identifier";
  v5[1] = @"displayName";
  v5[2] = @"machServiceName";
  void v5[3] = @"listenerEndpoint";
  v5[4] = @"reportingRequirements";
  v2 = +[NSArray arrayWithObjects:v5 count:5];
  v3 = DMFObjectDescriptionWithProperties();

  return (NSString *)v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
}

- (DMFReportingRequirements)reportingRequirements
{
  return self->_reportingRequirements;
}

- (void)setReportingRequirements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingRequirements, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end