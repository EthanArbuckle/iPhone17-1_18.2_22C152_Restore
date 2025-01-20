@interface RouteMarkerFormatterController
- (NSArray)routes;
- (NSString)selectedRouteCustomText;
- (RouteMarkerFormatterController)init;
- (RouteMarkerFormatterController)initWithDelegate:(id)a3;
- (RouteMarkerFormatterControllerDelegate)delegate;
- (RouteMarkerFormatterCustomText)customTextFormatter;
- (RouteMarkerFormatterETA)etaFormatter;
- (RouteMarkerFormatterRouteName)nameFormatter;
- (RouteMarkerFormatterTotal)totalTimeFormatter;
- (id)_formatterForStyle:(unint64_t)a3;
- (id)markerInfoForRoute:(id)a3;
- (id)markerInfosForLegsInRoute:(id)a3;
- (unint64_t)formattingStyle;
- (unint64_t)selectedRouteIndex;
- (void)_clearFormatters;
- (void)routeMarkerFormatterETA:(id)a3 didUpdateMarkerInfoForRoutes:(id)a4;
- (void)setCustomTextFormatter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEtaFormatter:(id)a3;
- (void)setFormattingStyle:(unint64_t)a3;
- (void)setNameFormatter:(id)a3;
- (void)setRoutes:(id)a3;
- (void)setRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4;
- (void)setSelectedRouteCustomText:(id)a3;
- (void)setSelectedRouteIndex:(unint64_t)a3;
- (void)setTotalTimeFormatter:(id)a3;
@end

@implementation RouteMarkerFormatterController

- (RouteMarkerFormatterController)init
{
  return [(RouteMarkerFormatterController *)self initWithDelegate:0];
}

