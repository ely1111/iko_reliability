final personGroups = {
  'O': 'PRODSUP',
  'M': 'MECHSUP',
  'E': 'ELECTSUP',
};

final freqUnitToDays = {
  'D': 1,
  'W': 7,
  'M': 30,
  'Y': 365,
};

const workType = {
  'PPM': 'Preventive Maintenance',
  'CAL': 'Calibration',
  'ENV': 'Environmental',
  'HKG': 'Housekeeping',
  'INR': 'Routine Inspection',
  'LIF': 'Life Cycle',
  'LUB': 'Lubrication',
  'PDM': 'Predictive Maintenance',
  'PEM': 'Pre-emptive Maintenance',
  'PRO': 'Process Maintenance',
  'SAF': 'Safety',
};

const crafts = {
  'E': 'Electrical',
  'M': 'Mechanical',
  'O': 'Production',
};

const craftCode = {
  'E': 'ELECT',
  'M': 'MECH-MW',
  'O': 'PROD',
};

final freqUnitToString = {
  'D': 'Days',
  'W': 'Weeks',
  'M': 'Months',
  'Y': 'Years',
};

final siteIDAndOrgID = {
  'AA': 'IKO-CAD',
  'ANT': 'IKO-EU',
  'BA': 'IKO-CAD',
  'BL': 'IKO-US',
  'CA': 'IKO-US',
  'CAM': 'IKO-UK',
  'COM': 'IKO-EU',
  'GC': 'IKO-US',
  'GE': 'IKO-CAD',
  'GH': 'IKO-CAD',
  'GI': 'IKO-CAD',
  'GJ': 'IKO-CAD',
  'GK': 'IKO-CAD',
  'GM': 'IKO-CAD',
  'GP': 'IKO-CAD',
  'GR': 'IKO-CAD',
  'GS': 'IKO-US',
  'GV': 'IKO-US',
  'GX': 'IKO-CAD',
  'PBM': 'IKO-EU',
  'RAM': 'IKO-UK',
  'KLU': 'IKO-EU',
};

final siteIDAndDescription = {
  'AA': 'AA: IKO Brampton',
  'ANT': 'ANT: Antwerp',
  'BA': 'BA: Calgary',
  'BL': 'BL: Hagerstown',
  'CA': 'CA: Kankakee',
  'CAM': 'CAM: Appley Bridge',
  'COM': 'COM: Combronde',
  'GC': 'GC: Sumas',
  'GE': 'GE: Ashcroft',
  'GH': 'GH: Hawkesbury',
  'GI': 'GI: Madoc',
  'GJ': 'GJ: CRC Toronto',
  'GK': 'GK: IG Brampton',
  'GM': 'GM:IG High River',
  'GP': 'GP:CRC Brampton',
  'GR': 'GR: BramCal',
  'GS': 'GS: Sylacauga',
  'GV': 'GV: Hillsboro',
  'GX': 'GX: MaxiMix',
  'PBM': 'PBM: Senica',
  'RAM': 'RAM: Alconbury',
  'KLU': 'KLU: Klundert',
};

const tableHeaders = {
  'PM': [
    'SITEID',
    'PMNUM',
    'DESCRIPTION',
    'JPNUM',
    'WOSTATUS',
    'PERSONGROUP',
    'FREQUENCY',
    'FREQUNIT',
    'PMASSETWOGEN',
    'ASSETNUM',
    'ROUTE',
    'LEADTIME',
    'PRIORITY',
    'NEXTDATE',
    'ORGID',
    'TARGSTARTTIME',
    'IKO_PMHISTORYNOTES',
    'IKO_FMECA',
  ],
  'Route': [
    'ORGID',
    'SITEID',
    'ROUTE',
    'ROUTESTOPSBECOME',
    'DESCRIPTION',
  ],
  'Route_Stop': [
    'ORGID',
    'SITEID',
    'ROUTE',
    'ROUTESTOPID',
    'ASSETNUM',
    'JPNUM',
    'STOPSEQUENCE',
    'ASSETLOCORGID',
    'ASSETLOCSITEID',
  ],
  'JobPlan': [
    'ORGID',
    'SITEID',
    'JPNUM',
    'PLUSCREVNUM',
    'DESCRIPTION',
    'DESCRIPTION_LONGDESCRIPTION',
    'STATUS',
    'PERSONGROUP',
    'IKO_CONDITIONS',
    'PRIORITY',
    'IKO_WORKTYPE',
    'TEMPLATETYPE',
    'JPDURATION',
    'DOWNTIME',
    'INTERRUPTIBLE',
    'IKO_PMPACKAGE',
  ],
  'JobMaterial': [
    'JP_ORGID',
    'JP_SITEID',
    'JP_JPNUM',
    'PLUSCREVNUM',
    'ORGID',
    'SITEID',
    'ITEMNUM',
    'ITEMQTY',
    'ITEMSETID',
    'LOCATION',
    'STORELOCSITE',
    'COMPANY',
    'COST'
  ],
  'JobService': [
    'JP_ORGID',
    'JP_SITEID',
    'JP_JPNUM',
    'PLUSCREVNUM',
    'ORGID',
    'SITEID',
    'ITEMNUM',
    'ITEMQTY',
    'ITEMSETID',
    'COMPANY',
    'COST'
  ],
  'JobLabor': [
    'JP_ORGID',
    'JP_SITEID',
    'JP_JPNUM',
    'PLUSCREVNUM',
    'CRAFT',
    'LABORHRS',
    'QUANTITY',
    'ORGID',
  ],
  'JPASSETLINK': [
    'JP_ORGID',
    'JP_SITEID',
    'JP_JPNUM',
    'PLUSCREVNUM',
    'ASSETNUM',
    'ISDEFAULTASSETSP',
    'ORGID',
    'SITEID',
  ],
  'JobTask': [
    'ORGID',
    'SITEID',
    'JPNUM',
    'PLUSCREVNUM',
    'JPTASK',
    'PLUSCJPREVNUM',
    'METERNAME',
    'DESCRIPTION',
    'DESCRIPTION_LONGDESCRIPTION'
  ],
  'Asset': ['SITEID', 'ASSETNUM', 'IKO_PMPACKAGE'],
  'AssetMeter': ['SITEID', 'ASSETNUM', 'METERNAME'],
  'MeasurePoint': [
    'SITEID',
    'ASSETNUM',
    'METERNAME',
    'POINTNUM',
    'DESCRIPTION'
  ],
  'Meter': ['METERNAME', 'DESCRIPTION', 'METERTYPE', 'DOMAINID'],
  'MeasurePoint2': ['SITEID', 'POINTNUM', 'VALUE', 'JPNUM'],
};

Map<String, String> maximoServerDomains = {
  'PROD': 'http://nscandacmaxapp1.na.iko/maxrest/oslc/os/',
  'TEST': 'http://nsmaxim1app1.na.iko/maxrest/oslc/os/',
  'DEV': 'http://nscandacmaxdev1.na.iko/maxrest/oslc/os/',
  'MASDEV': 'https://dev.manage.dev.iko.max-it-eam.com/maximo/api/os/'
};

// TODO login management
Map<String, String> apiKeys = {
  'MASDEV': 'n075qt6edkgf931ike9pegc3vejbbtgalabbrrrf'
};