- (RouteMarkerFormatterController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RouteMarkerFormatterController;
  v5 = [(RouteMarkerFormatterController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (id)markerInfoForRoute:(id)a3
{
  id v4 = a3;
  v5 = [(RouteMarkerFormatterController *)self _formatterForStyle:[(RouteMarkerFormatterController *)self formattingStyle]];
  v6 = [v5 markerInfoForRoute:v4];

  return v6;
}

- (id)markerInfosForLegsInRoute:(id)a3
{
  id v4 = a3;
  v5 = [(RouteMarkerFormatterController *)self _formatterForStyle:[(RouteMarkerFormatterController *)self formattingStyle]];
  if (objc_opt_respondsToSelector())
  {
    v6 = [v5 markerInfosForLegsInRoute:v4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setRoutes:(id)a3
{
  id v5 = a3;
  if ([v5 count]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(RouteMarkerFormatterController *)self setRoutes:v5 selectedRouteIndex:v4];
}

- (void)setRoutes:(id)a3 selectedRouteIndex:(unint64_t)a4
{
  v6 = (NSArray *)a3;
  routes = self->_routes;
  v11 = v6;
  if (routes != v6 && (unsigned int v8 = [(NSArray *)routes isEqualToArray:v6], v6 = v11, !v8)
    || self->_selectedRouteIndex != a4)
  {
    v9 = (NSArray *)[(NSArray *)v6 copy];
    v10 = self->_routes;
    self->_routes = v9;

    self->_selectedRouteIndex = a4;
    [(RouteMarkerFormatterController *)self _clearFormatters];
    v6 = v11;
  }
}

- (void)setSelectedRouteIndex:(unint64_t)a3
{
  if (self->_selectedRouteIndex != a3)
  {
    self->_selectedRouteIndex = a3;
    id v4 = [(RouteMarkerFormatterController *)self totalTimeFormatter];
    [v4 setSelectedRouteIndex:a3];
  }
}

- (void)setSelectedRouteCustomText:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  selectedRouteCustomText = self->_selectedRouteCustomText;
  self->_selectedRouteCustomText = v4;

  customTextFormatter = self->_customTextFormatter;
  self->_customTextFormatter = 0;
}

- (void)_clearFormatters
{
  totalTimeFormatter = self->_totalTimeFormatter;
  self->_totalTimeFormatter = 0;

  etaFormatter = self->_etaFormatter;
  self->_etaFormatter = 0;

  customTextFormatter = self->_customTextFormatter;
  self->_customTextFormatter = 0;
}

- (id)_formatterForStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id v5 = [(RouteMarkerFormatterController *)self totalTimeFormatter];
      goto LABEL_9;
    case 2uLL:
      id v5 = [(RouteMarkerFormatterController *)self etaFormatter];
      goto LABEL_9;
    case 3uLL:
      id v5 = [(RouteMarkerFormatterController *)self nameFormatter];
      goto LABEL_9;
    case 4uLL:
      id v5 = [(RouteMarkerFormatterController *)self customTextFormatter];
LABEL_9:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
}

- (RouteMarkerFormatterTotal)totalTimeFormatter
{
  totalTimeFormatter = self->_totalTimeFormatter;
  if (!totalTimeFormatter)
  {
    uint64_t v4 = [[RouteMarkerFormatterTotal alloc] initWithRoutes:self->_routes selectedRouteIndex:[(RouteMarkerFormatterController *)self selectedRouteIndex]];
    id v5 = self->_totalTimeFormatter;
    self->_totalTimeFormatter = v4;

    totalTimeFormatter = self->_totalTimeFormatter;
  }

  return totalTimeFormatter;
}

- (RouteMarkerFormatterETA)etaFormatter
{
  etaFormatter = self->_etaFormatter;
  if (!etaFormatter)
  {
    uint64_t v4 = [RouteMarkerFormatterETA alloc];
    id v5 = +[MNNavigationService sharedService];
    v6 = [(RouteMarkerFormatterETA *)v4 initWithNavigationService:v5];
    v7 = self->_etaFormatter;
    self->_etaFormatter = v6;

    [(RouteMarkerFormatterETA *)self->_etaFormatter setDelegate:self];
    etaFormatter = self->_etaFormatter;
  }

  return etaFormatter;
}

- (RouteMarkerFormatterRouteName)nameFormatter
{
  nameFormatter = self->_nameFormatter;
  if (!nameFormatter)
  {
    uint64_t v4 = [[RouteMarkerFormatterRouteName alloc] initWithRoutes:self->_routes selectedRouteIndex:[(RouteMarkerFormatterController *)self selectedRouteIndex]];
    id v5 = self->_nameFormatter;
    self->_nameFormatter = v4;

    nameFormatter = self->_nameFormatter;
  }

  return nameFormatter;
}

- (RouteMarkerFormatterCustomText)customTextFormatter
{
  customTextFormatter = self->_customTextFormatter;
  if (!customTextFormatter)
  {
    uint64_t v4 = [RouteMarkerFormatterCustomText alloc];
    routes = self->_routes;
    unint64_t v6 = [(RouteMarkerFormatterController *)self selectedRouteIndex];
    v7 = [(RouteMarkerFormatterController *)self selectedRouteCustomText];
    unsigned int v8 = [(RouteMarkerFormatterCustomText *)v4 initWithRoutes:routes selectedRouteIndex:v6 customSelectedRouteText:v7];
    v9 = self->_customTextFormatter;
    self->_customTextFormatter = v8;

    customTextFormatter = self->_customTextFormatter;
  }

  return customTextFormatter;
}

- (void)routeMarkerFormatterETA:(id)a3 didUpdateMarkerInfoForRoutes:(id)a4
{
  id v6 = a4;
  if ((id)[(RouteMarkerFormatterController *)self formattingStyle] == (id)2)
  {
    id v5 = [(RouteMarkerFormatterController *)self delegate];
    [v5 routeMarkerFormatterController:self didUpdateMarkerInfoForRoutes:v6];
  }
}

- (unint64_t)formattingStyle
{
  return self->_formattingStyle;
}

- (void)setFormattingStyle:(unint64_t)a3
{
  self->_formattingStyle = a3;
}

- (NSString)selectedRouteCustomText
{
  return self->_selectedRouteCustomText;
}

- (RouteMarkerFormatterControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteMarkerFormatterControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)routes
{
  return self->_routes;
}

- (unint64_t)selectedRouteIndex
{
  return self->_selectedRouteIndex;
}

- (void)setTotalTimeFormatter:(id)a3
{
}

- (void)setEtaFormatter:(id)a3
{
}

- (void)setNameFormatter:(id)a3
{
}

- (void)setCustomTextFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTextFormatter, 0);
  objc_storeStrong((id *)&self->_nameFormatter, 0);
  objc_storeStrong((id *)&self->_etaFormatter, 0);
  objc_storeStrong((id *)&self->_totalTimeFormatter, 0);
  objc_storeStrong((id *)&self->_routes, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_selectedRouteCustomText, 0);
}

@end